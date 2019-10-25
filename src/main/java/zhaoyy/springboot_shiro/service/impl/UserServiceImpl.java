package zhaoyy.springboot_shiro.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import zhaoyy.springboot_shiro.entity.User;
import zhaoyy.springboot_shiro.mapper.UserMapper;
import zhaoyy.springboot_shiro.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaoyy
 * @since 2019-10-17
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
    @Resource
    UserMapper userMapper;

    @Override
    public User getUserById(Integer id) {
        User user = userMapper.getUserById(id,"and status=1");
        return user;
    }
}
