package com.jbit.meitao.mapper;

import java.util.List;

import com.jbit.meitao.pojo.Functions;
import com.jbit.meitao.pojo.FunctionsExample;
import org.apache.ibatis.annotations.Param;

public interface FunctionsMapper {
    long countByExample(FunctionsExample example);

    int deleteByExample(FunctionsExample example);

    int deleteByPrimaryKey(Integer fId);

    int insert(Functions record);

    int insertSelective(Functions record);

    List<Functions> selectByExample(FunctionsExample example);

    Functions selectByPrimaryKey(Integer fId);

    int updateByExampleSelective(@Param("record") Functions record, @Param("example") FunctionsExample example);

    int updateByExample(@Param("record") Functions record, @Param("example") FunctionsExample example);

    int updateByPrimaryKeySelective(Functions record);

    int updateByPrimaryKey(Functions record);
}