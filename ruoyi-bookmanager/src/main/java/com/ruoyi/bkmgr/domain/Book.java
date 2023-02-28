package com.ruoyi.bkmgr.domain;

import java.math.BigDecimal;
import java.util.List;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 图书信息对象 bkmgr_book
 *
 * @author wq
 * @date 2023-01-17
 */
@Data
public class Book extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    private Long bookId;


    /**
     * 图书名
     */
    @Excel(name = "图书名")
    private String bookName;

    /**
     * 库存
     */
    private int inventory;

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
     * 描述
     */
    @Excel(name = "描述")
    private String description;

    /**
     * 价格
     */
    @Excel(name = "价格")
    private BigDecimal price;

    /**
     * 封面
     */
    private String bookCover;

    private List<Long> bookTypeIds;
}
