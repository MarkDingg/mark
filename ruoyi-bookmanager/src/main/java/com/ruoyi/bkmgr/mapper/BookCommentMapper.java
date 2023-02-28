package com.ruoyi.bkmgr.mapper;

import java.util.List;

import com.ruoyi.bkmgr.domain.BookComment;
import com.ruoyi.bkmgr.domain.dto.BookCommentDto;
import org.apache.ibatis.annotations.Param;

/**
 * 图书评论Mapper接口
 *
 * @author wq
 * @date 2023-02-13
 */
public interface BookCommentMapper
{
    /**
     * 查询图书评论
     *
     * @param id 图书评论主键
     * @return 图书评论
     */
    public BookComment selectBookCommentById(Long id);

    /**
     * 查询图书评论列表
     *
     * @param bookComment 图书评论
     * @return 图书评论集合
     */
    public List<BookComment> selectBookCommentList(BookComment bookComment);

    /**
     * 新增图书评论
     *
     * @param bookComment 图书评论
     * @return 结果
     */
    public int insertBookComment(BookComment bookComment);

    /**
     * 修改图书评论
     *
     * @param bookComment 图书评论
     * @return 结果
     */
    public int updateBookComment(BookComment bookComment);

    /**
     * 删除图书评论
     *
     * @param id 图书评论主键
     * @return 结果
     */
    public int deleteBookCommentById(Long id);

    /**
     * 批量删除图书评论
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBookCommentByIds(Long[] ids);

    /**
     * 根据图书id查询图书评论
     *
     * @param id 图书id
     * @return 图书评论列表
     */
    List<BookCommentDto> selectBookCommentByBookId(Long id);

    /**
     * 查询用户评论
     *
     * @param userId 用户Id
     * @return 评论列表
     */
    List<BookComment> selectBookCommentByUserId(Long userId);

    /**
     * 查询评论记录
     *
     * @param userId
     * @param recordId
     * @return
     */
    BookComment selectBookComment(@Param("userId") Long userId, @Param("recordId") long recordId);
}
