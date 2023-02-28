package com.ruoyi.bkmgr.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author: wq
 * @since: 2023/2/4
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BorrowRecord extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 图书id
     */
    @Excel(name = "图书id")
    private Long bookId;

    /**
     * 借用时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "借用时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date borrowTime;

    /**
     * 归还时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "归还时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date returnTime;

    /**
     * 借用人
     */
    @Excel(name = "借用人")
    private Long borrowUser;

    /**
     * 归还人
     */
    @Excel(name = "归还人")
    private Long returnUser;
}
