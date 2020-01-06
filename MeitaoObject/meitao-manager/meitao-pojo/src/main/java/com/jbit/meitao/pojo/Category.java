package com.jbit.meitao.pojo;

import lombok.Data;

import java.util.List;

@Data
public class Category {
    private Integer categoryid;

    private String categoryname;

    private Integer pCategoryid;

    private List<Category> categoryList;
}