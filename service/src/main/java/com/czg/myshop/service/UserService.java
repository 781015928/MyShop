package com.czg.myshop.service;

import com.czg.myshop.model.entiy.User;
import com.czg.myshop.model.page.PageBean;

public interface UserService {

    /**
     * @param account
     * @param password
     * @param imgCode  图片验证码
     */
    User login(String account, String password, String imgCode) throws Exception;


    /**
     * @param account  账号
     * @param password 密码
     * @param code     验证码
     */
    void register(String account, String password, String code) throws Exception;


    /**
     * @param account
     * @param password
     * @param code     验证码
     */
    void forgetPassWord(String account, String password, String code);


    /**
     * @param headImg
     * @param defaultAddressId
     * @param sex      更新用户信息
     */
    void updateUserInfo(String headImg, String defaultAddressId, Integer sex);


    /**
     * @param uid 管理员id
     * @param pageNum  分页下标
     * @param pageSize  分页个数
     * @return
     */
    PageBean<User> getUserList(int uid,int pageNum, int pageSize);


}
