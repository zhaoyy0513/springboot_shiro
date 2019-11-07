package zhaoyy.springboot_shiro.config;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * @author zhaoyuyang
 * @createTime 2019/11/7 0007 15:48
 */
@WebListener
public class LoginSessionListener implements HttpSessionListener {
    public static int online = 0;

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        online++;
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        // 因为每次减1之后又会加1 所以直接-2 相当于-1
        online = online - 2;
    }
}
