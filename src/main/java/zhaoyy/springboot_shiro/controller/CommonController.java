package zhaoyy.springboot_shiro.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import zhaoyy.springboot_shiro.entity.User;
import zhaoyy.springboot_shiro.util.Md5Util;
import zhaoyy.springboot_shiro.util.ResponseBo;

/**
 * @author zhaoyuyang
 * @createTime 2019/10/16 0016 10:33
 */
@Controller
public class CommonController {

    @RequestMapping("/")
    public String redirectIndex() {
        return "redirect:/index";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public ResponseBo login(String userName,String userPwd){
        // 从SecurityUtils里边创建一个 subject
        Subject subject = SecurityUtils.getSubject();
        // userPwd = Md5Util.md5Encrypt32Lower(userPwd);
        // 在认证提交前准备 token（令牌）
        UsernamePasswordToken token = new UsernamePasswordToken(userName,userPwd);
        try {
            subject.login(token);
            return ResponseBo.ok();
        } catch (UnknownAccountException e) {
            return ResponseBo.error(e.getMessage());
        } catch (IncorrectCredentialsException e) {
            return ResponseBo.error(e.getMessage());
        } catch (AuthenticationException e) {
            return ResponseBo.error("认证失败！");
        }
    }

    @RequestMapping("/index")
    public String index(Model model){
        // 登录成后，即可通过Subject获取登录的用户信息
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("user",user);
        return "index";
    }

    @RequestMapping("/logout")
    public void logout(){
    }

    @RequestMapping("/error/404")
    public String  e404(){
        return "error/404";
    }

    @RequestMapping("/error/500")
    public String  e500(){
        return "error/500";
    }

}
