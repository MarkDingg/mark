package com.ruoyi.bkmgr.service;

import java.util.List;

import com.ruoyi.bkmgr.domain.BorrowRecord;
import com.ruoyi.bkmgr.domain.dto.BorrowRecordDto;
import com.ruoyi.bkmgr.domain.dto.BorrowRecordQueryDto;

/**
 * 借用记录管理Service接口
 *
 * @author wq
 * @date 2023-02-04
 */
public interface IBorrowRecordService {
    /**
     * 查询借用记录管理
     *
     * @param id 借用记录管理主键
     * @return 借用记录管理
     */
    public BorrowRecord selectBorrowRecordById(Long id);

    /**
     * 查询借用记录管理列表
     *
     * @param queryDto 借用记录管理
     * @return 借用记录管理集合
     */
    public List<BorrowRecordDto> selectBorrowRecordList(BorrowRecordQueryDto queryDto);

    /**
     * 新增借用记录管理
     *
     * @param borrowRecord 借用记录管理
     * @return 结果
     */
    public int insertBorrowRecord(BorrowRecord borrowRecord);

    /**
     * 修改借用记录管理
     *
     * @param borrowRecord 借用记录管理
     * @return 结果
     */
    public int updateBorrowRecord(BorrowRecord borrowRecord);

    /**
     * 批量删除借用记录管理
     *
     * @param ids 需要删除的借用记录管理主键集合
     * @return 结果
     */
    public int deleteBorrowRecordByIds(Long[] ids);

    /**
     * 删除借用记录管理信息
     *
     * @param id 借用记录管理主键
     * @return 结果
     */
    public int deleteBorrowRecordById(Long id);

    /**
     * 批量保存
     *
     * @param borrowRecords 借用记录
     */
    void batchSaveBorrowRecord(List<BorrowRecord> borrowRecords);

    List<BorrowRecord> selectNotReturnedRecord(Long[] bookIds);
}
