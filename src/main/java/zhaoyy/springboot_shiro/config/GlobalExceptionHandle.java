package zhaoyy.springboot_shiro.config;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import zhaoyy.springboot_shiro.exception.BaseWebException;
import zhaoyy.springboot_shiro.exception.ErrorResponseEntity;
import zhaoyy.springboot_shiro.exception.MyErrorEntity;
import zhaoyy.springboot_shiro.exception.MyException;

import javax.servlet.http.HttpServletRequest;

/**
 * @author zhaoyuyang
 * @createTime 2019/11/4 0004 18:22
 */
@RestControllerAdvice
public class GlobalExceptionHandle {
    //声明要捕获的异常
    @ExceptionHandler(MyException.class)
    @ResponseBody
    ResponseEntity<?> handleBaseWebException(MyException err) {
        MyErrorEntity errorEntity = err.getErrorResponseEntity();
        if (errorEntity == null) {
            errorEntity = new MyErrorEntity("系统出错");
        }
        return errorEntity.build();
    }

//    @ExceptionHandler(BaseWebException.class)
//    @ResponseBody
//    ResponseEntity<?> handleBaseWebException(BaseWebException err) {
//        ErrorResponseEntity errorEntity = err.getErrorResponseEntity();
//        if (errorEntity == null) {
//            errorEntity = new ErrorResponseEntity("系统出错");
//        }
//        return errorEntity.build();
//    }
}
