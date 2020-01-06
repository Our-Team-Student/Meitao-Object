package com.jbit.meitao.service.model;

import java.math.BigDecimal;

public class OrdersModel {
    private Integer orderid;

    private Integer customerid;

    private String ordersdate;

    private String deliverydate;

    private BigDecimal amount;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public String getOrdersdate() {
        return ordersdate;
    }

    public void setOrdersdate(String ordersdate) {
        this.ordersdate = ordersdate == null ? null : ordersdate.trim();
    }

    public String getDeliverydate() {
        return deliverydate;
    }

    public void setDeliverydate(String deliverydate) {
        this.deliverydate = deliverydate == null ? null : deliverydate.trim();
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
}