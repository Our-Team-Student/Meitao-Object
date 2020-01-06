package com.jbit.meitao.service.model;

import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class CustomerModel {
    private Integer customerId;
    @NotNull(message = "性别不能为空")
    private String gender;
    @NotNull(message = "昵称不能为空")
    private String customerName;
    @NotNull(message = "出生日期不能为空")
    private String birthday;
    @NotNull(message = "登录名不能为空")
    private String login;
    @NotNull(message = "密码不能为空")
    private String pwd;
    @NotNull(message = "电话号码不能为空")
    private String tel;
    @NotNull(message = "收货地址不能为空")
    private String address;
}
