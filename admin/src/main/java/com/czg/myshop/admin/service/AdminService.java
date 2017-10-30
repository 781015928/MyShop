package com.czg.myshop.admin.service;

import com.czg.myshop.model.entiy.User;

public interface AdminService {

    User login(String account,String password);
}
