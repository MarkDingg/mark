package com.ruoyi.bkmgr.controller;

import cn.hutool.core.collection.CollUtil;
import com.ruoyi.bkmgr.domain.Book;
import com.ruoyi.bkmgr.domain.BookType;
import com.ruoyi.bkmgr.domain.dto.BookDto;
import com.ruoyi.bkmgr.domain.dto.BookReturnDto;
import com.ruoyi.bkmgr.domain.excel.export.BookExcel;
import com.ruoyi.bkmgr.domain.vo.BookVo;
import com.ruoyi.bkmgr.service.IBookService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.MimeTypeUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 图书信息Controller
 *
 * @author wq
 * @date 2023-01-17
 */
@RestController
@RequestMapping("/bkmgr/book")
public class BookController extends BaseController
{
    @Autowired
    private IBookService bookService;

    /**
     * 查询图书信息列表
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:book:list')")
    @GetMapping("/list")
    public TableDataInfo list(Book book)
    {
        startPage();
        List<Book> list = bookService.selectBookList(book);
        return getDataTable(list);
    }

    /**
     * 导出图书信息列表
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:book:export')")
    @Log(title = "图书信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Book book)
    {
        List<BookExcel> list = bookService.selectBookExportList(book);
        ExcelUtil<BookExcel> util = new ExcelUtil<BookExcel>(BookExcel.class);
        util.exportExcel(response, list, "图书信息");
    }

    /**
     * 获取图书信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:book:query')")
    @GetMapping(value = "/{bookId}")
    public AjaxResult getInfo(@PathVariable("bookId") Long bookId)
    {
        BookDto dto = bookService.selectBookDetail(bookId);
        return success(dtoToVo(dto));
    }

    /**
     * 新增图书信息
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:book:add')")
    @Log(title = "图书信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Book book)
    {
        bookService.saveBook(book);
        return success();
    }

    /**
     * 修改图书信息
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:book:edit')")
    @Log(title = "图书信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Book book)
    {
        return toAjax(bookService.updateBook(book));
    }

    /**
     * 删除图书信息
     */
    @PreAuthorize("@ss.hasPermi('bkmgr:book:remove')")
    @Log(title = "图书信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{bookIds}")
    public AjaxResult remove(@PathVariable Long[] bookIds)
    {
        return success(bookService.deleteBookByBookIds(bookIds));
    }

    @PreAuthorize("@ss.hasPermi(' bkmgr:book:borrow')")
    @PostMapping("/borrow")
    @Log(title = "图书信息", businessType = BusinessType.DELETE)
    public AjaxResult bookBorrow(@RequestBody String[] bookNumbers)
    {
        String msg = bookService.handleBookBorrow(bookNumbers);
        return success(msg);
    }


    @PostMapping("/bookCover/{bookId}")
    @Log(title = "图书信息", businessType = BusinessType.DELETE)
    @PreAuthorize("@ss.hasPermi(' bkmgr:book:edit')")
    public AjaxResult updateBookCover(@RequestParam("bookCover") MultipartFile file,
                                      @PathVariable Long bookId) throws Exception
    {
        if (!file.isEmpty())
        {
            String avatar = FileUploadUtils.upload(RuoYiConfig.getBookCoverPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
            if (this.bookService.updateBookCover(bookId, avatar))
            {
                AjaxResult ajax = AjaxResult.success();
                ajax.put("imgUrl", avatar);
                return ajax;
            }
        }
        return error("上传图片异常，请联系管理员");
    }

    @PostMapping("/bookReturn")
    @PreAuthorize("@ss.hasPermi('bkmgr:book:return')")
    public AjaxResult bookReturn(@RequestBody @Validated List<BookReturnDto> returnDtos)
    {
        return success(this.bookService.handleBookReturn(returnDtos));
    }


    private BookVo dtoToVo(BookDto bookDto)
    {
        return Optional.ofNullable(bookDto)
                .map(dto ->
                {
                    BookVo bookVo = BeanUtils.convertBean(bookDto, BookVo.class);
                    if (CollUtil.isNotEmpty(bookDto.getBookTypes()))
                    {
                        bookVo.setBookTypesStr(bookDto.getBookTypes()
                                .stream()
                                .map(BookType::getType)
                                .collect(Collectors.joining(",")));
                        bookVo.setBookTypeIds(bookDto.getBookTypes()
                                .stream()
                                .map(BookType::getTypeId)
                                .collect(Collectors.toList()));
                    }
                    return bookVo;
                })
                .orElse(null);
    }

    private List<BookVo> dtosToVos(List<BookDto> bookDtos)
    {
        if (CollUtil.isNotEmpty(bookDtos))
        {
            return bookDtos.stream()
                    .map(this::dtoToVo)
                    .collect(Collectors.toList());
        }
        return Collections.emptyList();
    }
}
