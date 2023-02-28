package com.ruoyi.bkmgr.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: wq
 * @since: 2023/1/21
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookIndexInfoVo
{

    private long userTotalCount;
    private long bookTotalCount;
    private long bookTypeTotalCount;

    private long borrowRecordCount;
}
