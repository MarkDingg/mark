package com.ruoyi.bkmgr.mapper;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import com.ruoyi.bkmgr.domain.Book;
import com.ruoyi.bkmgr.domain.dto.BookCategoryDto;
import org.apache.ibatis.annotations.Param;

/**
 * 图书信息Mapper接口
 *
 * @author wq
 * @date 2023-01-17
 */
public interface BookMapper {
    /**
     * 查询图书信息
     *
     * @param bookId 图书信息主键
     * @return 图书信息
     */
    public Book selectBookByBookId(Long bookId);

    /**
     * 查询图书信息列表
     *
     * @param book 图书信息
     * @return 图书信息集合
     */
    public List<Book> selectBookList(Book book);

    /**
     * 新增图书信息
     *
     * @param book 图书信息
     * @return 结果
     */
    public int insertBook(Book book);

    /**
     * 修改图书信息
     *
     * @param book 图书信息
     * @return 结果
     */
    public int updateBook(Book book);

    /**
     * 删除图书信息
     *
     * @param bookId 图书信息主键
     * @return 结果
     */
    public int deleteBookByBookId(Long bookId);

    /**
     * 批量删除图书信息
     *
     * @param bookIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBookByBookIds(Long[] bookIds);

    /**
     * 根据图书编号查询图书
     *
     * @param number 图书编号
     * @return 图书信息
     */
    public Optional<Book> selectBookByNumber(@Param("number") String number);

    /**
     * 查询图书类型分类
     *
     * @return 图书类型分类
     */
    public List<String> selectBookTypeCategory();

    /**
     * 查询图书个数
     *
     * @return 个数
     */
    long selectBookCount();

    /**
     * 查询图书分类
     *
     * @return 分类
     */
    List<BookCategoryDto> selectBookCategory();

    /**
     * 查询图书列表 根据id
     *
     * @param bookIds 根据id集合
     * @return 图书列表
     */
    List<Book> selectBookListByBookIds(Long[] bookIds);

    /**
     * 查询可借用图书
     *
     * @param booksId 图书id
     * @return 可借用图书列表
     */
    List<Book> selectBorrowableBooks(Set<Long> booksId);

    /**
     * 查询图书列表 根据图书编号
     *
     * @param numbers 编号集合
     * @return 图书列表
     */
    List<Book> selectBookListByBookNumbers(String[] numbers);

    /**
     * 修改图书封面
     *
     * @param bookId 图书id
     * @param bookCover 封面
     * @return 影响行数
     */
    int updateBookCover(@Param("bookId") Long bookId, @Param("bookCover") String bookCover);
}
