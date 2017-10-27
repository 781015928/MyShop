package com.czg.myshop.service.impl;

import com.czg.myshop.dao.ProductMapper;
import com.czg.myshop.model.entiy.Product;
import com.czg.myshop.model.entiy.ProductExample;
import com.czg.myshop.model.page.Page;
import com.czg.myshop.model.page.PageBean;
import com.czg.myshop.service.ProductService;
import com.github.pagehelper.PageHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;

    //1 销量 2.创建时间 3.更新时间
    @Override
    public PageBean<Product> getProductListAll(int pageNum, int pageSize, int type, int order) {
        Page.startPage(pageNum, pageSize);
        ProductExample example = new ProductExample();
        String strOrder = order == 0 ? "ASC" : "DESC";
        switch (type) {
            case 1:
                example.setOrderByClause(String.format("self_count %s", strOrder));
                break;
            case 2:
                example.setOrderByClause(String.format("createtime %s", strOrder));
                break;
            case 3:
                example.setOrderByClause(String.format("updatetime %s", strOrder));
                break;
            default:
                example = null;
        }
        List<Product> productList = productMapper.selectByExample(example);
        return Page.getPage(productList);
    }


    @Override
    public PageBean<Product> getProductListByClass(int pageNum, int pageSize, String productClassId, int type) {
        PageHelper.startPage(pageNum, pageSize);


        return null;
    }
}
