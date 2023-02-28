package com.ruoyi.bkmgr.util;

import com.ruoyi.common.exception.ServiceException;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * @author: wq
 * @since: 2023/1/21
 */
@Component
public class ContextUtil implements ApplicationContextAware {

    private static ApplicationContext applicationContext;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        initAppContext(applicationContext);
    }

    public static <T> T getBean(Class<T> tClass) {
        if (applicationContext != null) {
            return applicationContext.getBean(tClass);
        }
        throw new ServiceException("bean not fount");
    }

    /**
     *
     * @param beanName
     * @param tClass
     * @return
     * @param <T>
     */
    public static <T> T getBean(String beanName,Class<T> tClass) {
        if (applicationContext != null) {
            return applicationContext.getBean(beanName,tClass);
        }
        throw new ServiceException("bean not fount");
    }


    private static void initAppContext(ApplicationContext context) {
        applicationContext = context;
    }
}
