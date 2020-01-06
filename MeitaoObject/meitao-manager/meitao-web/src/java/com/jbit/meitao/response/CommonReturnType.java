package com.jbit.meitao.response;

import lombok.Data;

/**
 * json 返回值的类
 */
@Data
public class CommonReturnType {
    //表名打印返回处理请求的结果"success" 或者"fail"
    private String status;
    //若status=success 则data内返回需要的json数据
    //容status=fail，则data使用通用的错误 码格式
    private Object data;

    //定义一个通用的创建方法
    public static CommonReturnType create(Object result) {
        //调用 create()成功的方法
        return CommonReturnType.create(result, "success");
    }

    public static CommonReturnType create(Object result, String status) {
        CommonReturnType commonReturnType = new CommonReturnType();
        commonReturnType.setStatus(status);
        commonReturnType.setData(result);
        return commonReturnType;
    }
}
