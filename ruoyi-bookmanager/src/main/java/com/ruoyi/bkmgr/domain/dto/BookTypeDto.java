package com.ruoyi.bkmgr.domain.dto;

import com.ruoyi.bkmgr.common.BaseDto;
import lombok.Data;

/**
 * @author: wq
 * @since: 2023/2/3
 */
@Data
public class BookTypeDto extends BaseDto {
    /**
     * id
     */
    private Long typeId;

    /**
     * 图书类型
     */
    private String type;

    /**
     * 描述
     */
    private String desc;

    private Long bookId;
}
