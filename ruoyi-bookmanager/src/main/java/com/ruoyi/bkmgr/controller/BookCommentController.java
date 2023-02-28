package com.ruoyi.bkmgr.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.bkmgr.domain.dto.BookCommentDto;
import com.ruoyi.bkmgr.domain.vo.BookCommentVo;
import com.ruoyi.common.utils.bean.BeanUtils;
import lombok.RequiredArgsConstructor;
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
import com.ruoyi.bkmgr.domain.BookComment;
import com.ruoyi.bkmgr.service.IBookCommentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 图书评论Controller
 *
 * @author wq
 * @date 2023-02-13
 */
@RestController
@RequestMapping("/bkmgr/comment")
@RequiredArgsConstructor
public class BookCommentController extends BaseController
{
    private final IBookCommentService bookCommentService;

    /**
     * 查询图书评论列表
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:comment:list')")
    @GetMapping("/list")
    public TableDataInfo list(BookComment bookComment)
    {
        startPage();
        List<BookComment> list = bookCommentService.selectBookCommentList(bookComment);
        return getDataTable(list);
    }

    //    @PreAuthorize("@ss.hasPermi('bkmgr:comment:list')")
    @GetMapping("/bookComment/{id}")
    public AjaxResult bookComment(@PathVariable Long id)
    {
        startPage();
        List<BookCommentDto> bookComments = bookCommentService.selectBookCommentListById(id);
        List<BookCommentVo> bookCommentVos = BeanUtils.copyList(bookComments, BookCommentVo.class);
        return success(bookCommentVos);

    }

    /**
     * 导出图书评论列表
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:comment:export')")
    @Log(title = "图书评论", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BookComment bookComment)
    {
        List<BookComment> list = bookCommentService.selectBookCommentList(bookComment);
        ExcelUtil<BookComment> util = new ExcelUtil<BookComment>(BookComment.class);
        util.exportExcel(response, list, "图书评论数据");
    }

    /**
     * 获取图书评论详细信息
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:comment:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(bookCommentService.selectBookCommentById(id));
    }

    /**
     * 新增图书评论
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:comment:add')")
    @Log(title = "图书评论", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BookComment bookComment)
    {
        return toAjax(bookCommentService.insertBookComment(bookComment));
    }

    /**
     * 修改图书评论
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:comment:edit')")
    @Log(title = "图书评论", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BookComment bookComment)
    {
        return toAjax(bookCommentService.updateBookComment(bookComment));
    }

    /**
     * 删除图书评论
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:comment:remove')")
    @Log(title = "图书评论", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bookCommentService.deleteBookCommentByIds(ids));
    }
}
