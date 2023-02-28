package com.ruoyi.bkmgr.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 王权
 * @since 2023/2/8
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookTypeMapping
{
    private Long bookId;
    private Long typeId;
}
