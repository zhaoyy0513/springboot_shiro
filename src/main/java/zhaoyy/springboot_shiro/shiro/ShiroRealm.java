package zhaoyy.springboot_shiro.shiro;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import zhaoyy.springboot_shiro.entity.User;
import zhaoyy.springboot_shiro.mapper.UserMapper;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zhaoyuyang
 * @createTime 2019/10/16 0016 10:13
 */
public class ShiroRealm extends AuthorizingRealm {

    @Resource
    UserMapper userMapper;

    private static final Logger logger = LoggerFactory.getLogger(ShiroRealm.class);

    @Override
    /**
    * 授权，批准的意思，即获取用户的角色和权限等信息
    *权限认证，即登录过后，每个身份不一定，对应的所能看的页面也不一样。
    * @param principalCollection
    * @return org.apache.shiro.authz.AuthorizationInfo
    * @author zhaoyuyang
    * @since 2019/10/16 0016 10:19
    */
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    /**
    * 认证，身份验证的意思，即登录时验证用户的合法性，比如验证用户名和密码
    *身份认证。即登录通过账号和密码验证登陆人的身份信息。
    * @param authenticationToken
    * @return org.apache.shiro.authc.AuthenticationInfo
    * @author zhaoyuyang
    * @since 2019/10/16 0016 10:20
    */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException  {
       // 获取用户输入的用户和密
        String userName = (String) authenticationToken.getPrincipal();
        String userPwd = "";
        try{
            char[] pass =  (char[])authenticationToken.getCredentials();
            userPwd = new String(pass);
        }catch (Exception ignored){
        }
        System.out.println("用户" + userName + "认证pwd:"+userPwd);
        // 通过用户名和数据库进行匹配
        User user = userMapper.selectOne(new QueryWrapper<User>().eq("username", userName));
        if (user == null) {
            throw new UnknownAccountException("用户名不存在！");
        }
        if (!userPwd.equals(user.getPassword())) {
            throw new IncorrectCredentialsException("用户名或密码错误！");
        }
        return new SimpleAuthenticationInfo(user,userPwd,getName());
    }
}
