package com.jbit.meitao.error;

/**
 * 枚举类型
 */
public enum EmBusinessError implements CommonError {
    //定义一个通用的错误类型00001
    PARAMETER_VALIDATION_ERROR(10001, "参数不和法"),

    UNKNOWN_ERROR(10002, "未知错误"),
    //10000开头为用户信息错误定义
    USER_LOGIN_FAIL(20002, "用户账户或者密码不正确"),
    //30000开头为交易信息错误定义
    //用户是否登录
    USER_NOT_LOGIN(20003, "用户还未登录，权限不足,请登录!!!"),
    //用户不存在
    USER_NOT_EXITS(20001, "用戶不存在");

    //定义一个登录失败的

    private EmBusinessError(int errCode, String errMsg) {
        this.errCode = errCode;
        this.errMsg = errMsg;
    }

    private int errCode;
    private String errMsg;

    @Override
    public int getErrorCode() {
        return this.errCode;
    }

    @Override
    public String getErrMsg() {
        return this.errMsg;
    }

    @Override
    public CommonError setErrMsg(String errMsg) {
        this.errMsg = errMsg;
        return this;
    }


}
