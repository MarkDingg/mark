package com.ruoyi.bkmgr.domain.dto;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @author 王权
 * @since 2023/2/11
 */
@Data
public class BookReturnDto
{

    @NotNull(message = "借用记录ID不能为空")
    private Long recordId;
    @NotEmpty(message = "图书名不能为空")
    private String bookName;
}
