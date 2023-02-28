package com.ruoyi.bkmgr.service;

import com.ruoyi.bkmgr.domain.dto.BookDto;
import com.ruoyi.bkmgr.domain.vo.BookCategoryVo;
import com.ruoyi.bkmgr.domain.vo.BookIndexInfoVo;

/**
 * @author: wq
 * @since: 2023/1/21
 */
public interface IIndexService {
    /**
     * 获取首页信息
     *
     * @return 首页信息
     */
    BookIndexInfoVo indexInfo();

    BookCategoryVo selectBookCategory();
}
