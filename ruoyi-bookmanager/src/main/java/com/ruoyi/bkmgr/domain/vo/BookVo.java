package com.ruoyi.bkmgr.domain.vo;

import com.ruoyi.bkmgr.common.BaseVo;
import com.ruoyi.bkmgr.domain.BookType;
import com.ruoyi.common.annotation.Excel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author 王权
 * @since 2023/1/17
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class BookVo extends BaseVo
{
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
     * 库存
     */
    private int inventory;

    /**
     * 封面
     */
    private String bookCover;

    /**
     * 图书类型
     */
    String bookTypesStr;

    List<Long> bookTypeIds;


}
