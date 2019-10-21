package zhaoyy.springboot_shiro.config;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import zhaoyy.springboot_shiro.entity.User;

import javax.servlet.http.HttpServletRequest;

/**
 * @author zhaoyuyang
 * @createTime 2019/10/21 0021 9:13
 */
@Aspect
@Component
@Slf4j
public class WebLogAspect {
    /**
     * // 切入点描述 这个是controller包的切入点
     *
     * @param
     * @return void
     * @author zhaoyuyang
     * @since 2019/10/21 0021 9:17
     */
    @Pointcut("execution(public * zhaoyy.springboot_shiro.controller..*.*(..))")
    public void controllerLog() {
    }  //定义切入点

    /**
     * 切入点controller执行前执行的具体代码
     *
     * @param joinPoint
     * @return void
     * @author zhaoyuyang
     * @since 2019/10/21 0021 9:19
     */
    @Before("controllerLog()")
    public void logControllerInfo(JoinPoint joinPoint) {
        //这个RequestContextHolder是Springmvc提供来获得所有请求的工具类
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
        //输出需要的信息
        log.info("URI: " + request.getRequestURI());
        log.info("URL: " + request.getRequestURL().toString());
//        // 如果获取的不是动态变化的URL仅仅想获取格式可以用下面代码
//        String url = request.getAttribute(HandlerMapping.BEST_MATCHING_PATTERN_ATTRIBUTE).toString();
//        //url的值为 : /user/{id}/score/{sid}
        log.info("requestMethod: " + request.getMethod());

        // 获取请求的方法
        String method = joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName();
        //获取请求的参数
        String params = JSONObject.toJSONString(joinPoint.getArgs());
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        if(user!=null){
            log.info("用户id为:"+user.getId()+"用户名为:"+user.getUsername()+" 调用方法:"+method + " 参数为:" + params);
        }else{
            log.info("调用方法:"+method + " 参数为:" + params);
        }
    }

    /**
    * 它的方法的参数一定要是ProceedingJoinPoint，这个对象是JoinPoint的子类
    * proceedingJoinPoint有个proceed（）方法，相当于就是那切入点的那个方法执行，简单地说就是让目标方法执行，
    * @param proceedingJoinPoint
    * @return java.lang.Object
    * @author zhaoyuyang
    * @since 2019/10/21 0021 10:20
    */
    @Around("controllerLog()")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) {
        System.out.println("方法环绕begin...参数："+JSONObject.toJSONString(proceedingJoinPoint.getArgs()));
        try {
            Object ret= proceedingJoinPoint.proceed();
            System.out.println("方法环绕end...结果："+ret);
            return ret;
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        return null;
    }

    @After("controllerLog()")
    public void after(JoinPoint joinPoint){
        System.out.println("before执行结束");
    }

    @AfterReturning(value = "controllerLog()",returning = "ret")
    public void afterReturning(Object ret){
        System.out.println("执行结束的返回值为:"+ret);
    }

    @AfterThrowing(value = "controllerLog()",throwing = "ex")
    public void afterThrowing(Exception ex){
        System.out.println("抛出的异常为:"+ex);
    }

    /*
        https://www.cnblogs.com/wangshen31/p/9379197.html

        @PointCut(...........)括号里面那些就是表达式。这里的execution是其中的一种匹配方式，还有：
        execution: 匹配连接点
        within: 某个类里面
        this: 指定AOP代理类的类型
        target:指定目标对象的类型
        args: 指定参数的类型
        bean:指定特定的bean名称，可以使用通配符（Spring自带的）
        @target： 带有指定注解的类型
        @args: 指定运行时传的参数带有指定的注解
        @within: 匹配使用指定注解的类
        @annotation:指定方法所应用的注解

        1）execution(public * *(..))——表示匹配所有public方法
        2）execution(* set*(..))——表示所有以“set”开头的方法
        3）execution(* com.xyz.service.AccountService.*(..))——表示匹配所有AccountService接口的方法
        4）execution(* com.xyz.service.*.*(..))——表示匹配service包下所有的方法
        5）execution(* com.xyz.service..*.*(..))——表示匹配service包和它的子包下的方法

        @After: 在两种场景下执行 - 当一个方法成功执行或是抛出异常
        @AfterReturning: 只有在方法成功执行后运行
        @AfterThrowing: 只有在方法抛出异常后运行

        //下面是另外三篇文章
        https://segmentfault.com/a/1190000013290504
        https://www.jianshu.com/p/9b8a8191a727
        https://blog.csdn.net/u011277123/article/details/91532149


    * */

}
