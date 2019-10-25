package zhaoyy.springboot_shiro.config;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.HandlerMapping;
import zhaoyy.springboot_shiro.entity.User;
import zhaoyy.springboot_shiro.mapper.UserMapper;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

/**
 * @author zhaoyuyang
 * @createTime 2019/10/23 0023 9:34
 */
@Aspect
@Component
@Log4j2
public class MapperAspect {
    @Resource
    UserMapper userMapper;

    /**
     * 匹配UserMapper接口下所有getUser开头的方法
     *
     * @param
     * @return void
     * @author zhaoyuyang
     * @since 2019/10/24 0024 17:47
     */
    @Pointcut("execution(* zhaoyy.springboot_shiro.mapper.UserMapper.getUser*(..))")
    public void point() {
    }

    @Around(value = "point()")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        Object obj = SecurityUtils.getSubject().getPrincipal();
        if (obj != null) {
            User user = (User) obj;
            log.warn("原链接:"+ JSONObject.toJSONString(request.getAttribute(HandlerMapping.BEST_MATCHING_PATTERN_ATTRIBUTE)));
            log.error("拦截成功符合模糊条件: "+proceedingJoinPoint.getSignature().getName());
            return user;
        }
        return proceedingJoinPoint.proceed();
    }
}
