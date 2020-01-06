package com.jbit.meitao.mapper;


import java.util.List;

import com.jbit.meitao.pojo.Privilege;
import com.jbit.meitao.pojo.PrivilegeExample;
import org.apache.ibatis.annotations.Param;

public interface PrivilegeMapper {
    long countByExample(PrivilegeExample example);

    int deleteByExample(PrivilegeExample example);

    int deleteByPrimaryKey(Integer privilegeId);

    int insert(Privilege record);

    int insertSelective(Privilege record);

    List<Privilege> selectByExample(PrivilegeExample example);

    /*   <!--根据id进行查询到一级菜单-->*/
    List<Privilege> selectByKeyId(@Param("id") Integer id);

    List<Privilege> selectPrivilegeByRoleId(int id);//到PrivilegeMapper.xml文件中对此方法进行映射配置

    Privilege selectByPrimaryKey(Integer privilegeId);

    int updateByExampleSelective(@Param("record") Privilege record, @Param("example") PrivilegeExample example);

    int updateByExample(@Param("record") Privilege record, @Param("example") PrivilegeExample example);

    int updateByPrimaryKeySelective(Privilege record);

    int updateByPrimaryKey(Privilege record);
}