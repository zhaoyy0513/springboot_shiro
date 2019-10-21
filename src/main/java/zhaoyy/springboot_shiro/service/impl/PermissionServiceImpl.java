package zhaoyy.springboot_shiro.service.impl;

import zhaoyy.springboot_shiro.entity.Permission;
import zhaoyy.springboot_shiro.mapper.PermissionMapper;
import zhaoyy.springboot_shiro.service.IPermissionService;
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
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

}
