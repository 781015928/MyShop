package com.czg.myshop.service.impl;

import com.czg.myshop.common.utils.date.DateUtils;
import com.czg.myshop.common.utils.security.MD5;
import com.czg.myshop.common.utils.valid.RegexUtils;
import com.czg.myshop.common.utils.valid.TextUtils;
import com.czg.myshop.dao.AdminMapper;
import com.czg.myshop.dao.UserMapper;
import com.czg.myshop.model.entiy.Admin;
import com.czg.myshop.model.entiy.AdminExample;
import com.czg.myshop.model.entiy.User;
import com.czg.myshop.model.entiy.UserExample;
import com.czg.myshop.model.exception.ExceptionMap;
import com.czg.myshop.model.page.Page;
import com.czg.myshop.model.page.PageBean;
import com.czg.myshop.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    AdminMapper adminMapper;

    @Override
    public User login(String account, String password, String imgCode) throws Exception {
        String password_salt = MD5.md5_salt(password);
        User user = userMapper.selectUserByAccount(account);
        if (user == null) {
            ExceptionMap.BUSINESS_EXCEPTION("用户不存在!");
        }
        if (!user.getPassword().equals(password_salt)) {
            ExceptionMap.BUSINESS_EXCEPTION("账号或密码错误!");
        }

        return user;
    }

    @Override
    public void register(String account, String password, String code) throws Exception {
        if (TextUtils.isEmpty(account)) {
            ExceptionMap.FAIL_EXCEPTION("账号不能为空！");
        }
        User user = userMapper.selectUserByAccount(account);
        if (user != null) {
            ExceptionMap.BUSINESS_EXCEPTION("该账号已被注册过!");
        }
        user = new User();
        user.setAccount(account);
        if (RegexUtils.isMobile(account)) {
            user.setPhone(account);
        } else if (RegexUtils.checkEmail(account)) {
            user.setEmail(account);
        } else {
            ExceptionMap.FAIL_EXCEPTION("请输入正确的手机号或者邮箱！");
        }
        user.setPassword(MD5.md5_salt(password));
        user.setCreatetime(DateUtils.currentTime());
        user.setUpdatetime(DateUtils.currentTime());
        userMapper.insertSelective(user);
    }

    @Override
    public void forgetPassWord(String account, String password, String code) {

    }

    @Override
    public void updateUserInfo(String headImg, String defaultAddressId, Integer sex) {

    }

    @Override
    public PageBean<User> getUserList(int uid, int pageNum, int pageSize) {
        AdminExample adminExample = new AdminExample();
        adminExample.createCriteria().andUidEqualTo(uid);
        List<Admin> admins = adminMapper.selectByExample(adminExample);
        if (admins == null || admins.isEmpty()) {
            ExceptionMap.FAIL_EXCEPTION("权限不足！");
        }
        UserExample userExample = new UserExample();
        userExample.createCriteria().andDeletestateEqualTo(0);
        Page.startPage(pageNum, pageSize);
        return Page.getPage(userMapper.selectByExample(userExample));
    }
}
