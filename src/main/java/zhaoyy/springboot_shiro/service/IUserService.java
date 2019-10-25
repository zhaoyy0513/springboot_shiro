package zhaoyy.springboot_shiro.service;

import zhaoyy.springboot_shiro.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhaoyy
 * @since 2019-10-17
 */
public interface IUserService extends IService<User> {

    /**
    * 通过id获取user
    *
    * @param id
    * @return zhaoyy.springboot_shiro.entity.User
    * @author zhaoyuyang
    * @since 2019/10/23 0023 9:41
    */
    User getUserById(Integer id);
}
