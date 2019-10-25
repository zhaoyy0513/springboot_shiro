package zhaoyy.springboot_shiro;

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
        User userById = userMapper.getUserById(3, "");
        if(userById==null){
            System.out.println("未查询到指定用户id");
        }
        User userByStatus = userMapper.getUserByStatus("1", "and id=2");
        if(userByStatus==null){
            System.out.println("未查询到指定用户status");
        }
    }
}
