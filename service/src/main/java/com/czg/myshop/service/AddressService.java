package com.czg.myshop.service;

import com.czg.myshop.model.entiy.Address;
import com.czg.myshop.model.page.PageBean;

public interface AddressService {
    /**
     * @param uid
     * @param phone
     * @param name
     * @param street
     * @param regionId
     * @param defult 0 默认 1 非默认
     * @return 添加收货地址
     */
    void saveAddress(int uid, String phone, String name, String street, int regionId,int defult);

    /**
     * @param id
     * @param phone
     * @param name
     * @param street
     * @param regionId
     */
    void editAddress(int uid,int id, String phone, String name, String street, int regionId,int defult);

    /**
     * @param id 删除收货地址
     */
    void deleteAddress(int id);

    /**
     * @param uid
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageBean<Address> getAddressList(int uid, int pageNum, int pageSize);
}
