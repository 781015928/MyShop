package com.czg.myshop.web.controller;

import com.czg.myshop.common.Constants;
import com.czg.myshop.model.entiy.Address;
import com.czg.myshop.model.http.ReturnBean;
import com.czg.myshop.model.http.ReturnMap;
import com.czg.myshop.model.page.PageBean;
import com.czg.myshop.service.AddressService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/address")
public class AddressController {

    @Autowired
    AddressService addressService;


    /**
     * @param uid
     * @param phone
     * @param name
     * @param street
     * @param regionId
     * @param defult 0 默认 1 非默认
     * @return 添加收货地址
     */
    @ResponseBody
    @ApiOperation(value = "添加收货地址")
    @RequestMapping(value = "/saveAddress", method = RequestMethod.POST)
    public ReturnBean<String> saveAddress(int uid, String phone, String name, String street, Integer regionId,int defult) {
        addressService.saveAddress(uid, phone, name, street, regionId,defult);
        return ReturnMap.SUCCESS("");
    }

    /**
     * @return 编辑收货地址
     */
    @ResponseBody
    @ApiOperation(value = "编辑收货地址")
    @RequestMapping(value = "/editAddress", method = RequestMethod.POST)
    public ReturnBean<String> editAddress(Integer id, String phone, String name, String street, Integer regionId,Integer defult) {
        addressService.editAddress(id, phone, name, street, regionId,defult);
        return ReturnMap.SUCCESS("");
    }

    /**
     * @return 删除收货地址
     */
    @ResponseBody
    @ApiOperation(value = "删除收货地址")
    @RequestMapping(value = "/deleteAddress", method = RequestMethod.DELETE)
    public ReturnBean<String> deleteAddress(Integer id) {
        addressService.deleteAddress(id);
        return ReturnMap.SUCCESS("");
    }

    /**
     * @return 收货地址列表
     */
    @ResponseBody
    @ApiOperation(value = "收货地址列表")
    @RequestMapping(value = "/getAddressList", method = RequestMethod.GET)
    public ReturnBean<PageBean<Address>> getAddressList(@RequestParam("uid") Integer uid,
                                 @RequestParam(value = "pageNum", defaultValue = Constants.DEFULT_PAGENUM) Integer pageNum,
                                 @RequestParam(value = "pageSize", defaultValue = Constants.DEFULT_PAGESIZE) Integer pageSize) {

        return ReturnMap.SUCCESS(addressService.getAddressList(uid, pageNum, pageSize));
    }

}
