package com.jbit.meitao.controller;

import com.jbit.meitao.pojo.Category;
import com.jbit.meitao.service.CategoryServiceOne;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 商品分类
 */
@RestController
@RequestMapping(value = "/category")
public class CategoryController {
    @Resource
    private CategoryServiceOne categoryServiceOne;

    /**
     * 查询商品的一级菜单和二级菜单
     *
     * @return
     */
    @PostMapping(value = "/categoryList")
    public Object categoryList() {
        List<Category> categoryAll = categoryServiceOne.findCategoryAll();
        return categoryAll;
    }
}