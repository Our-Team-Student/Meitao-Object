package com.jbit.meitao.controller;


import com.jbit.meitao.error.BusinessException;
import com.jbit.meitao.error.EmBusinessError;
import com.jbit.meitao.response.CommonReturnType;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/***
 * 定义一个自动捕捉异常的方法 并且返回到页面
 */
public class BaseController {
    //申明一个
    public static final String CONTENT_TYPE_FORMED = "application/x-www-form-urlencoded";

    //定义一个execiptionhandler解决web未被controller层吸收的execiption
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public Object handlerException(HttpServletRequest request, Exception ex) {
        /*判断ex 是不是 BusinessException*/
        Map<String, Object> responseData = new HashMap<>();
        if (ex instanceof BusinessException) {
            BusinessException businessException = (BusinessException) ex;
            responseData.put("errCode", businessException.getErrorCode());
            responseData.put("errMsg", businessException.getErrMsg());
        } else {
            responseData.put("errCode", EmBusinessError.UNKNOWN_ERROR.getErrorCode());
            responseData.put("errMsg", EmBusinessError.UNKNOWN_ERROR.getErrMsg());
        }
        return CommonReturnType.create(responseData, "fail");
    }
}
