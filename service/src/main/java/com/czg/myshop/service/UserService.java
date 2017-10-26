package com.czg.myshop.service;

import com.czg.myshop.model.entiy.User;

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


}
