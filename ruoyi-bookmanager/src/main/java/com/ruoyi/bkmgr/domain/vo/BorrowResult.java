package com.ruoyi.bkmgr.domain.vo;

import lombok.Data;

import java.util.List;

/**
 * @author: wq
 * @since: 2023/2/4
 */
@Data
public class BorrowResult {
    private long successCount;
    private List<String> errorMsgList;
    private String errorMsg;
}
