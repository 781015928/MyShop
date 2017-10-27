package com.czg.myshop.service;

import com.czg.myshop.model.entiy.Product;
import com.czg.myshop.model.page.PageBean;

public interface ProductService {


    /**
     * @param pageNum
     * @param pageSize
     * @param type  1 销量 2.创建时间 3.更新时间
     * @return
     */
    PageBean<Product> getProductListAll(int pageNum, int pageSize, int type,int order);

    PageBean<Product> getProductListByClass(int pageNum, int pageSize, String productClassId, int type);




}
