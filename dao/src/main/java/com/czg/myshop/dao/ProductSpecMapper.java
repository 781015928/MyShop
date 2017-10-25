package com.czg.myshop.dao;

import com.czg.myshop.model.ProductSpec;
import com.czg.myshop.model.ProductSpecExample;
import com.czg.myshop.model.ProductSpecWithBLOBs;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductSpecMapper {
    int countByExample(ProductSpecExample example);

    int deleteByExample(ProductSpecExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ProductSpecWithBLOBs record);

    int insertSelective(ProductSpecWithBLOBs record);

    List<ProductSpecWithBLOBs> selectByExampleWithBLOBs(ProductSpecExample example);

    List<ProductSpec> selectByExample(ProductSpecExample example);

    ProductSpecWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ProductSpecWithBLOBs record, @Param("example") ProductSpecExample example);

    int updateByExampleWithBLOBs(@Param("record") ProductSpecWithBLOBs record, @Param("example") ProductSpecExample example);

    int updateByExample(@Param("record") ProductSpec record, @Param("example") ProductSpecExample example);

    int updateByPrimaryKeySelective(ProductSpecWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(ProductSpecWithBLOBs record);

    int updateByPrimaryKey(ProductSpec record);
}