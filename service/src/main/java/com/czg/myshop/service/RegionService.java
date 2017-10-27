package com.czg.myshop.service;

import com.czg.myshop.model.entiy.Region;

import java.util.List;

public interface RegionService {
    /**
     * @return 获取省列表
     */
    List<Region> getProvinceList();

    /**
     * @return 获取市列表
     */
    List<Region> getCityList(int provinceId);

    /**
     * @return 获取区列表
     */
    List<Region> getDistrictList(int cityId);
}
