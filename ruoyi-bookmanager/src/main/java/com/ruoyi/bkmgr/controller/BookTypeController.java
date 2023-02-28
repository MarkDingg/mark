package com.ruoyi.bkmgr.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.bkmgr.domain.excel.export.BookTypeExcel;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.bkmgr.domain.BookType;
import com.ruoyi.bkmgr.service.IBookTypeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 图书类型Controller
 *
 * @author wq
 * @date 2023-01-17
 */
@RestController
@RequestMapping("/bkmgr/type")
public class BookTypeController extends BaseController
{
    @Autowired
    private IBookTypeService bookTypeService;

    /**
     * 查询图书类型列表
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:type:list')")
    @GetMapping("/list")
    public TableDataInfo list(BookType bookType)
    {
        startPage();
        List<BookType> list = bookTypeService.selectBookTypeList(bookType);
        return getDataTable(list);
    }

    /**
     * 导出图书类型列表
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:type:export')")
    @Log(title = "图书类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BookType bookType)
    {
        List<BookType> list = bookTypeService.selectBookTypeList(bookType);
        List<BookTypeExcel> bookTypeExcels = BeanUtils.copyList(list, BookTypeExcel.class);
        ExcelUtil<BookTypeExcel> util = new ExcelUtil<BookTypeExcel>(BookTypeExcel.class);
        util.exportExcel(response, bookTypeExcels, "图书类型数据");
    }

    /**
     * 获取图书类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:type:query')")
    @GetMapping(value = "/{typeId}")
    public AjaxResult getInfo(@PathVariable("typeId") Long typeId)
    {
        return success(bookTypeService.selectBookTypeByTypeId(typeId));
    }

    /**
     * 新增图书类型
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:type:add')")
    @Log(title = "图书类型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BookType bookType)
    {
        return toAjax(bookTypeService.insertBookType(bookType));
    }

    /**
     * 修改图书类型
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:type:edit')")
    @Log(title = "图书类型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BookType bookType)
    {
        return toAjax(bookTypeService.updateBookType(bookType));
    }

    /**
     * 删除图书类型
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:type:remove')")
    @Log(title = "图书类型", businessType = BusinessType.DELETE)
    @DeleteMapping("/{typeIds}")
    public AjaxResult remove(@PathVariable Long[] typeIds)
    {
        return toAjax(bookTypeService.deleteBookTypeByTypeIds(typeIds));
    }

    @PreAuthorize("@ss.hasPermi('bkmgr:type:list')")
    @GetMapping("/listByType")
    public AjaxResult list(String bookTypeName)
    {
        BookType bookType = new BookType();
        bookType.setType(bookTypeName);
        if (!StringUtils.isEmpty(bookTypeName))
        {
            List<BookType> list = bookTypeService.selectBookTypeList(bookType);
            return success(list);
        } else
        {
            startPage();
            List<BookType> list = bookTypeService.selectBookTypeList(new BookType());
            return success(list);
        }
    }

}
