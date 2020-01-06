package com.jbit.meitao.controller.development;

import com.alibaba.druid.util.StringUtils;
import com.jbit.meitao.controller.BaseController;
import com.jbit.meitao.error.BusinessException;
import com.jbit.meitao.error.EmBusinessError;
import com.jbit.meitao.response.CommonReturnType;
import com.jbit.meitao.service.backexploit.CustomerService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping(value = "/customer")
//跨域请求注解
@CrossOrigin(origins = {"*"}, allowCredentials = "true")
public class CustomerController extends BaseController {
    @Resource
    private CustomerService customerService;
    @Resource
    private HttpServletRequest httpServletRequest;

    @RequestMapping(value = "/loginCust", method = RequestMethod.POST, consumes = {CONTENT_TYPE_FORMED})
    @ResponseBody
    public CommonReturnType loginUser(@RequestParam(value = "loginName", required = false) String loginName,
                                      @RequestParam(value = "loginPwd", required = false) String loginPwd) throws BusinessException {
        //入参校验
        if (StringUtils.isEmpty(loginName) || StringUtils.isEmpty(loginPwd)) {
            throw new BusinessException(EmBusinessError.PARAMETER_VALIDATION_ERROR, "用户名或者密码不正确！");
        }
        System.out.println(loginName + loginPwd + "登录方法");

        return CommonReturnType.create(null);
    }
}
