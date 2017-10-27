package com.czg.myshop.web.controller;


import com.czg.myshop.model.entiy.User;
import com.czg.myshop.model.http.ReturnBean;
import com.czg.myshop.model.http.ReturnMap;
import com.czg.myshop.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api("用户")
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ApiOperation(value = "登陆")
    public ReturnBean<User> login(@RequestParam("account") String account,
                        @RequestParam("password") String password,
                        @RequestParam("imgCode") String imgCode) throws Exception {

        return ReturnMap.SUCCESS(userService.login(account, password, imgCode));
    }

    @ResponseBody
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @ApiOperation(value = "注册")
    public ReturnBean register(@RequestParam("account") String account,
                           @RequestParam("password") String password,
                           @RequestParam(value = "code") String code) throws Exception {
        userService.register(account, password, code);
        return ReturnMap.SUCCESS();
    }


}
