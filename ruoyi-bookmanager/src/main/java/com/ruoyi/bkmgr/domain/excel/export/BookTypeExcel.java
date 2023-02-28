package com.ruoyi.bkmgr.domain.excel.export;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * @author 王权
 * @since 2023/2/10
 */

@Data
public class BookTypeExcel
{

    /**
     * 图书类型
     */
    @Excel(name = "图书类型")
    private String type;

    /**
     * 描述
     */
    @Excel(name = "描述")
    private String desc;


    /**
     * 更新者
     */

    @Excel(name = "最后操作人", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private String updateBy;

    /**
     * 更新时间
     */
    @Excel(name = "最后更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
}
