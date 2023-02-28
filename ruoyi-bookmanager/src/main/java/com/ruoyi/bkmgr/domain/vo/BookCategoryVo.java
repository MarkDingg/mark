package com.ruoyi.bkmgr.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author 王权
 * @since 2023/2/2
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookCategoryVo
{
    private List<String> xData;

    private List<Long> yData;
}
