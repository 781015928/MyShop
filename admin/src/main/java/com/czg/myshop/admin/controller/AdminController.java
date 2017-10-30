package com.czg.myshop.admin.controller;

import com.czg.myshop.admin.service.AdminService;
import com.czg.myshop.model.entiy.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;


    @RequestMapping("/login")
    public ModelAndView login(String account, String password) {
        User user = adminService.login(account, password);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/main");
        modelAndView.addObject("user", user);
        return modelAndView;
    }
}
