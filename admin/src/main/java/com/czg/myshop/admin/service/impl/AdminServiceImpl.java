package com.czg.myshop.admin.service.impl;

import com.czg.myshop.admin.service.AdminService;
import com.czg.myshop.common.utils.security.MD5;
import com.czg.myshop.dao.AdminMapper;
import com.czg.myshop.dao.UserMapper;
import com.czg.myshop.model.entiy.Admin;
import com.czg.myshop.model.entiy.AdminExample;
import com.czg.myshop.model.entiy.User;
import com.czg.myshop.model.entiy.UserExample;
import com.czg.myshop.model.exception.ExceptionMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    AdminMapper adminMapper;

    @Override
    public User login(String account, String password) {
        UserExample userExample = new UserExample();
        userExample.createCriteria()
                .andAccountEqualTo(account);
        List<User> users = userMapper.selectByExample(userExample);
        if (users.isEmpty()) {
            ExceptionMap.FAIL_EXCEPTION("账号不存在！");

        }
        User user = users.get(0);

        if (!user.getPassword().equals(MD5.md5_salt(password))) {
            ExceptionMap.FAIL_EXCEPTION("账号或密码错误！");
        }
        AdminExample adminExample = new AdminExample();
        adminExample.createCriteria().andUidEqualTo(user.getId());
        List<Admin> admins = adminMapper.selectByExample(adminExample);
        if (admins.isEmpty()){
            ExceptionMap.FAIL_EXCEPTION("权限不足！");
        }

        return user;
    }
}
