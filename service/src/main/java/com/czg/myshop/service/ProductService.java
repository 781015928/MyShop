package com.czg.myshop.service;

import com.czg.myshop.model.entiy.Product;
import com.czg.myshop.model.page.PageBean;

public interface ProductService {



    PageBean<Product> getProductListAll(int pageNum, int pageSize, int type);

    PageBean<Product> getProductListByClass(int pageNum, int pageSize, String productClassId, int type);




}
