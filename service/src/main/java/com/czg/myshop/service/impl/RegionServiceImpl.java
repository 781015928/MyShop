package com.czg.myshop.service.impl;

import com.czg.myshop.dao.RegionMapper;
import com.czg.myshop.model.entiy.Region;
import com.czg.myshop.model.entiy.RegionExample;
import com.czg.myshop.service.RegionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegionServiceImpl implements RegionService {
    @Autowired
    RegionMapper regionMapper;

    /**
     * @return 获取省列表
     */
    @Override
    public List<Region> getProvinceList() {
        RegionExample regionExample = new RegionExample();
        RegionExample.Criteria criteria = regionExample.createCriteria();
        criteria.andLevelEqualTo(1);
        return regionMapper.selectByExample(regionExample);
    }

    /**
     * @return 获取市列表
     */
    @Override
    public List<Region> getCityList(int provinceId) {
        RegionExample regionExample = new RegionExample();
        RegionExample.Criteria criteria = regionExample.createCriteria();
        criteria.andLevelEqualTo(2);
        criteria.andParentIdEqualTo(provinceId);
        return regionMapper.selectByExample(regionExample);
    }

    /**
     * @return 获取区列表
     */
    @Override
    public List<Region> getDistrictList(int cityId) {
        RegionExample regionExample = new RegionExample();
        RegionExample.Criteria criteria = regionExample.createCriteria();
        criteria.andLevelEqualTo(3);
        criteria.andParentIdEqualTo(cityId);
        return regionMapper.selectByExample(regionExample);
    }

}
