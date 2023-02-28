package com.ruoyi.bkmgr.service.impl;

import com.ruoyi.bkmgr.domain.BookType;
import com.ruoyi.bkmgr.domain.dto.BookCategoryDto;
import com.ruoyi.bkmgr.domain.dto.BookDto;
import com.ruoyi.bkmgr.domain.vo.BookCategoryVo;
import com.ruoyi.bkmgr.domain.vo.BookIndexInfoVo;
import com.ruoyi.bkmgr.mapper.BookMapper;
import com.ruoyi.bkmgr.mapper.BookTypeMapper;
import com.ruoyi.bkmgr.mapper.BorrowRecordMapper;
import com.ruoyi.bkmgr.service.IIndexService;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.system.mapper.SysUserMapper;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author: wq
 * @since: 2023/1/21
 */
@Service
@RequiredArgsConstructor
public class IndexServiceImpl implements IIndexService
{

    private final SysUserMapper userMapper;
    private final BookMapper bookMapper;
    private final BookTypeMapper bookTypeMapper;

    private final RedisCache redisCache;

    private final BorrowRecordMapper borrowRecordMapper;

    @Override
    public BookIndexInfoVo indexInfo()
    {

        BookIndexInfoVo bookIndexInfoVo = redisCache.getCacheObject("bkmgr::indexInfo");
        if (bookIndexInfoVo == null)
        {
            long totalCount = userMapper.selectUserTotalCount();
            long bookCount = bookMapper.selectBookCount();
            long borrowCount = borrowRecordMapper.selectCount();
            long typeCount = bookTypeMapper.selectCount();
            BookIndexInfoVo indexInfoVo = new BookIndexInfoVo(totalCount, bookCount, typeCount, borrowCount);
            redisCache.setCacheObject("bkmgr::indexInfo", indexInfoVo);
            return indexInfoVo;
        }
        return bookIndexInfoVo;
    }

    @Override
    public BookCategoryVo selectBookCategory()
    {
        List<BookCategoryDto> bookCategoryDtos = bookMapper.selectBookCategory();
        List<Long> totals = bookCategoryDtos.stream()
                .map(BookCategoryDto::getTotal)
                .collect(Collectors.toList());
        List<String> types = bookCategoryDtos.stream()
                .map(BookCategoryDto::getType)
                .collect(Collectors.toList());
        return new BookCategoryVo(types, totals);
    }
}
