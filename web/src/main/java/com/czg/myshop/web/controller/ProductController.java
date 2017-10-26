package com.czg.myshop.web.controller;

import com.czg.myshop.common.Constants;
import com.czg.myshop.model.http.ReturnMap;
import com.czg.myshop.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductService productService;

    @ResponseBody
    @RequestMapping("/getProductListAll")
    public Object getProductListAll(@RequestParam(value = "pageNum", defaultValue = Constants.DEFULT_PAGENUM) int pageNum,
                                    @RequestParam(value = "pageSize", defaultValue = Constants.DEFULT_PAGESIZE) int pageSize,
                                    @RequestParam(value = "type", defaultValue = Constants.DEFULT_PAGESIZE) int type) throws Exception {
        return ReturnMap.SUCCESS(productService.getProductListAll(pageNum, pageSize, type));
    }


}
