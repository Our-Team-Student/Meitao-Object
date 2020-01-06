package com.jbit.meitao.controller.viewObject;

import lombok.Data;

/**
 * 用来接收后端传递的对象值 并且进行筛选 传递需要的值到前端页面
 */
@Data
public class UserVO {
    private Integer userId;
    private String userName;
    private String userPwd;
    private String loginName;
    private Integer roleId;
    private RoleVO roleVO;
}
