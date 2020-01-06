package com.jbit.meitao.vaildator;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.util.Set;


@Component/*注册到jbean中*/
public class VaildatorImpl implements InitializingBean {
    //当我们的spring初始化完成 之后会回调到定义VaildatorImpl afterPropertiesSet 的方式
    private Validator validator;

    //实现检验方法并且返回检验结果
    public VaildatorResult vaildate(Object bean) {
        VaildatorResult vaildatorResult = new VaildatorResult();
        Set<ConstraintViolation<Object>> constraintViolationSet = validator.validate(bean);
        if (constraintViolationSet.size() > 0) {
            //有错误
            vaildatorResult.setHasErrors(true);
            constraintViolationSet.forEach(constraintViolation -> {
                String errMsg = constraintViolation.getMessage();
                String propertyName = constraintViolation.getPropertyPath().toString();
                vaildatorResult.getErrorMsgMap().put(propertyName, errMsg);
            });
        }
        return vaildatorResult;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        //将hibernate validator通过  工厂的初始化方式使其初始化 实例化
        this.validator = Validation.buildDefaultValidatorFactory().getValidator();
    }
}
