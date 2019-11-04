package zhaoyy.springboot_shiro.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import zhaoyy.springboot_shiro.exception.BaseWebException;
import zhaoyy.springboot_shiro.exception.ErrorResponseEntity;
import zhaoyy.springboot_shiro.exception.MyErrorEntity;
import zhaoyy.springboot_shiro.exception.MyException;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhaoyy
 * @since 2019-10-17
 */
@RestController
@RequestMapping("/role")
public class RoleController {

    @GetMapping
    public ResponseEntity testError(){
        if(1>0){
            //throw  new BaseWebException(new ErrorResponseEntity(HttpStatus.BAD_REQUEST,"教师oid"));
           throw new MyException(new MyErrorEntity(HttpStatus.BAD_REQUEST,"教师id不能为空"));
        }
        return ResponseEntity.ok().body("");
    }

}
