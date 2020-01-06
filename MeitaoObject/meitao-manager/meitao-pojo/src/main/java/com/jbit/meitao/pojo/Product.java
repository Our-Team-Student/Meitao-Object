package com.jbit.meitao.pojo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class Product {
    private Integer productid;

    private String title;

    private String productdesc;

    private BigDecimal originaprice;

    private BigDecimal currentprice;

    private Integer areaid;

    private Integer shopid;

    private Integer categoryid;

    private String picture;

    private Integer salescount;

    private String iscommend;
}