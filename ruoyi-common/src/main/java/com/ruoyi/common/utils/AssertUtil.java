package com.ruoyi.common.utils;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.ruoyi.common.exception.BusinessException;

import java.util.Collection;
import java.util.Map;

/**
 * @author w'q
 */
public class AssertUtil
{
    /**
     * 断言为True
     *
     * @param expression
     * @param msg
     */
    public static void isTrue(boolean expression, String msg)
    {
        if (!expression)
        {
            throw new BusinessException(msg);
        }
    }

    /**
     * 断言为false
     *
     * @param expression
     * @param errorMsg
     */
    public static void isFalse(boolean expression, String errorMsg)
    {
        if (expression)
        {
            throw new BusinessException(errorMsg);
        }
    }


    /**
     * 字符串为空
     *
     * @param str
     * @param errorMsg
     */
    public static void isNotEmpty(String str, String errorMsg)
    {
        if (StringUtils.isEmpty(str))
        {
            throw new BusinessException(errorMsg);
        }
    }

    /**
     * 数组为空
     *
     * @param str
     * @param msg
     */
    public static void isNotEmpty(Object[] str, String msg)
    {
        if (ArrayUtil.isEmpty(str))
        {
            throw new BusinessException(msg);
        }
    }

    /**
     * 集合为空
     *
     * @param collection
     * @param msg
     */
    public static void isNotEmpty(Collection collection, String msg)
    {
        if (CollUtil.isEmpty(collection))
        {
            throw new BusinessException(msg);
        }
    }

    /**
     * 字符串为空
     *
     * @param str
     * @param msg
     */
    public static void isEmpty(String str, String msg)
    {
        if (StrUtil.isNotEmpty(str))
        {
            throw new BusinessException(msg);
        }
    }

    /**
     * 集合为空
     *
     * @param collection
     * @param msg
     */
    public static void isEmpty(Collection collection, String msg)
    {
        if (CollUtil.isNotEmpty(collection))
        {
            throw new BusinessException(msg);
        }
    }

    /**
     * 如果集合为空或者长度小于1，则抛异常
     *
     * @param map
     * @param msg
     */
    public static void isNotEmpty(Map map, String msg)
    {
        if (CollUtil.isEmpty(map))
        {
            throw new BusinessException(msg);
        }
    }

    /**
     * 如果对象时空，则抛异常
     *
     * @param object
     * @param msg
     */
    public static void isNotNull(Object object, String msg)
    {
        if (object == null)
        {
            throw new BusinessException(msg);
        }
    }

    /**
     * 数组是否为空
     *
     * @param objects
     * @param msg
     */
    public static void isNotNull(Object[] objects, String msg)
    {
        if (ArrayUtil.isEmpty(objects))
        {
            throw new BusinessException(msg);
        }
    }

    /**
     * 对象数组空
     *
     * @param objects
     * @param responseCode
     * @param msg
     */
    public static void isNotNull(Object[] objects, Integer responseCode, String msg)
    {
        if (ArrayUtil.isEmpty(objects))
        {
            throw new BusinessException(responseCode, msg);
        }
    }

    /**
     * 如果不是true，则抛异常
     *
     * @param expression
     * @param responseCode
     * @param msg
     */
    public static void isTrue(boolean expression, Integer responseCode, String msg)
    {
        if (!expression)
        {
            throw new BusinessException(responseCode, msg);
        }
    }

    /**
     * 如果是空或者空字符串，则抛异常
     *
     * @param str
     * @param responseCode
     * @param msg
     */
    public static void isNotEmpty(String str, Integer responseCode, String msg)
    {
        if (StringUtils.isEmpty(str))
        {
            throw new BusinessException(responseCode, msg);
        }
    }

    /**
     * 如果数组为空或者长度小于1，则抛异常
     *
     * @param str
     * @param responseCode
     * @param msg
     */
    public static void isNotEmpty(Object[] str, Integer responseCode, String msg)
    {
        if (ArrayUtil.isEmpty(str))
        {
            throw new BusinessException(responseCode, msg);
        }
    }

    /**
     * 如果集合为空或者长度小于1，则抛异常
     *
     * @param collection
     * @param responseCode
     * @param msg
     */
    public static void isNotEmpty(Collection collection, Integer responseCode, String msg)
    {
        if (CollUtil.isEmpty(collection))
        {
            throw new BusinessException(responseCode, msg);
        }
    }

    /**
     * @param map
     * @param responseCode
     * @param msg
     */
    public static void isNotEmpty(Map map, Integer responseCode, String msg)
    {
        if (CollUtil.isEmpty(map))
        {
            throw new BusinessException(responseCode, msg);
        }
    }

    /**
     * 如果对象时空，则抛异常
     *
     * @param object
     * @param responseCode
     * @param msg
     */
    public static void isNotNull(Object object, Integer responseCode, String msg)
    {
        if (object == null)
        {
            throw new BusinessException(responseCode, msg);
        }
    }


}
