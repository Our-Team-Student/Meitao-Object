package com.jbit.meitao.pojo;

import lombok.Data;

@Data
public class User {
    private Integer userId;

    private String userName;

    private String userPwd;

    private String loginName;

    private Integer roleId;

    private Role role;

}