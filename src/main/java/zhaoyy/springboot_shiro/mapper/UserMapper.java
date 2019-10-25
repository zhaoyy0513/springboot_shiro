package zhaoyy.springboot_shiro.mapper;

import org.apache.ibatis.annotations.Param;
import zhaoyy.springboot_shiro.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhaoyy
 * @since 2019-10-17
 */
public interface UserMapper extends BaseMapper<User> {

    /**
    * 通过id获取user
    *
    * @param id
	* @param sql
    * @return zhaoyy.springboot_shiro.entity.User
    * @author zhaoyuyang
    * @since 2019/10/23 0023 14:08
    */
    User getUserById(@Param(value = "id") Integer id,@Param(value = "sql")String sql);


    /**
    * 通过status获取用户
    *
    * @param status
	* @param sql
    * @return zhaoyy.springboot_shiro.entity.User
    * @author zhaoyuyang
    * @since 2019/10/24 0024 17:35
    */
    User getUserByStatus(@Param(value = "status")String status, @Param(value = "sql")String sql);
}
