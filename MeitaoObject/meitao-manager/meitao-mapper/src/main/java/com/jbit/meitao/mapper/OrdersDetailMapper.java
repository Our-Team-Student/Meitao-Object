package com.jbit.meitao.mapper;


import java.util.List;

import com.jbit.meitao.pojo.OrdersDetail;
import com.jbit.meitao.pojo.OrdersDetailExample;
import org.apache.ibatis.annotations.Param;

public interface OrdersDetailMapper {
    long countByExample(OrdersDetailExample example);

    int deleteByExample(OrdersDetailExample example);

    int insert(OrdersDetail record);

    int insertSelective(OrdersDetail record);

    List<OrdersDetail> selectByExample(OrdersDetailExample example);

    int updateByExampleSelective(@Param("record") OrdersDetail record, @Param("example") OrdersDetailExample example);

    int updateByExample(@Param("record") OrdersDetail record, @Param("example") OrdersDetailExample example);
}