package com.czg.myshop.web.controller;


import com.czg.myshop.model.entiy.Region;
import com.czg.myshop.model.http.ReturnBean;
import com.czg.myshop.model.http.ReturnMap;
import com.czg.myshop.service.RegionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;


@Controller
@RequestMapping("/region")
public class RegionController {

    @Autowired
    RegionService regionService;

    /**
     * @return 获取省列表
     */

    @ResponseBody
    @ApiOperation(value = "获取省列表")
    @RequestMapping(value = "/getProvinceList", method = RequestMethod.GET)
    public ReturnBean<List<Region>> getProvinceList() {
        return ReturnMap.SUCCESS(regionService.getProvinceList());
    }

    ;

    /**
     * @param provinceId 省id
     * @return 获取市列表
     */
    @ResponseBody
    @RequestMapping(value = "/getCityList", method = RequestMethod.POST)
    @ApiOperation(value = "获取市列表")
    public ReturnBean<List<Region>> getCityList(@ApiParam(required = true, value = "省id")
                              @RequestParam("provinceId") Integer provinceId) {
        return ReturnMap.SUCCESS(regionService.getCityList(provinceId));
    }


    /**
     * @param cityId 市id
     * @return 获取区列表
     */
    @ResponseBody
    @RequestMapping(value = "/getDistrictList", method = RequestMethod.GET)
    @ApiOperation(value = "获取区列表")
    public ReturnBean<List<Region>> getDistrictList(@ApiParam(required = true, value = "市id")
                                  @RequestParam("cityId") Integer cityId) {
        return ReturnMap.SUCCESS(regionService.getDistrictList(cityId));
    }


}
