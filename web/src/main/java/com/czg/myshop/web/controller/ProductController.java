package com.czg.myshop.web.controller;

import com.czg.myshop.common.Constants;
import com.czg.myshop.model.entiy.Product;
import com.czg.myshop.model.http.ReturnBean;
import com.czg.myshop.model.http.ReturnMap;
import com.czg.myshop.model.page.PageBean;
import com.czg.myshop.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductService productService;

    /**
     * @param pageNum
     * @param pageSize
     * @param type     1 销量 2.创建时间 3.更新时间
     * @param order    0.正序,1 倒序
     * @return
     * @throws Exception
     */
    @ResponseBody
    @ApiOperation(value = "获取所有商品")
    @RequestMapping(value = "/getProductListAll", method = RequestMethod.GET)
    public ReturnBean<PageBean<Product>> getProductListAll(@RequestParam(value = "pageNum", defaultValue = Constants.DEFULT_PAGENUM) int pageNum,
                                                           @RequestParam(value = "pageSize", defaultValue = Constants.DEFULT_PAGESIZE) int pageSize,
                                                           @RequestParam(value = "type", defaultValue = "0") int type,
                                                           @RequestParam(value = "order", defaultValue = "0") int order
    ) throws Exception {
        return ReturnMap.SUCCESS(productService.getProductListAll(pageNum, pageSize, type, order));
    }


}
