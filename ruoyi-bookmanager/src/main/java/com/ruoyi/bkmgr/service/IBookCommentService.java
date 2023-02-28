package com.ruoyi.bkmgr.service;

import java.util.List;

import com.ruoyi.bkmgr.domain.BookComment;
import com.ruoyi.bkmgr.domain.dto.BookCommentDto;

/**
 * 图书评论Service接口
 *
 * @author wq
 * @date 2023-02-13
 */
public interface IBookCommentService
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
     * 批量删除图书评论
     *
     * @param ids 需要删除的图书评论主键集合
     * @return 结果
     */
    public int deleteBookCommentByIds(Long[] ids);

    /**
     * 删除图书评论信息
     *
     * @param id 图书评论主键
     * @return 结果
     */
    public int deleteBookCommentById(Long id);

    List<BookCommentDto> selectBookCommentListById(Long id);

    /**
     * 查询用户评论
     *
     * @param userId 用户Id
     * @return 评论列表
     */
    List<BookComment> selectBookCommentByUserId(Long userId);
}
