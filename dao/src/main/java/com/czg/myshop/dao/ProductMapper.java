package com.czg.myshop.dao;

import com.czg.myshop.model.Product;
import com.czg.myshop.model.ProductExample;
import com.czg.myshop.model.ProductWithBLOBs;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    int countByExample(ProductExample example);

    int deleteByExample(ProductExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ProductWithBLOBs record);

    int insertSelective(ProductWithBLOBs record);

    List<ProductWithBLOBs> selectByExampleWithBLOBs(ProductExample example);

    List<Product> selectByExample(ProductExample example);

    ProductWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ProductWithBLOBs record, @Param("example") ProductExample example);

    int updateByExampleWithBLOBs(@Param("record") ProductWithBLOBs record, @Param("example") ProductExample example);

    int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByPrimaryKeySelective(ProductWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(ProductWithBLOBs record);

    int updateByPrimaryKey(Product record);
}