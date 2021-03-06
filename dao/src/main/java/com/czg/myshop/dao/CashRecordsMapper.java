package com.czg.myshop.dao;

import com.czg.myshop.model.entiy.CashRecords;
import com.czg.myshop.model.entiy.CashRecordsExample;
import com.czg.myshop.mybatis.MybatisMapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
@MybatisMapper
public interface CashRecordsMapper {
    int countByExample(CashRecordsExample example);

    int deleteByExample(CashRecordsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CashRecords record);

    int insertSelective(CashRecords record);

    List<CashRecords> selectByExampleWithBLOBs(CashRecordsExample example);

    List<CashRecords> selectByExample(CashRecordsExample example);

    CashRecords selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CashRecords record, @Param("example") CashRecordsExample example);

    int updateByExampleWithBLOBs(@Param("record") CashRecords record, @Param("example") CashRecordsExample example);

    int updateByExample(@Param("record") CashRecords record, @Param("example") CashRecordsExample example);

    int updateByPrimaryKeySelective(CashRecords record);

    int updateByPrimaryKeyWithBLOBs(CashRecords record);

    int updateByPrimaryKey(CashRecords record);
}