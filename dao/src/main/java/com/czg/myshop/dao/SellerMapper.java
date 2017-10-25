package com.czg.myshop.dao;

import com.czg.myshop.model.Seller;
import com.czg.myshop.model.SellerExample;
import com.czg.myshop.model.SellerWithBLOBs;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SellerMapper {
    int countByExample(SellerExample example);

    int deleteByExample(SellerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SellerWithBLOBs record);

    int insertSelective(SellerWithBLOBs record);

    List<SellerWithBLOBs> selectByExampleWithBLOBs(SellerExample example);

    List<Seller> selectByExample(SellerExample example);

    SellerWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SellerWithBLOBs record, @Param("example") SellerExample example);

    int updateByExampleWithBLOBs(@Param("record") SellerWithBLOBs record, @Param("example") SellerExample example);

    int updateByExample(@Param("record") Seller record, @Param("example") SellerExample example);

    int updateByPrimaryKeySelective(SellerWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(SellerWithBLOBs record);

    int updateByPrimaryKey(Seller record);
}