package com.jbit.meitao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/path")
public class PathController {
    @RequestMapping(value = "/power")
    public String power() {
        return "management/PowerManagement";
    }

    //打开商品列表的路径
    @RequestMapping(value = "/productList")
    public String productList() {
        return "Product/ProductList";
    }
}
