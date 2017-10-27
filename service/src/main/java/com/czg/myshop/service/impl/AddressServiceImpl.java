package com.czg.myshop.service.impl;

import com.czg.myshop.common.utils.date.DateUtils;
import com.czg.myshop.common.utils.valid.RegexUtils;
import com.czg.myshop.common.utils.valid.TextUtils;
import com.czg.myshop.dao.AddressMapper;
import com.czg.myshop.dao.RegionMapper;
import com.czg.myshop.dao.UserMapper;
import com.czg.myshop.model.entiy.Address;
import com.czg.myshop.model.entiy.AddressExample;
import com.czg.myshop.model.entiy.Region;
import com.czg.myshop.model.entiy.User;
import com.czg.myshop.model.exception.ExceptionMap;
import com.czg.myshop.model.page.Page;
import com.czg.myshop.model.page.PageBean;
import com.czg.myshop.service.AddressService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {


    @Autowired
    AddressMapper addressMapper;
    @Autowired
    RegionMapper regionMapper;
    @Autowired
    UserMapper userMapper;

    /**
     * @param uid
     * @param phone
     * @param name
     * @param street
     * @param regionId
     * @param defult   0 默认 1 非默认
     */
    @Override
    public void saveAddress(int uid, String phone, String name, String street, int regionId, int defult) {
        Region region = regionMapper.selectByPrimaryKey(regionId);
        if (region == null) {
            ExceptionMap.FAIL_EXCEPTION("该地区不存在!");
        }
        if (!RegexUtils.isMobile(phone)) {
            ExceptionMap.FAIL_EXCEPTION("手机号格式不正确!");
        }
        if (TextUtils.isEmpty(name)) {
            ExceptionMap.FAIL_EXCEPTION("姓名不能为空!");
        }
        if (TextUtils.isEmpty(street) || street.length() <= 5) {
            ExceptionMap.FAIL_EXCEPTION("地址长度大于5!");
        }

        Address address = new Address();
        address.setUid(uid);
        address.setPhone(phone);
        address.setName(name);
        address.setStreet(street);
        address.setRegionId(regionId);
        address.setUpdatetime(DateUtils.currentTime());
        address.setCreatetime(DateUtils.currentTime());
        User user = userMapper.selectByPrimaryKey(uid);
        if (user.getDefaultAddressId() == null || user.getDefaultAddressId() == 0) {


        } else {


        }


        addressMapper.insert(address);
    }

    @Override
    public void editAddress(int id, String phone, String name, String street, int regionId, int defult) {
        Address address = addressMapper.selectByPrimaryKey(id);
        if (address == null) {
            ExceptionMap.FAIL_EXCEPTION("该地址不存在!");
        }
        Region region = regionMapper.selectByPrimaryKey(regionId);
        if (region == null) {
            ExceptionMap.FAIL_EXCEPTION("该地区不存在!");
        }
        if (!RegexUtils.isMobile(phone)) {
            ExceptionMap.FAIL_EXCEPTION("手机号格式不正确!");
        }
        if (TextUtils.isEmpty(name)) {
            ExceptionMap.FAIL_EXCEPTION("姓名不能为空!");
        }
        if (TextUtils.isEmpty(street) || street.length() <= 5) {
            ExceptionMap.FAIL_EXCEPTION("地址长度大于5!");
        }
        address.setId(id);
        address.setRegionId(regionId);
        address.setPhone(phone);
        address.setName(name);
        address.setStreet(street);
        address.setUpdatetime(DateUtils.currentTime());
        addressMapper.updateByPrimaryKey(address);
    }

    @Override
    public void deleteAddress(int id) {
        Address address = addressMapper.selectByPrimaryKey(id);
        if (address == null) {
            ExceptionMap.FAIL_EXCEPTION("该地址不存在!");
        }
        address.setDeletestate(1);
        addressMapper.updateByPrimaryKey(address);
    }

    @Override
    public PageBean<Address> getAddressList(int uid, int pageNum, int pageSize) {
        Page.startPage(pageNum, pageSize);
        AddressExample addressExample = new AddressExample();
        AddressExample.Criteria criteria = addressExample.createCriteria();
        criteria.andDeletestateEqualTo(0);
        criteria.andUidEqualTo(uid);
        List<Address> addresses = addressMapper.selectByExample(addressExample);
        return Page.getPage(addresses);
    }


}
