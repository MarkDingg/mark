package com.ruoyi.bkmgr.domain.excel.export;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author: wq
 * @since: 2023/2/3
 */
@Data
public class BookExcel {

    private Long bookId;

    /**
     * 图书名
     */
    @Excel(name = "图书名")
    private String bookName;

    /**
     * 作者
     */
    @Excel(name = "作者")
    private String author;

    /**
     * 图书编号
     */
    @Excel(name = "图书编号")
    private String number;

    /**
     * 出版社
     */
    @Excel(name = "出版社")
    private String publishingHouse;

    /**
     * 语言
     */
    @Excel(name = "语言")
    private String language;

    /**
     * 类型
     */
    @Excel(name = "类型")
    private String types;

    /**
     * 价格
     */
    @Excel(name = "价格")
    private BigDecimal price;

    /**
     * 库存
     */
    @Excel(name = "库存")
    private int inventory;

    /**
     * 描述
     */
    @Excel(name = "描述")
    private String description;


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
