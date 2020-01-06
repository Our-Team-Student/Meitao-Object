package com.jbit.meitao.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jbit.meitao.pojo.Product;
import com.jbit.meitao.service.ProductService1;
import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/portal")
public class PortalController {

    @Autowired
    private ProductService1 productService1;

    @PostMapping("/portalList")//main其实就代表着一个资源对应一个唯一的资源标识
    @ResponseBody
    public Object ajaxmain() throws Exception {
        System.out.println("gethot---------------------");
        List<Product> list = productService1.getHot();
        return list;
    }
}
