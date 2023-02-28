package com.ruoyi.bkmgr.service.impl;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import com.ruoyi.bkmgr.domain.BookType;
import com.ruoyi.bkmgr.domain.BookTypeMapping;
import com.ruoyi.bkmgr.domain.BorrowRecord;
import com.ruoyi.bkmgr.domain.dto.BookDto;
import com.ruoyi.bkmgr.domain.dto.BookReturnDto;
import com.ruoyi.bkmgr.domain.excel.export.BookExcel;
import com.ruoyi.bkmgr.service.IBookTypeService;
import com.ruoyi.bkmgr.service.IBorrowRecordService;
import com.ruoyi.bkmgr.util.FillUtil;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.AssertUtil;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.ruoyi.bkmgr.mapper.BookMapper;
import com.ruoyi.bkmgr.domain.Book;
import com.ruoyi.bkmgr.service.IBookService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 图书信息Service业务层处理
 *
 * @author wq
 * @date 2023-01-17
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class BookServiceImpl implements IBookService
{
    private final BookMapper bookMapper;
    private final IBookTypeService bookTypeService;
    private final IBorrowRecordService borrowRecordService;

    private final RedisCache redisCache;

    /**
     * 查询图书信息
     *
     * @param bookId 图书信息主键
     * @return 图书信息
     */
    @Override
    public Book selectBookByBookId(Long bookId)
    {
        return bookMapper.selectBookByBookId(bookId);
    }

    /**
     * 查询图书信息列表
     *
     * @param book 图书信息
     * @return 图书信息
     */
    @Override
    public List<Book> selectBookList(Book book)
    {
        return bookMapper.selectBookList(book);
    }

    /**
     * 新增图书信息
     *
     * @param book 图书信息
     * @return 结果
     */
    @Override
    public int insertBook(Book book)
    {
        FillUtil.insertFill(book);
        return bookMapper.insertBook(book);
    }

    /**
     * 修改图书信息
     *
     * @param book 图书信息
     * @return 结果
     */
    @Override
    @Transactional
    public int updateBook(Book book)
    {
        FillUtil.updateFill(book);
        List<Long> bookTypes = book.getBookTypeIds();
        bookTypeService.deleteBookTypes(new Long[]{book.getBookId()});
        if (!StringUtils.isEmpty(bookTypes))
        {
            List<BookTypeMapping> bookTypeMappings = bookTypes.stream()
                    .map(id -> new BookTypeMapping(book.getBookId(), id))
                    .collect(Collectors.toList());
            bookTypeService.saveBookTypes(bookTypeMappings);
        }
        return bookMapper.updateBook(book);
    }

    /**
     * 批量删除图书信息
     *
     * @param bookIds 需要删除的图书信息主键
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public String deleteBookByBookIds(Long[] bookIds)
    {
        int num = 0;
        StringBuilder msg = new StringBuilder();
        List<Book> books = this.bookMapper.selectBookListByBookIds(bookIds);
        if (StringUtils.isEmpty(books))
        {
            return "未找到删除图书";
        }
        List<BorrowRecord> notReturnedRecord = borrowRecordService.selectNotReturnedRecord(bookIds);
        Map<Long, BorrowRecord> recordMap = notReturnedRecord.stream()
                .collect(Collectors.toMap(BorrowRecord::getBookId, Function.identity(), (id1, id2) -> id1));
        for (Book book : books)
        {
            num++;
            msg.append(num)
                    .append(":")
                    .append("图书 ")
                    .append("《")
                    .append(book.getBookName())
                    .append("》");
            if (recordMap.containsKey(book.getBookId()))
            {
                msg.append(" 删除失败。")
                        .append(" 原因: <span style=\"color: red\">")
                        .append("图书已被借用")
                        .append("</span>")
                        .append("<br/>");
                continue;
            }
            msg.append(" 删除成功")
                    .append("<br/>");
            BookServiceImpl aopProxy = SpringUtils.getAopProxy(this);
            aopProxy.deleteBookAndBookRelatedType(book.getBookId());
            redisCache.deleteObject("bkmgr::indexInfo");
        }
        return msg.toString();
    }

    @Transactional(rollbackFor = Exception.class)
    public void deleteBookAndBookRelatedType(Long bookId)
    {
        this.bookTypeService.deleteBookTypes(new Long[]{bookId});
        bookMapper.deleteBookByBookIds(new Long[]{bookId});
    }

    /**
     * 删除图书信息信息
     *
     * @param bookId 图书信息主键
     * @return 结果
     */
    @Override
    public int deleteBookByBookId(Long bookId)
    {
        redisCache.deleteObject("bkmgr::indexInfo");
        return bookMapper.deleteBookByBookId(bookId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveBook(Book book)
    {
        Optional<Book> optionalBook = bookMapper.selectBookByNumber(book.getNumber());
        optionalBook.ifPresent(item ->
        {
            throw new BusinessException("添加失败:图书编号已存在");
        });
        List<Long> bookTypes = book.getBookTypeIds();
        this.insertBook(book);
        if (!StringUtils.isEmpty(bookTypes))
        {
            List<BookTypeMapping> bookTypeMappings = bookTypes.stream()
                    .map(id -> new BookTypeMapping(book.getBookId(), id))
                    .collect(Collectors.toList());
            bookTypeService.saveBookTypes(bookTypeMappings);
        }
        redisCache.deleteObject("bkmgr::indexInfo");

    }

    @Override
    public BookDto selectBookDetail(Long id)
    {
        Book book = this.selectBookByBookId(id);
        return Optional.ofNullable(book)
                .map(item ->
                {
                    BookDto bookDto = BeanUtils.convertBean(book, BookDto.class);
                    List<BookType> bookTypes = bookTypeService.selectBookTypes(id);
                    bookDto.setBookTypes(bookTypes);
                    return bookDto;
                })
                .orElse(new BookDto());
    }

    @Override
    public List<BookExcel> selectBookExportList(Book book)
    {
        List<Book> books = this.selectBookList(book);
        if (StringUtils.isEmpty(books))
        {
            return Collections.emptyList();
        }
        List<Long> bookIds = books.stream()
                .map(Book::getBookId)
                .collect(Collectors.toList());
        Map<Long, List<BookType>> booksTypes = bookTypeService.selectBooksTypes(bookIds);
        List<BookExcel> bookExcels = new ArrayList<>(books.size());
        for (Book bookItem : books)
        {
            BookExcel bookExcel = BeanUtils.convertBean(bookItem, BookExcel.class);
            List<BookType> bookTypes = booksTypes.get(bookExcel.getBookId());
            if (StringUtils.isEmpty(bookTypes))
            {
                bookExcel.setTypes(StringUtils.EMPTY);
            } else
            {
                String types = bookTypes.stream()
                        .map(BookType::getType)
                        .collect(Collectors.joining(","));
                bookExcel.setTypes(types);
            }
            bookExcels.add(bookExcel);
        }
        return bookExcels;

    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public String handleBookBorrow(String[] numbers)
    {
        if (StringUtils.isEmpty(numbers))
        {
            return "借用列表为空";
        }
        int num = 0;
        StringBuilder msg = new StringBuilder();
        // 排除掉一些被删除的图书
        List<Book> bookList = this.bookMapper.selectBookListByBookNumbers(numbers);
        Map<String, Book> actualBookMap = bookList.stream()
                .collect(Collectors.toMap(Book::getNumber, Function.identity()));

        Set<String> actualBookNumbers = actualBookMap.keySet();
        Set<String> sourceNumbers = new HashSet<>(Arrays.asList(numbers));
        sourceNumbers.removeAll(actualBookNumbers);
        if (StringUtils.isNotEmpty(sourceNumbers))
        {


            for (String number : sourceNumbers)
            {
                num++;
                msg.append(num)
                        .append(":")
                        .append("图书编号 ")
                        .append(number)
                        .append(" 借用失败")
                        .append(" 原因: <span style=\"color: red\">")
                        .append("当前图书不存在")
                        .append("</span>")
                        .append("<br/>");
            }

        }
        if (StringUtils.isEmpty(actualBookNumbers))
        {
            return msg.toString();
        }
        for (Book value : actualBookMap.values())
        {
            num++;
            msg.append(num)
                    .append(":")
                    .append("图书 ")
                    .append("《")
                    .append(value.getBookName())
                    .append("》");
            if (value.getInventory() >= 1)
            {
                try
                {
                    BorrowRecord borrowRecord = this.initBorrowRecord(value);
                    msg.append(" 借用成功")
                            .append("<br/>");
                    SpringUtils.getAopProxy(this)
                            .doBorrow(borrowRecord);
                    try
                    {
                        redisCache.deleteObject("bkmgr::indexInfo");

                    }
                    catch (Exception exception)
                    {
                        log.error("delete error", exception);
                    }
                    continue;
                }
                catch (Exception exception)
                {
                    msg.append(" 未知错误")
                            .append(" 原因: <span style=\"color: red\">")
                            .append("未知")
                            .append("</span>")
                            .append("<br/>");
                    continue;
                }

            }
            msg.append(" 借用失败")
                    .append(" 原因: <span style=\"color: red\">")
                    .append("当前图书库存不足")
                    .append("</span>")
                    .append("<br/>");
        }
        return msg.toString();
    }

    @Transactional(rollbackFor = Exception.class)
    void doBorrow(BorrowRecord borrowRecord)
    {
        this.borrowRecordService.batchSaveBorrowRecord(Collections.singletonList(borrowRecord));
        this.reduceInventory(borrowRecord.getBookId(), 1);
    }

    @Override
    public void reduceInventory(Long bookId, int reduceNum)
    {
        if (reduceNum < 1)
        {
            return;
        }
        AssertUtil.isNotNull(bookId, "减少失败:图书id不能为空");
        Book book = this.selectBookByBookId(bookId);
        AssertUtil.isNotNull(book, "减少失败:当前图书不存在");
        int inventory = book.getInventory();
        AssertUtil.isFalse(reduceNum > inventory, "减少失败:减少数量大于库存数量");
        book.setInventory(inventory - reduceNum);
        this.updateBook(book);
    }

    @Override
    public void incrementInventory(Long bookId, int incrementNum)
    {
        if (incrementNum < 1)
        {
            return;
        }
        AssertUtil.isNotNull(bookId, "减少失败:图书id不能为空");
        Book book = this.selectBookByBookId(bookId);
        AssertUtil.isNotNull(book, "减少失败:当前图书不存在");
        book.setInventory(book.getInventory() + incrementNum);
        this.updateBook(book);
    }

    @Override
    public boolean updateBookCover(Long bookId, String bookCover)
    {
        AssertUtil.isNotNull(bookId, "图书id不能为空");
        AssertUtil.isNotEmpty(bookCover, "封面不能为空");
        return this.bookMapper.updateBookCover(bookId, bookCover) == 1;
    }

    @Override
    public String handleBookReturn(List<BookReturnDto> returnDtos)
    {
        AssertUtil.isNotEmpty(returnDtos, "归还图书不能为空");
        StringBuilder resultMsg = new StringBuilder();
        int num = 0;
        for (BookReturnDto dto : returnDtos)
        {
            String bookName = dto.getBookName();
            Long recordId = dto.getRecordId();
            BorrowRecord borrowRecord = this.borrowRecordService.selectBorrowRecordById(recordId);
            num++;
            if (borrowRecord == null)
            {
                resultMsg.append(this.initMsg(num, bookName, "归还失败", "找不到当前借用记录"));
                continue;
            }

            if (!borrowRecord.getBorrowUser()
                    .equals(SecurityUtils.getUserId()))
            {
                resultMsg.append(this.initMsg(num, bookName, "归还失败", "不能归还他人图书"));
                continue;
            }

            if (borrowRecord.getReturnTime() != null)
            {
                resultMsg.append(this.initMsg(num, bookName, "归还失败", "当前图书已经被归还"));
                continue;
            }

            try
            {
                SpringUtils.getAopProxy(this)
                        .doReturnRecord(borrowRecord);
                resultMsg.append(this.initMsg(num, bookName, "归还成功", ""));
            }
            catch (Exception exception)
            {
                log.info("return bookName:{}, recordId:{} error", bookName, recordId);
                resultMsg.append(this.initMsg(num, bookName, "归还失败", "未知错误"));
            }

        }
        return resultMsg.toString();
    }

    @Transactional(rollbackFor = Exception.class)
    void doReturnRecord(BorrowRecord borrowRecord)
    {
        borrowRecord.setReturnTime(DateUtils.getNowDate());
        borrowRecord.setReturnUser(SecurityUtils.getUserId());
        this.borrowRecordService.updateBorrowRecord(borrowRecord);
        this.incrementInventory(borrowRecord.getBookId(), 1);
    }


    private String initMsg(int num, String bookName, String result, String reason)
    {
        StringBuilder msg = new StringBuilder();
        msg.append(num)
                .append(":")
                .append("图书 ")
                .append("《")
                .append(bookName)
                .append("》 ")
                .append(result);
        if (StringUtils.isNotEmpty(reason))
        {
            msg.append(" 原因: <span style=\"color: red\">")
                    .append(reason)
                    .append("</span>");
        }
        msg.append("<br/>");
        return msg.toString();
    }

    private BorrowRecord initBorrowRecord(Book borrowableBook)
    {
        BorrowRecord borrowRecord = BorrowRecord.builder()
                .borrowTime(DateUtils.getNowDate())
                .bookId(borrowableBook.getBookId())
                .borrowUser(SecurityUtils.getUserId())
                .build();
        FillUtil.insertFill(borrowRecord);
        return borrowRecord;
    }
}
