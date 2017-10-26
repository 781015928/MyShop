package com.czg.myshop.dao;

import com.czg.myshop.model.entiy.User;
import com.czg.myshop.model.entiy.UserExample;
import com.czg.myshop.mybatis.MybatisMapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
@MybatisMapper
public interface UserMapper {

    User selectUserByAccount(String account);

    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}