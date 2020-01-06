package com.jbit.meitao.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jbit.meitao.jedis.dao.JedisDao;
import com.jbit.meitao.mapper.CategoryMapper;
import com.jbit.meitao.pojo.Category;
import com.jbit.meitao.pojo.CategoryExample;
import com.jbit.meitao.pojo.Product;
import com.jbit.meitao.service.CategoryServiceOne;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CategoryServiceOneImpl implements CategoryServiceOne {


    @Autowired
    private JedisDao jedisDao;
    //在redi的spring配置文件中，我们注入的是集群版的jedisCluster
    @Resource
    private CategoryMapper categoryMapper;

    public List<Category> findCategoryAll() {
        ObjectMapper mapper = new ObjectMapper();
        //以下是service层的业务逻辑
        //把hot商品存入redis的目的是什么？不就是为了从Reids中拿hot商品更快吗
        //如果说是第一个访问页面，去调用getHot，先去缓存中找，缓存中肯定没有，那就去找数据库要。
        //第一次的数据只可能来源于数据库，然后放入redis缓存中
        //当有人getHot一次了，是大家都要用的数据，第一次查询之后就应该放到redis中去了
        //后续的人再调用getHot，首先去redis中找，找到就直接拿走，若找不到，再才去数据库中找
        //1.先从缓存中去查，看有没有要找的数据
        System.out.println("从缓存中查数据-----------------------");
        String result = jedisDao.hget("categoryJson", "hot");
        System.out.println(result + "------");
        //2.若缓存中有，则取缓存中的数据
        if (!StringUtils.isEmpty(result)) {
            System.out.println("缓存中有数据-----------------------");
            JavaType javaType = mapper.getTypeFactory().constructParametricType(List.class, Product.class);
            try {
                List<Category> categoryList = mapper.readValue(result, javaType);//用jackson的api把redis中的json字符转换成list集合对象
                return categoryList;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        //2.缓存中没有的话，从数据库中查询
        System.out.println("从数据库中查数据-----------------------");
        CategoryExample categoryExample = new CategoryExample();

        categoryExample.createCriteria().andPCategoryidIsNull();
        List<Category> categories = categoryMapper.selectByExample(categoryExample);
        List<Category> categoryList = categories.stream().map(category -> {
            CategoryExample categoryExample1 = new CategoryExample();
            categoryExample1.createCriteria().andPCategoryidEqualTo(category.getCategoryid());
            category.setCategoryList(categoryMapper.selectByExample(categoryExample1));
            Category category1 = category;
            return category1;
        }).collect(Collectors.toList());
        try {
            String hotjson = mapper.writeValueAsString(categoryList);//用jackson的api把对象变成json的字符串
            //3.向缓存中添加内容（重新将数据放到缓存中）
            jedisDao.hset("categoryJson", "hot", hotjson);
            System.out.println("向缓存中保持数据-----------------------");
        } catch (
                JsonProcessingException e) {
            e.printStackTrace();
        }
        return categoryList;
    }
}