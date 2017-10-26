package com.czg.myshop.web.controller;


import com.czg.myshop.model.http.ReturnMap;
import com.czg.myshop.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @ResponseBody
    @RequestMapping("/login")
    public Object login(@RequestParam("account") String account,
                        @RequestParam("password") String password,
                        @RequestParam("imgCode") String imgCode) throws Exception {

        return ReturnMap.SUCCESS(userService.login(account, password, imgCode));
    }

    @ResponseBody
    @RequestMapping("/register")
    public Object register(@RequestParam("account") String account,
                           @RequestParam("password") String password,
                           @RequestParam(value = "code") String code) throws Exception {
        userService.register(account, password, code);
        return ReturnMap.SUCCESS();
    }


}
