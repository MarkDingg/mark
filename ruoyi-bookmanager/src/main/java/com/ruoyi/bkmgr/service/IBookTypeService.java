package com.ruoyi.bkmgr.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.bkmgr.domain.BookType;
import com.ruoyi.bkmgr.domain.BookTypeMapping;

/**
 * 图书类型Service接口
 *
 * @author wq
 * @date 2023-01-17
 */
public interface IBookTypeService
{
    /**
     * 查询图书类型
     *
     * @param typeId 图书类型主键
     * @return 图书类型
     */
    public BookType selectBookTypeByTypeId(Long typeId);

    /**
     * 查询图书类型列表
     *
     * @param bookType 图书类型
     * @return 图书类型集合
     */
    public List<BookType> selectBookTypeList(BookType bookType);

    /**
     * 新增图书类型
     *
     * @param bookType 图书类型
     * @return 结果
     */
    public int insertBookType(BookType bookType);

    /**
     * 修改图书类型
     *
     * @param bookType 图书类型
     * @return 结果
     */
    public int updateBookType(BookType bookType);

    /**
     * 批量删除图书类型
     *
     * @param typeIds 需要删除的图书类型主键集合
     * @return 结果
     */
    public int deleteBookTypeByTypeIds(Long[] typeIds);

    /**
     * 删除图书类型信息
     *
     * @param typeId 图书类型主键
     * @return 结果
     */
    public int deleteBookTypeByTypeId(Long typeId);


    /**
     * 根据图书id查询图书类型
     *
     * @param bookId 图书id
     * @return 图书类型列表
     */
    public List<BookType> selectBookTypes(Long bookId);

    /**
     * 批量查询图书类型
     *
     * @param bookIds 图书id
     * @return 图书类型 key为图书id value为图书类型集合
     */
    Map<Long, List<BookType>> selectBooksTypes(List<Long> bookIds);

    /**
     * 保存图书类型
     *
     * @param bookTypeMappings 图书类型映射
     */
    void saveBookTypes(List<BookTypeMapping> bookTypeMappings);

    /**
     * 删除图书类型
     *
     * @param bookIds 图书id
     */
    void deleteBookTypes(Long[] bookIds);
}
