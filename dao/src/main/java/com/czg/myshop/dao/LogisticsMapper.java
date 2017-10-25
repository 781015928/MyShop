package com.czg.myshop.dao;

import com.czg.myshop.model.Logistics;
import com.czg.myshop.model.LogisticsExample;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LogisticsMapper {
    int countByExample(LogisticsExample example);

    int deleteByExample(LogisticsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Logistics record);

    int insertSelective(Logistics record);

    List<Logistics> selectByExample(LogisticsExample example);

    Logistics selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Logistics record, @Param("example") LogisticsExample example);

    int updateByExample(@Param("record") Logistics record, @Param("example") LogisticsExample example);

    int updateByPrimaryKeySelective(Logistics record);

    int updateByPrimaryKey(Logistics record);
}