package com.ruoyi.bkmgr.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

/**
 * @author 王权
 * @since 2023/2/13
 */
@Data
public class BookComment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 图书id
     */
    private Long bookId;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 评论
     */
    private String comment;

    /**
     * 推荐指数
     */
    private int star;

    private long recordId;
}
