package zhaoyy.springboot_shiro;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import zhaoyy.springboot_shiro.entity.User;
import zhaoyy.springboot_shiro.mapper.UserMapper;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringbootShiroApplicationTests {

    @Resource
    UserMapper userMapper;
    @Test
    public void contextLoads() {
        User user = userMapper.selectOne(new QueryWrapper<User>().eq("user_name", "root"));
        System.out.println(user.toString());

    }

}
