package com.ruoyi.bkmgr.controller;

import com.ruoyi.bkmgr.domain.BorrowRecord;
import com.ruoyi.bkmgr.domain.dto.BorrowRecordDto;
import com.ruoyi.bkmgr.domain.dto.BorrowRecordQueryDto;
import com.ruoyi.bkmgr.service.IBorrowRecordService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 借用记录管理Controller
 *
 * @author wq
 * @date 2023-02-04
 */
@RestController
@RequestMapping("/bkmgr/borrowRecord")
public class BorrowRecordController extends BaseController
{
    private final IBorrowRecordService borrowRecordService;

    public BorrowRecordController(IBorrowRecordService borrowRecordService)
    {
        this.borrowRecordService = borrowRecordService;
    }

    /**
     * 查询借用记录管理列表
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:borrowRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(BorrowRecordQueryDto queryDto)
    {
        startPage();
        List<BorrowRecordDto> list = borrowRecordService.selectBorrowRecordList(queryDto);
        return getDataTable(list);
    }

    /**
     * 导出借用记录管理列表
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:borrowRecord:export')")
    @Log(title = "借用记录管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BorrowRecordQueryDto borrowRecord)
    {
        List<BorrowRecordDto> list = borrowRecordService.selectBorrowRecordList(borrowRecord);
        ExcelUtil<BorrowRecordDto> util = new ExcelUtil<BorrowRecordDto>(BorrowRecordDto.class);
        util.exportExcel(response, list, "借用记录管理数据");
    }

    /**
     * 获取借用记录管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:borrowRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(borrowRecordService.selectBorrowRecordById(id));
    }

    /**
     * 新增借用记录管理
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:borrowRecord:add')")
    @Log(title = "借用记录管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BorrowRecord borrowRecord)
    {
        return toAjax(borrowRecordService.insertBorrowRecord(borrowRecord));
    }

    /**
     * 修改借用记录管理
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:borrowRecord:edit')")
    @Log(title = "借用记录管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BorrowRecord borrowRecord)
    {
        return toAjax(borrowRecordService.updateBorrowRecord(borrowRecord));
    }

    /**
     * 删除借用记录管理
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:borrowRecord:remove')")
    @Log(title = "借用记录管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(borrowRecordService.deleteBorrowRecordByIds(ids));
    }
}
