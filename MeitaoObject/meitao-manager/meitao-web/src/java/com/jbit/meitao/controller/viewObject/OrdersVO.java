package com.jbit.meitao.controller.viewObject;

import lombok.Data;

import java.math.BigDecimal;
@Data
public class OrdersVO {
    private Integer orderid;

    private Integer customerid;

    private String ordersdate;

    private String deliverydate;

    private BigDecimal amount;

}