package com.ruoyi.bkmgr.domain.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.bkmgr.common.BaseDto;
import lombok.Data;

import java.util.Date;

/**
 * @author: wq
 * @since: 2023/2/5
 */
@Data
public class BorrowRecordDto extends BaseDto
{
    /**
     * 主键
     */
    private Long id;

    /**
     * 图书id
     */
    private Long bookId;

    /**
     * 图书名称
     */
    private String bookName;

    /**
     * 借用时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date borrowTime;

    /**
     * 归还时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date returnTime;

    /**
     * 借用人ID
     */
    private Long borrowUser;

    /**
     * 借用人名字
     */
    private String borrowUserName;

    /**
     * 归还人
     */
    private String returnUser;


    /**
     * 归还人名称
     */
    private String returnUserName;

    private boolean disabled;
}
