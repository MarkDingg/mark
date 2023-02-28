package com.ruoyi.bkmgr.controller;

import com.ruoyi.bkmgr.domain.dto.BookDto;
import com.ruoyi.bkmgr.domain.vo.BookCategoryVo;
import com.ruoyi.bkmgr.domain.vo.BookIndexInfoVo;
import com.ruoyi.bkmgr.service.IIndexService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: wq
 * @since: 2023/1/21
 */
@RestController
@RequestMapping("/bkmgr/book")
@RequiredArgsConstructor
public class IndexController extends BaseController
{

    private final IIndexService indexService;

    @GetMapping("index")
    public AjaxResult indexInfo()
    {
        BookIndexInfoVo indexInfoVo = indexService.indexInfo();
        return success(indexInfoVo);
    }

    @GetMapping("/bookCategory")
    public AjaxResult bookCategory()
    {
        BookCategoryVo bookCategoryVo = indexService.selectBookCategory();
        return success(bookCategoryVo);
    }
}
