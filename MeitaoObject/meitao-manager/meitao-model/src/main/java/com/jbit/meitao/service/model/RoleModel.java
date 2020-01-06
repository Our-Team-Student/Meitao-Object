package com.jbit.meitao.service.model;

import com.jbit.meitao.pojo.Privilege;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

@Data
public class RoleModel {
    private Integer roleId;
    @NotNull(message = "角色信息不能！！")
    private String roleName;
    private String roleDescription;
    private List<Privilege> privileges;
}
