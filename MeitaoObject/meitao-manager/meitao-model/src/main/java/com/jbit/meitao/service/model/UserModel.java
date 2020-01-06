package com.jbit.meitao.service.model;


import com.jbit.meitao.pojo.Role;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;


import javax.validation.constraints.NotNull;

@Data
public class UserModel {
    private Integer userId;
    @NotNull(message = "真实姓名不能为空！！")
    private String userName;
    @NotNull(message = "登录名不能为空！！")
    private String loginName;
    @NotNull(message = "密码不能为空！！")
    private String userPwd;
    @NotBlank(message = "角色名称不能为空！！")
    private Integer roleId;
    @NotNull(message = "角色名称不能为空")
    private RoleModel roleModel;

}
