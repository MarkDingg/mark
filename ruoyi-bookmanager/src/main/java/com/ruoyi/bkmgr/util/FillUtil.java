package com.ruoyi.bkmgr.util;

import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;

import java.util.Objects;

/**
 * @author 王权
 * @since 2023/1/17
 */
public class FillUtil
{

    /**
     * 插入填充
     *
     * @param t   插入对象
     * @param <T> 泛型
     */
    public static <T extends BaseEntity> void insertFill(T t)
    {
        Objects.requireNonNull(t);
        t.setCreateBy(SecurityUtils.getUsername());
        t.setCreateTime(DateUtils.getNowDate());
        updateFill(t);
    }

    /**
     * 更新填充
     *
     * @param t   插入对象
     * @param <T> 泛型
     */
    public static <T extends BaseEntity> void updateFill(T t)
    {
        Objects.requireNonNull(t);
        t.setUpdateBy(SecurityUtils.getUsername());
        t.setUpdateTime(DateUtils.getNowDate());
    }

}
