package com.ruoyi.bkmgr.service.impl;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.ruoyi.bkmgr.domain.BookTypeMapping;
import com.ruoyi.bkmgr.domain.dto.BookTypeDto;
import com.ruoyi.bkmgr.mapper.BorrowRecordMapper;
import com.ruoyi.bkmgr.util.FillUtil;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.AssertUtil;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.bkmgr.mapper.BookTypeMapper;
import com.ruoyi.bkmgr.domain.BookType;
import com.ruoyi.bkmgr.service.IBookTypeService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 图书类型Service业务层处理
 *
 * @author wq
 * @date 2023-01-17
 */
@Service
@RequiredArgsConstructor
public class BookTypeServiceImpl implements IBookTypeService
{
    private final BookTypeMapper bookTypeMapper;

    private final RedisCache redisCache;

    /**
     * 查询图书类型
     *
     * @param typeId 图书类型主键
     * @return 图书类型
     */
    @Override
    public BookType selectBookTypeByTypeId(Long typeId)
    {
        return bookTypeMapper.selectBookTypeByTypeId(typeId);
    }

    /**
     * 查询图书类型列表
     *
     * @param bookType 图书类型
     * @return 图书类型
     */
    @Override
    public List<BookType> selectBookTypeList(BookType bookType)
    {
        return bookTypeMapper.selectBookTypeList(bookType);
    }

    /**
     * 新增图书类型
     *
     * @param bookType 图书类型
     * @return 结果
     */
    @Override
    public int insertBookType(BookType bookType)
    {
        FillUtil.insertFill(bookType);
        redisCache.deleteObject("bkmgr::indexInfo");
        return bookTypeMapper.insertBookType(bookType);
    }

    /**
     * 修改图书类型
     *
     * @param bookType 图书类型
     * @return 结果
     */
    @Override
    public int updateBookType(BookType bookType)
    {
        FillUtil.updateFill(bookType);
        return bookTypeMapper.updateBookType(bookType);
    }

    /**
     * 批量删除图书类型
     *
     * @param typeIds 需要删除的图书类型主键
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteBookTypeByTypeIds(Long[] typeIds)
    {
        redisCache.deleteObject("bkmgr::indexInfo");
        this.bookTypeMapper.deleteBookRelatedTypes(typeIds);
        return bookTypeMapper.deleteBookTypeByTypeIds(typeIds);
    }

    /**
     * 删除图书类型信息
     *
     * @param typeId 图书类型主键
     * @return 结果
     */
    @Override
    public int deleteBookTypeByTypeId(Long typeId)
    {
        return bookTypeMapper.deleteBookTypeByTypeId(typeId);
    }

    @Override
    public List<BookType> selectBookTypes(Long bookId)
    {
        AssertUtil.isNotNull(bookId, "图书id不能为空");
        return this.bookTypeMapper.selectBookTypesByBookId(bookId);
    }

    @Override
    public Map<Long, List<BookType>> selectBooksTypes(List<Long> bookIds)
    {
        AssertUtil.isNotNull(bookIds, "图书id列表不能为空");
        List<BookTypeDto> booksTypes = this.bookTypeMapper.selectBooksTypes(bookIds);
        if (StringUtils.isEmpty(booksTypes))
        {
            return Collections.emptyMap();
        }
        return booksTypes.stream()
                .collect(Collectors.groupingBy(BookTypeDto::getBookId,
                        Collectors.mapping(bookTypeDto -> BeanUtils.convertBean(bookTypeDto, BookType.class),
                                Collectors.toList())));
    }

    @Override
    public void saveBookTypes(List<BookTypeMapping> bookTypeMappings)
    {
        if (StringUtils.isEmpty(bookTypeMappings))
        {
            return;
        }
        this.bookTypeMapper.insertBookTypes(bookTypeMappings);
    }

    @Override
    public void deleteBookTypes(Long[] bookIds)
    {
        this.bookTypeMapper.deleteBookTypes(bookIds);
    }
}
