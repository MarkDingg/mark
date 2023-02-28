package com.ruoyi.common.exception;

import com.ruoyi.common.constant.HttpStatus;
import lombok.Getter;

/**
 * @author 王权
 * @since 2023/1/16
 */
@Getter
public class BusinessException extends RuntimeException
{
    private Integer code = HttpStatus.ERROR;
    private String message = "error";

    public BusinessException(String message)
    {
        this.message = message;
    }

    public BusinessException(Integer code, String message)
    {
        this.code = code;
        this.message = message;
    }

    public BusinessException()
    {
    }
}
