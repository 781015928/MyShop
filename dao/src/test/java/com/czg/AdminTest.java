package com.czg;

import com.czg.myshop.common.utils.date.DateUtils;
import com.czg.myshop.common.utils.security.MD5;
import com.czg.myshop.dao.AdminMapper;
import com.czg.myshop.dao.UserMapper;
import com.czg.myshop.model.entiy.Admin;
import com.czg.myshop.model.entiy.AdminExample;
import com.czg.myshop.model.entiy.User;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class AdminTest {

    private ApplicationContext applicationContext;

    //在setUp这个方法得到spring容器
    @Before
    public void setUp() throws Exception {
        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext-dao.xml");
    }

    @Test
    public void makeAdmin() {
        UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
        AdminMapper adminMapper = (AdminMapper) applicationContext.getBean("adminMapper");
        User user = userMapper.selectByPrimaryKey(100000000);
        System.out.println(user.getAccount());
        user.setPassword(MD5.md5_salt("admin"));
        userMapper.updateByPrimaryKey(user);
        AdminExample example = new AdminExample();
        example.createCriteria().andUidEqualTo(user.getId());
        Admin admin = null;
        List<Admin> admins = adminMapper.selectByExample(example);
        if (admins.isEmpty()) {
            admin = new Admin();
            admin.setMoney(0f);
            admin.setCreatetime(DateUtils.currentTime());
            admin.setUpdatetime(DateUtils.currentTime());
            admin.setLevel("0");
            admin.setUid(user.getId());
            admin.setDeletestate(0);
            adminMapper.insert(admin);
        }else {
            admin=admins.get(0);
        }

        System.out.println(admin);


    }
}
