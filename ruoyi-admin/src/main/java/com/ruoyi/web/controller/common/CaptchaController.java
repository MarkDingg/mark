package com.ruoyi.web.controller.common;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.util.IdUtil;
import com.ruoyi.framework.config.captcha.CaptchaEnum;
import com.ruoyi.framework.config.captcha.LoginProperties;
import com.wf.captcha.base.Captcha;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.google.code.kaptcha.Producer;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.sign.Base64;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.system.service.ISysConfigService;

/**
 * 验证码操作处理
 *
 * @author ruoyi
 */
@RestController
@RequiredArgsConstructor
public class CaptchaController
{

    private final RedisCache redisCache;

    private final ISysConfigService configService;

    private final LoginProperties loginProperties;


    /**
     * 生成验证码
     */
    @GetMapping("/captchaImage")
    public AjaxResult getCode()
    {
        AjaxResult ajax = AjaxResult.success();

        boolean captchaEnabled = configService.selectCaptchaEnabled();
        ajax.put("captchaEnabled", captchaEnabled);
        if (!captchaEnabled)
        {
            return ajax;
        }
        // 保存验证码信息
        String uuid = IdUtils.simpleUUID();
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;

        Captcha captcha = loginProperties.getCaptcha();
        String captchaValue = captcha.text();
        if (captcha.getCharType() - 1 == CaptchaEnum.ARITHMETIC.ordinal() && captchaValue.contains("."))
        {
            captchaValue = captchaValue.split("\\.")[0];
        }
        redisCache.setCacheObject(verifyKey, captchaValue, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        ajax.put("uuid", uuid);
        ajax.put("img", captcha.toBase64());
        return ajax;
    }
}
