package com.jbit.meitao.mapper;


import java.util.List;

import com.jbit.meitao.pojo.Product;
import com.jbit.meitao.pojo.ProductExample;
import org.apache.ibatis.annotations.Param;

public interface ProductMapper {

    List<Product> selectHot(@Param("page") Integer page);
    long countByExample(ProductExample example);

    int deleteByExample(ProductExample example);

    int deleteByPrimaryKey(Integer productid);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductExample example);

    Product selectByPrimaryKey(Integer productid);

    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
}