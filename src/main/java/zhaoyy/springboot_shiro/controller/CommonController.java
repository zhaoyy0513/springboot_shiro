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
import org.springframework.web.servlet.HandlerMapping;
import zhaoyy.springboot_shiro.config.LoginSessionListener;
import zhaoyy.springboot_shiro.entity.User;
import zhaoyy.springboot_shiro.util.ResponseBo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public ResponseBo login(String userName, String userPwd, Boolean rememberMe, HttpServletRequest request) {
        // 从SecurityUtils里边创建一个 subject
        Subject subject = SecurityUtils.getSubject();
        // userPwd = Md5Util.md5Encrypt32Lower(userPwd);
        // 在认证提交前准备 token（令牌）
        UsernamePasswordToken token = new UsernamePasswordToken(userName, userPwd, rememberMe);
        try {
            subject.login(token);
            // 统计在线人数，与下方的logout和online注解是一起使用的
            HttpSession session = request.getSession(true);
            session.setAttribute("loginName", userName);
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
    public String index(Model model) {
        // 登录成后，即可通过Subject获取登录的用户信息
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("user", user);
        return "index";
    }

    @RequestMapping("/logout")
    public void logout(Subject subject, HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        session.removeAttribute("loginName");
        session.invalidate();
        subject.logout();
    }

    @RequestMapping("/online")
    @ResponseBody
    public Object online() {
        return "当前在线人数：" + LoginSessionListener.online + "人";
    }

    @RequestMapping("/error/404")
    public String e404() {
        return "error/404";
    }

    @RequestMapping("/error/500")
    public String e500() {
        return "error/500";
    }

}
