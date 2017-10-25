package com.czg;

import com.czg.myshop.dao.UserMapper;
import com.czg.myshop.model.User;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserMapperTest {

    private ApplicationContext applicationContext;

    //在setUp这个方法得到spring容器
    @Before
    public void setUp() throws Exception {
        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext-dao.xml");
    }

    @Test
    public void testFindUserById() throws Exception {

        UserMapper userDao = (UserMapper) applicationContext.getBean("userMapper");

        //调用userDao的方法
        User user = userDao.selectByPrimaryKey(1);

        System.out.println(user);

    }
}
