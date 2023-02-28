package com.ruoyi.bkmgr.mapper;

import java.util.List;

import com.ruoyi.bkmgr.domain.BorrowRecord;
import com.ruoyi.bkmgr.domain.dto.BorrowRecordDto;
import com.ruoyi.bkmgr.domain.dto.BorrowRecordQueryDto;

/**
 * 借用记录管理Mapper接口
 *
 * @author wq
 * @date 2023-02-04
 */
public interface BorrowRecordMapper
{
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
    public List<BorrowRecord> selectBorrowRecordList(BorrowRecordQueryDto queryDto);

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
     * 删除借用记录管理
     *
     * @param id 借用记录管理主键
     * @return 结果
     */
    public int deleteBorrowRecordById(Long id);

    /**
     * 批量删除借用记录管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBorrowRecordByIds(Long[] ids);

    /**
     * 批量插入记录
     *
     * @param borrowRecords 列表
     */
    void batchInsertBorrowRecord(List<BorrowRecord> borrowRecords);

    /**
     * 查询借用记录
     *
     * @param dto 借用记录条件
     * @return 记录列表
     */
    List<BorrowRecordDto> selectBorrowRecords(BorrowRecordQueryDto dto);

    /**
     * @param bookIds
     * @return
     */
    List<BorrowRecord> selectNotReturnedRecordByBookIds(Long[] bookIds);

    /**
     * 查询借用次数
     *
     * @return 次数
     */
    long selectCount();
}
