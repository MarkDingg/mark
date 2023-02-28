package com.ruoyi.bkmgr.service;

import java.util.List;

import com.ruoyi.bkmgr.domain.Book;
import com.ruoyi.bkmgr.domain.dto.BookDto;
import com.ruoyi.bkmgr.domain.dto.BookReturnDto;
import com.ruoyi.bkmgr.domain.excel.export.BookExcel;

/**
 * 图书信息Service接口
 *
 * @author wq
 * @date 2023-01-17
 */
public interface IBookService
{
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
     * 批量删除图书信息
     *
     * @param bookIds 需要删除的图书信息主键集合
     * @return 结果
     */
    public String deleteBookByBookIds(Long[] bookIds);

    /**
     * 删除图书信息信息
     *
     * @param bookId 图书信息主键
     * @return 结果
     */
    public int deleteBookByBookId(Long bookId);

    /**
     * 保存图书信息
     *
     * @param book 图书信息
     */
    void saveBook(Book book);

    /**
     * 查询图书详情信息
     *
     * @param id 图书id
     * @return 图书详情
     */
    BookDto selectBookDetail(Long id);

    /**
     * 查询导出列表
     *
     * @param book 查询条件
     * @return 列表
     */
    List<BookExcel> selectBookExportList(Book book);

    /**
     * 处理借用图书
     *
     * @param numbers 图书编号
     * @return 错
     */
    String handleBookBorrow(String[] numbers);

    /**
     * 减少 图书库存
     *
     * @param bookId    图书id
     * @param reduceNum 减少数量
     */
    void reduceInventory(Long bookId, int reduceNum);

    /**
     * 增加 图书库存
     *
     * @param bookId       图书id
     * @param incrementNum 增加数量
     */
    void incrementInventory(Long bookId, int incrementNum);

    /**
     * 修改图书封面
     *
     * @param bookId 图书id
     * @param avatar 封面
     * @return 是否成功修改
     */
    boolean updateBookCover(Long bookId, String avatar);

    /**
     * 处理图书归还业务
     *
     * @param returnDtos 借用记录id
     */
    String handleBookReturn(List<BookReturnDto> returnDtos);
}
