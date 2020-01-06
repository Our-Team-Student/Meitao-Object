package com.jbit.meitao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

@Controller
@RequestMapping(value = "/test")
public class TestHttpClientController {
    @RequestMapping(value = "/plist")
    @ResponseBody
    public Object plist() throws IOException {
        System.out.println("进入");
        String s = HttpClientUtil.doGet("http://localhost:8080/product/productListGET");
        System.out.println(s);
        return s;
    }
}
