package com.ruoyi.bkmgr.domain.dto;

import lombok.Data;

import java.util.Date;

/**
 * @author 王权
 * @since 2023/2/11
 */

@Data
public class BorrowRecordQueryDto
{

    private String bookName;

    private Date startBorrowTime;

    private Date endBorrowTime;

    private Date startReturnTime;

    private Date endReturnTime;


    private String borrowUser;

    private String returnUser;

    private String updateBy;

    private Date updateTime;

    private int isReturn;
}
