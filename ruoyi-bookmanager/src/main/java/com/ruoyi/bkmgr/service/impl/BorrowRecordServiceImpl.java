package com.ruoyi.bkmgr.service.impl;

import com.ruoyi.bkmgr.domain.BookComment;
import com.ruoyi.bkmgr.domain.BorrowRecord;
import com.ruoyi.bkmgr.domain.dto.BookCommentDto;
import com.ruoyi.bkmgr.domain.dto.BorrowRecordDto;
import com.ruoyi.bkmgr.domain.dto.BorrowRecordQueryDto;
import com.ruoyi.bkmgr.mapper.BorrowRecordMapper;
import com.ruoyi.bkmgr.service.IBookCommentService;
import com.ruoyi.bkmgr.service.IBorrowRecordService;
import com.ruoyi.bkmgr.util.FillUtil;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.system.mapper.SysUserMapper;
import com.ruoyi.system.service.ISysRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.swing.*;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * 借用记录管理Service业务层处理
 *
 * @author wq
 * @date 2023-02-04
 */
@Service
@RequiredArgsConstructor
public class BorrowRecordServiceImpl implements IBorrowRecordService
{
    private final BorrowRecordMapper borrowRecordMapper;
    private final SysUserMapper userMapper;

    private final ISysRoleService roleService;

    private final IBookCommentService bookCommentService;

    /**
     * 查询借用记录管理
     *
     * @param id 借用记录管理主键
     * @return 借用记录管理
     */
    @Override
    public BorrowRecord selectBorrowRecordById(Long id)
    {
        return borrowRecordMapper.selectBorrowRecordById(id);
    }


    @Override
    public List<BorrowRecordDto> selectBorrowRecordList(BorrowRecordQueryDto queryDto)
    {


        // 如果是超级管理员
        if (!SecurityUtils.isAdmin(SecurityUtils.getUserId()))
        {
            List<String> userRoleKeys = SecurityUtils.getUserRoleKeys();
            if (StringUtils.isEmpty(userRoleKeys) || !userRoleKeys.contains("book-admin"))
            {
                //不是图书管理员 只能查询自己记录
                queryDto.setBorrowUser(SecurityUtils.getUsername());
            }
        }
        // 还要判断哪些分享按钮可用
        List<BorrowRecordDto> list = this.borrowRecordMapper.selectBorrowRecords(queryDto);
        List<BookComment> bookComments = bookCommentService.selectBookCommentByUserId(SecurityUtils.getUserId());
        Set<Long> recordIds = bookComments.stream()
                .map(BookComment::getRecordId)
                .collect(Collectors.toSet());
        for (BorrowRecordDto borrowRecordDto : list)
        {
            if (!borrowRecordDto.getBorrowUser()
                    .equals(SecurityUtils.getUserId()))
            {
                borrowRecordDto.setDisabled(true);
                continue;
            }
            // 已经评价过不能用
            if (recordIds.contains(borrowRecordDto.getId()))
            {
                borrowRecordDto.setDisabled(true);
            }

        }
        return list;

    }

    /**
     * 新增借用记录管理
     *
     * @param borrowRecord 借用记录管理
     * @return 结果
     */
    @Override
    public int insertBorrowRecord(BorrowRecord borrowRecord)
    {
        borrowRecord.setCreateTime(DateUtils.getNowDate());
        return borrowRecordMapper.insertBorrowRecord(borrowRecord);
    }

    /**
     * 修改借用记录管理
     *
     * @param borrowRecord 借用记录管理
     * @return 结果
     */
    @Override
    public int updateBorrowRecord(BorrowRecord borrowRecord)
    {
        FillUtil.updateFill(borrowRecord);
        return borrowRecordMapper.updateBorrowRecord(borrowRecord);
    }

    /**
     * 批量删除借用记录管理
     *
     * @param ids 需要删除的借用记录管理主键
     * @return 结果
     */
    @Override
    public int deleteBorrowRecordByIds(Long[] ids)
    {
        return borrowRecordMapper.deleteBorrowRecordByIds(ids);
    }

    /**
     * 删除借用记录管理信息
     *
     * @param id 借用记录管理主键
     * @return 结果
     */
    @Override
    public int deleteBorrowRecordById(Long id)
    {
        return borrowRecordMapper.deleteBorrowRecordById(id);
    }

    @Override
    public void batchSaveBorrowRecord(List<BorrowRecord> borrowRecords)
    {
        if (StringUtils.isEmpty(borrowRecords))
        {
            return;
        }
        this.borrowRecordMapper.batchInsertBorrowRecord(borrowRecords);
    }

    @Override
    public List<BorrowRecord> selectNotReturnedRecord(Long[] bookIds)
    {
        if (StringUtils.isEmpty(bookIds))
        {
            return Collections.emptyList();
        }
        return borrowRecordMapper.selectNotReturnedRecordByBookIds(bookIds);
    }
}
