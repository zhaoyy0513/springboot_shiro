package zhaoyy.springboot_shiro.service.impl;

import zhaoyy.springboot_shiro.entity.Role;
import zhaoyy.springboot_shiro.mapper.RoleMapper;
import zhaoyy.springboot_shiro.service.IRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaoyy
 * @since 2019-10-17
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

}
