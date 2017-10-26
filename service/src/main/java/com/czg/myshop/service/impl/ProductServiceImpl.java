package com.czg.myshop.service.impl;

import com.czg.myshop.dao.ProductMapper;
import com.czg.myshop.model.entiy.Product;
import com.czg.myshop.model.page.Page;
import com.czg.myshop.model.page.PageBean;
import com.czg.myshop.service.ProductService;
import com.github.pagehelper.PageHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;

    public PageBean<Product> getProductListAll(int pageNum, int pageSize, int type) {
        Page.startPage(pageNum, pageSize);
        return Page.getPage(productMapper.selectByExample(null));
    }

    public PageBean<Product> getProductListByClass(int pageNum, int pageSize, String productClassId, int type) {
        PageHelper.startPage(pageNum, pageSize);


        return null;
    }
}
