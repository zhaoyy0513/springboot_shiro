package zhaoyy.springboot_shiro.shiro;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;
import java.util.LinkedHashMap;

/**
 * @author zhaoyuyang
 * @createTime 2019/10/16 0016 9:53
 */

    /*
  Filter Name	Class	Description
anon	            org.apache.shiro.web.filter.authc.AnonymousFilter	匿名拦截器，即不需要登录即可访问；一般用于静态资源过滤；示例/static/**=anon
authc	            org.apache.shiro.web.filter.authc.FormAuthenticationFilter	基于表单的拦截器；如/**=authc，如果没有登录会跳到相应的登录页面登录
authcBasic	        org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter	Basic HTTP身份验证拦截器
logout	            org.apache.shiro.web.filter.authc.LogoutFilter	退出拦截器，主要属性：redirectUrl：退出成功后重定向的地址（/），示例/logout=logout
noSessionCreation	org.apache.shiro.web.filter.session.NoSessionCreationFilter	不创建会话拦截器，调用subject.getSession(false)不会有什么问题，但是如果subject.getSession(true)将抛出DisabledSessionException异常
perms	            org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter	权限授权拦截器，验证用户是否拥有所有权限；属性和roles一样；示例/user/**=perms["user:create"]
port	            org.apache.shiro.web.filter.authz.PortFilter	端口拦截器，主要属性port(80)：可以通过的端口；示例/test= port[80]，如果用户访问该页面是非80，将自动将请求端口改为80并重定向到该80端口，其他路径/参数等都一样
rest	            org.apache.shiro.web.filter.authz.HttpMethodPermissionFilter	rest风格拦截器，自动根据请求方法构建权限字符串；示例/users=rest[user]，会自动拼出user:read,user:create,user:update,user:delete权限字符串进行权限匹配（所有都得匹配，isPermittedAll）
roles	            org.apache.shiro.web.filter.authz.RolesAuthorizationFilter	角色授权拦截器，验证用户是否拥有所有角色；示例/admin/**=roles[admin]
ssl	                org.apache.shiro.web.filter.authz.SslFilter	SSL拦截器，只有请求协议是https才能通过；否则自动跳转会https端口443；其他和port拦截器一样；
user	            org.apache.shiro.web.filter.authc.UserFilter	用户拦截器，用户已经身份验证/记住我登录的都可；示例/**=user
    *
    * */

  /*
Subject： 代表当前正在执行操作的用户，但Subject代表的可以是人，也可以是任何第三方系统帐号。当然每个subject实例都会被绑定到SercurityManger上。
SecurityManger:SecurityManager是Shiro核心，主要协调Shiro内部的各种安全组件，这个我们不需要太关注，只需要知道可以设置自定的Realm。
Realm:用户数据和Shiro数据交互的桥梁。比如需要用户身份认证、权限认证。都是需要通过Realm来读取数据。
  *
  * */

@Configuration
public class ShiroConfig {

    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        // 这是securityManager
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        // 登录的url
        shiroFilterFactoryBean.setLoginUrl("/login");
        // 登录成功后跳转的url
        shiroFilterFactoryBean.setSuccessUrl("/index");
        // 未授权跳转的url
        shiroFilterFactoryBean.setUnauthorizedUrl("/403");

        LinkedHashMap<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        // 定义filterChain，静态资源不拦截
        filterChainDefinitionMap.put("/css/**", "anon");
        filterChainDefinitionMap.put("/js/**", "anon");
        filterChainDefinitionMap.put("/fonts/**", "anon");
        filterChainDefinitionMap.put("/img/**", "anon");
        // 配置退出过滤器，其中具体的退出代码Shiro已经替我们实现了
        filterChainDefinitionMap.put("/logout", "logout");
        filterChainDefinitionMap.put("/", "anon");
        /*
      最后修改权限配置，将ShiroFilterFactoryBean的filterChainDefinitionMap.put("/**", "authc");
      更改为filterChainDefinitionMap.put("/**", "user");。
      user指的是用户认证通过或者配置了Remember Me记住用户登录状态后可访问。
        * */
        //user指的是用户认证通过或者配置了Remember Me记住用户登录状态后可访问。
        filterChainDefinitionMap.put("/**", "user");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }

    @Bean
    public SecurityManager securityManager() {
        // 配置SecurityManager,并注入shiroRealm
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        // 判断用户是否存在的具体操作
        securityManager.setRealm(shiroRealm());
        // rememberMe功能
        securityManager.setRememberMeManager(rememberMeManager());
        return securityManager;
    }

    @Bean
    public ShiroRealm shiroRealm() {
        return new ShiroRealm();
    }

    /**
     * 下面开始编写rememberMe功能
     *
     * @return
     * @author zhaoyuyang
     * @since 2019/10/16 0016 16:56
     */

    public CookieRememberMeManager rememberMeManager(){
        CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();
        cookieRememberMeManager.setCookie(rememberCookie());
        // rememberCookie加密的密钥
        cookieRememberMeManager.setCipherKey(Base64.decode("4AvVhmFLUs0KTA3Kprsdag=="));
        return cookieRememberMeManager;
    }

    public SimpleCookie rememberCookie() {
        // 设置cookie名称，对应login.html页面的<input type="checkbox" name="rememberMe"/>
        SimpleCookie cookie = new SimpleCookie();
        cookie.setName("rememberCookie");
        // 设置cookie的过期时间，单位为秒，这里为15分钟
        cookie.setMaxAge(900);
        return cookie;
    }



}
