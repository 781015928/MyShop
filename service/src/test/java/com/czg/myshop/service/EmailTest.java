package com.czg.myshop.service;


import com.czg.myshop.common.utils.mail.SendEmailUtils;
import org.junit.Test;

/**
 * 类 名 称  ： EmailTest.class
 * 项目 名称 ：MyShop
 * 作    者 ：  czg
 * 日    期 ：  2017/10/29.
 * 作    用 ： 在这里写一句话描述作用
 */
public class EmailTest {
    @Test
    public void send() {
        SendEmailUtils.send("781015928@qq.com","Test");

    }
}
