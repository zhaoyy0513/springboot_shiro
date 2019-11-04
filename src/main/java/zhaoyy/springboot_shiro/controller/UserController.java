package zhaoyy.springboot_shiro.controller;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import zhaoyy.springboot_shiro.entity.User;
import zhaoyy.springboot_shiro.mapper.UserMapper;
import zhaoyy.springboot_shiro.service.IUserService;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhaoyy
 * @since 2019-10-17
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource
    IUserService userService;
    @Resource
    UserMapper userMapper;

    @GetMapping
    public ResponseEntity getUserById(@RequestParam(value = "id",required = false) Integer id){
//        User userById = userMapper.getUserById(3, "");
//        if(userById==null){
//            System.out.println("未查询到指定用户id");
//        }else{
//            System.out.println(userById);
//        }
        User userByStatus = userMapper.getUserByStatus("1", "and id="+id);
        if(userByStatus==null){
            System.out.println("未查询到指定用户status");
        }else{
            ResponseEntity.ok().body(userByStatus);
        }
        return ResponseEntity.ok().body("");
    }
}
