package com.czg.myshop.web.controller;

import com.czg.myshop.model.http.ReturnBean;
import com.czg.myshop.model.http.ReturnMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/order")
public class OrderController {

    /**
     * @return 下单
     */
    @ResponseBody
    @RequestMapping(value = "/saveOrder",method = RequestMethod.POST)
    @ApiOperation(value = "下单",hidden = true)
    public ReturnBean<String> saveOrder() {
        return ReturnMap.SUCCESS("");
    }

    /**
     * @return 订单列表
     */
    @ResponseBody
    @ApiOperation(value = "订单列表",hidden = true)
    @RequestMapping(value = "/getOrderList",method = RequestMethod.GET)
    public ReturnBean<String> getOrderList() {
        return ReturnMap.SUCCESS("");
    }


    /**
     * @return 订单详情
     */
    @ResponseBody
    @ApiOperation(value = "订单详情",hidden = true)
    @RequestMapping(value = "/getOrderDetail",method = RequestMethod.GET)
    public ReturnBean<String> getOrderDetail() {
        return ReturnMap.SUCCESS("");
    }
}
