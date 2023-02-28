package com.ruoyi.bkmgr.mapper;

import java.util.List;

import com.ruoyi.bkmgr.domain.BookType;
import com.ruoyi.bkmgr.domain.BookTypeMapping;
import com.ruoyi.bkmgr.domain.dto.BookTypeDto;
import org.apache.ibatis.annotations.Param;

/**
 * 图书类型Mapper接口
 *
 * @author wq
 * @date 2023-01-17
 */
public interface BookTypeMapper
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
     * 删除图书类型
     *
     * @param typeId 图书类型主键
     * @return 结果
     */
    public int deleteBookTypeByTypeId(Long typeId);

    /**
     * 批量删除图书类型
     *
     * @param typeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBookTypeByTypeIds(Long[] typeIds);

    /**
     * 删除与图书关联类型
     *
     * @param typeIds 类型id
     * @return 结果
     */
    public int deleteBookRelatedTypes(Long[] typeIds);

    /**
     * 根据图书id查询图书类型
     *
     * @param bookId 图书id
     * @return 图书类型列表
     */
    List<BookType> selectBookTypesByBookId(@Param("id") Long bookId);

    /**
     * 查询图书类型个数
     *
     * @return 个数
     */
    long selectCount();

    /**
     * 查询图书累心
     *
     * @param bookIds 图书id
     * @return 图书类型集合
     */
    List<BookTypeDto> selectBooksTypes(List<Long> bookIds);

    /**
     * 保存图书类型
     *
     * @param bookTypeMappings 图书类型
     */
    void insertBookTypes(List<BookTypeMapping> bookTypeMappings);

    /**
     * 删除图书类型
     *
     * @param bookIds 图书id
     */
    void deleteBookTypes(Long[] bookIds);
}
