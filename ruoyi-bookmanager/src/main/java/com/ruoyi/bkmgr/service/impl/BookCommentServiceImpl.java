package com.ruoyi.bkmgr.service.impl;

import java.util.List;

import com.ruoyi.bkmgr.domain.dto.BookCommentDto;
import com.ruoyi.bkmgr.util.FillUtil;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.AssertUtil;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.bkmgr.mapper.BookCommentMapper;
import com.ruoyi.bkmgr.domain.BookComment;
import com.ruoyi.bkmgr.service.IBookCommentService;

/**
 * 图书评论Service业务层处理
 *
 * @author wq
 * @date 2023-02-13
 */
@Service
public class BookCommentServiceImpl implements IBookCommentService
{
    @Autowired
    private BookCommentMapper bookCommentMapper;

    /**
     * 查询图书评论
     *
     * @param id 图书评论主键
     * @return 图书评论
     */
    @Override
    public BookComment selectBookCommentById(Long id)
    {
        return bookCommentMapper.selectBookCommentById(id);
    }

    /**
     * 查询图书评论列表
     *
     * @param bookComment 图书评论
     * @return 图书评论
     */
    @Override
    public List<BookComment> selectBookCommentList(BookComment bookComment)
    {
        return bookCommentMapper.selectBookCommentList(bookComment);
    }

    /**
     * 新增图书评论
     *
     * @param bookComment 图书评论
     * @return 结果
     */
    @Override
    public int insertBookComment(BookComment bookComment)
    {

        BookComment comment = this.bookCommentMapper.selectBookComment(SecurityUtils.getUserId(),
                bookComment.getRecordId());
        if (comment != null)
        {
            throw new BusinessException("分享失败，当前记录已经分享");
        }
        FillUtil.insertFill(bookComment);
        bookComment.setUserId(SecurityUtils.getUserId());
        return bookCommentMapper.insertBookComment(bookComment);
    }

    /**
     * 修改图书评论
     *
     * @param bookComment 图书评论
     * @return 结果
     */
    @Override
    public int updateBookComment(BookComment bookComment)
    {
        bookComment.setUpdateTime(DateUtils.getNowDate());
        return bookCommentMapper.updateBookComment(bookComment);
    }

    /**
     * 批量删除图书评论
     *
     * @param ids 需要删除的图书评论主键
     * @return 结果
     */
    @Override
    public int deleteBookCommentByIds(Long[] ids)
    {
        return bookCommentMapper.deleteBookCommentByIds(ids);
    }

    /**
     * 删除图书评论信息
     *
     * @param id 图书评论主键
     * @return 结果
     */
    @Override
    public int deleteBookCommentById(Long id)
    {
        return bookCommentMapper.deleteBookCommentById(id);
    }

    @Override
    public List<BookCommentDto> selectBookCommentListById(Long id)
    {
        AssertUtil.isNotNull(id, "图书ID不能为空");
        return this.bookCommentMapper.selectBookCommentByBookId(id);
    }

    @Override
    public List<BookComment> selectBookCommentByUserId(Long userId)
    {
        return this.bookCommentMapper.selectBookCommentByUserId(userId);
    }
}
