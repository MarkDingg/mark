package com.ruoyi.bkmgr.domain.vo;

import com.ruoyi.bkmgr.common.BaseVo;
import lombok.Data;

/**
 * @author 王权
 * @since 2023/2/15
 */
@Data
public class BookCommentVo extends BaseVo
{

    private Long id;

    /**
     * 图书id
     */
    private Long bookId;

    /**
     * 用户id
     */
    private Long userId;

    private String userName;

    private String userAvatar;
    /**
     * 评论
     */
    private String comment;

    /**
     * 推荐指数
     */
    private String star;
}
