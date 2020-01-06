﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>美淘网会员登录</title>
    <link href="${pageContext.request.contextPath}/statics/css/global.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/statics/css/login.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
        function changeBtn() { //改变登录按钮的样式
            var btns = document.getElementsByName("btnLogin");
            for (var i = 0; i < btns.length; i++) {
                btns[i].onmouseover = function () {
                    this.src = "/statics/images/login_over.jpg";
                }
                btns[i].onmouseout = function () {
                    this.src = "/statics/images/login.jpg";
                }
            }
        }

        function changeRegBtn() { //改变注册按钮的样式
            var btns = document.getElementsByName("btnReg");
            for (var i = 0; i < btns.length; i++) {
                btns[i].onmouseover = function () {
                    this.src = "/statics/images/reg_over.jpg";
                }
                btns[i].onmouseout = function () {
                    this.src = "/statics/images/register.jpg";
                }
            }
        }

        function setTab(id) { //注册的选项卡切换
            if (id == 1) {
                document.getElementById("emailreg").style.display = "block";
                document.getElementById("phonereg").style.display = "none";
                document.getElementById("one1").className = "current";
                document.getElementById("one2").className = "";
            }
            if (id == 2) {
                document.getElementById("emailreg").style.display = "none";
                document.getElementById("phonereg").style.display = "block";
                document.getElementById("one2").className = "current";
                document.getElementById("one1").className = "";
            }
        }

        function setLogTab(id) { //登录的选项卡切换
            if (id == 1) {
                document.getElementById("email").style.display = "block";
                document.getElementById("phone").style.display = "none";
                document.getElementById("logone1").className = "current";
                document.getElementById("logone2").className = "";
            }
            if (id == 2) {
                document.getElementById("email").style.display = "none";
                document.getElementById("phone").style.display = "block";
                document.getElementById("logone2").className = "current";
                document.getElementById("logone1").className = "";
            }
        }

        var citys = new Array();
        citys["北京"] = ["海淀", "门头", "房山", "大兴", "顺义"];
        citys["上海"] = ["黄浦", "卢湾", "徐汇", "长宁", "虹口", "宝山"];
        citys["天津"] = ["和平", "东丽", "河东", "河西", "塘沽", "大港", "静海"];
        citys["黑龙江"] = ["哈尔滨", "齐齐哈尔", "牡丹江", "佳木斯", "大庆", "绥化"];
        citys["湖北"] = ["武汉", "宜昌", "荆州", "襄樊", "黄石", "荆门", "十堰", "孝感"];

        function initData() {
            var provinceSel = document.getElementById("selProvince");
            for (var index in citys) {
                var option = document.createElement("option");
                option.text = index;
                option.value = index;
                provinceSel.options.add(option);
            }
            //初始化"北京"的市
            var citySel = document.getElementById("selCity");
            for (var index in citys["北京"]) {
                var option = document.createElement("option");
                option.text = citys["北京"][index];
                option.value = citys["北京"][index];
                citySel.options.add(option);
            }
        }

        function fillCity() {
            var citySel = document.getElementById("selCity");
            citySel.options.length = 0;
            var currentProvince = document.getElementById("selProvince").value;
            for (var index in citys[currentProvince]) {
                var option = document.createElement("option");
                option.text = citys[currentProvince][index];
                option.value = citys[currentProvince][index];
                citySel.options.add(option);
            }
        }

        function $(id) {
            return document.getElementById(id);
        }

        //验证邮箱
        function checkEmail() {
            var emailInfo = $("txtEmail").value;
            $("txtEmail").style.borderColor = "#a5afc3";//失去焦点时，边框恢复原貌
            var spanObj = $("spanEmail");
            if (emailInfo == "") {
                spanObj.innerHTML = "请输入邮箱"
                return false;
            }
            if (emailInfo.indexOf("@") == -1) {
                spanObj.innerHTML = "邮箱必须包含@";
                return false;
            }
            if (emailInfo.indexOf(".") == -1) {
                spanObj.innerHTML = "邮箱必须包含.";
                return false;
            }
            spanObj.innerHTML = "邮箱正确";
            return true;
        }

        //验证用户名
        function checkName() {
            var nameInfo = $("txtName").value;
            $("txtName").style.borderColor = "#a5afc3";
            var spanObj = $("spanName");
            if (nameInfo == "") {
                spanObj.innerHTML = "请输入用户名";
                return false;
            }
            if (nameInfo.length < 4 || nameInfo.length > 16) {
                spanObj.innerHTML = "用户名的长度在4到16之间";
                return false;
            }
            for (var i = 0; i < nameInfo.length; i++) {
                var content = nameInfo.substring(i, i + 1);
                if (!isNaN(content)) {
                    spanObj.innerHTML = "用户名中不能包含数字";
                    return false;
                }
            }
            spanObj.innerHTML = "正确";
            return true;
        }

        //验证密码
        function checkPwd() {
            var pwdInfo = $("txtPwd").value;
            $("txtPwd").style.borderColor = "#a5afc3";
            var spanObj = $("spanPwd");
            var pwdConfirm = $("txtConfirm").value;
            var spanConfirm = $("spanConfirm");
            if (pwdInfo == "") {
                spanObj.innerHTML = "请输入密码";
                return false;
            }
            if (pwdInfo.length < 6 || pwdInfo.length > 32) {
                spanObj.innerHTML = "密码的长度必须在6和32位之间";
                return false;
            }
            spanObj.innerHTML = "密码正确";
            if (pwdInfo != pwdConfirm) {
                spanConfirm.innerHTML = "两次输入的密码不一致";
                return false;
            }
            return true;
        }

        function checkConfirm() {
            var pwdInfo = $("txtPwd").value;
            var pwdConfirm = $("txtConfirm").value;
            var spanConfirm = $("spanConfirm");
            $("txtConfirm").style.borderColor = "#a5afc3";
            if (pwdInfo != pwdConfirm) {
                spanConfirm.innerHTML = "两次输入的密码不一致";
                return false;
            }
            spanConfirm.innerHTML = "输入一致";
            return true;
        }

        function lightTxt(obj) {
            obj.style.borderColor = "red";
        }

        function checkForm() {
            if (checkEmail() && checkName() && checkPwd() && checkConfrim()) {
                return true;
            }
            return false;
        }

        jQuery(function () {
            jQuery("#userEmail").focus(function () {  // 输入邮箱的文本框获得鼠标焦点
                var txt_value = jQuery(this).val();   // 得到当前文本框的值
                if (txt_value == "hj@tom.com") {
                    jQuery(this).val("");              // 如果符合条件，则清空文本框内容
                }
            });
            jQuery("#userEmail").blur(function () {// 文本框失去鼠标焦点
                var txt_value = jQuery(this).val();   // 得到当前文本框的值
                if (txt_value == "") {
                    jQuery(this).val("hj@tom.com");// 如果符合条件，则设置内容
                }
            });


        });
    </script>
</head>

<body onload="changeBtn(),changeRegBtn(),initData()">
<iframe src="../../statics/comment/head.jsp" width="100%" height="104" scrolling="no" frameborder="0"></iframe>
<div id="middle">
    <div id="allnav">
        <div id="nav">
            <ul>
                <!--组织一级菜单-->
                <li class="menuList"><a href="#" class="category">全部商品分类</a>
                    <ul>
                        <li><a href="#">美食</a></li>
                        <li><a href="#">旅游</a></li>
                        <li><a href="#">酒店</a></li>
                        <li><a href="#">电影</a></li>
                        <li><a href="#">KTV</a></li>
                        <li><a href="#">时尚</a></li>
                        <li><a href="#">生活服务</a></li>
                    </ul>
                </li>
                <li><a href="#">首页</a></li>
                <li><a href="#">团购</a></li>
                <li><a href="#">美食</a></li>
                <li><a href="#">电影</a></li>
                <li><a href="#">KTV</a></li>
                <li><a href="#">酒店订票</a></li>
                <li><a href="#">购物</a></li>
                <li><a href="#">品牌特卖</a></li>
            </ul>
        </div>
    </div>
    <!--导航结束-->
    <div id="content">
        <div id="register">
            <form action="register_success.jsp" onsubmit="return checkForm()">
                <fieldset>
                    <legend>注册新用户</legend>
                    <ul>
                        <li class="current" id="one1" onclick="setTab(1)">邮箱注册</li>
                        <li id="one2" onclick="setTab(2)">手机注册</li>
                    </ul>
                    <div class="box">
                        <div id="emailreg">
                            <p>
                                <label>邮箱：</label>
                                <input name="" type="text" class="txt" id="txtEmail" onblur="checkEmail()"
                                       onfocus="lightTxt(this)"/>
                                <span id="spanEmail">推荐使用qq邮箱</span></p>
                            <p>
                                <label for="userName" accesskey="n">用户名：</label>
                                <input name="" type="text" class="txt" id="txtName" onblur="checkName()"
                                       onfocus="lightTxt(this)"/>
                                <span id="spanName">4-16字符，不能包含数字</span></p>
                            <p>
                                <label>创建密码：</label>
                                <input name="" type="password" class="txt" id="txtPwd" onblur="checkPwd()"
                                       onfocus="lightTxt(this)"/>
                                <span id="spanPwd">6-32位字符</span></p>
                            <p>
                                <label>确认密码：</label>
                                <input name="" type="password" class="txt" id="txtConfirm" onblur="checkConfirm()"
                                       onfocus="lightTxt(this)"/>
                                <span id="spanConfirm">请再次输入密码</span></p>
                            <p>
                                <label>所在城市：</label>
                                <select class="txt" id="selProvince" onchange="fillCity()">
                                </select>
                                <select class="txt" id="selCity">
                                </select>
                            </p>
                            <p>
                                <label>验证码：</label>
                                <input name="" type="text" class="txt check"/>
                                <img src="${pageContext.request.contextPath}/statics/images/code_img.gif"
                                     style="vertical-align:bottom"/></p>
                            <p>
                                <input type="image" class="btn"
                                       src="${pageContext.request.contextPath}/statics/images/register.jpg"
                                       name="btnReg"/>
                                <a href="#">《美淘网用户协议》</a></p>
                        </div>
                        <!--通过email注册-->
                        <div id="phonereg" style="display:none">
                            <p>
                                <label>电话：</label>
                                <input name="" type="text" class="txt"/>
                                <span>用于登录，找回密码，不会公开</span></p>
                            <p>
                                <label>短信验证码：</label>
                                <input name="" type="text" class="txt"/>
                                <span>请输入手机收到的验证码</span></p>
                            <p>
                                <label>创建密码：</label>
                                <input name="" type="password" class="txt"/>
                                <span>6-32字符</span></p>
                            <p>
                                <label>确认密码：</label>
                                <input name="" type="password" class="txt"/>
                                <span>请再次输入密码</span></p>
                            <p>
                                <input type="image" class="btn"
                                       src="${pageContext.request.contextPath}/statics/images/register.jpg"
                                       name="btnReg"/>
                                <a href="#">《美淘网用户协议》</a></p>
                        </div>
                        <!--通过电话注册-->
                    </div>
                </fieldset>
            </form>
        </div>
        <div id="login">
            <form>
                <fieldset>
                    <legend>登录MEITAO.COM</legend>
                    <ul>
                        <li id="logone1" onclick=" setLogTab(1)" class="current">邮箱用户</li>
                        <li id="logone2" onclick=" setLogTab(2)">手机用户</li>
                    </ul>
                    <div class="box">
                        <div id="email">
                            <p>
                                <label>邮箱：</label>
                                <input name="" type="text" class="txt" value="hj@tom.com" id="userEmail"/>
                            </p>
                            <p>
                                <label>密码：</label>
                                <input name="" type="text" class="txt"/>
                            </p>
                            <p>
                                <input type="image" src="${pageContext.request.contextPath}/statics/images/login.jpg"
                                       class="btn" name="btnLogin"/>
                                <a href="#">忘记密码了？</a></p>
                        </div>
                        <div id="phone">
                            <p>
                                <label>手机号：</label>
                                <input name="" type="text" class="txt"/>
                            </p>
                            <p>
                                <label>密 码：</label>
                                <input name="" type="text" class="txt"/>
                            </p>
                            <p>
                                <input type="image" src="${pageContext.request.contextPath}/statics/images/login.jpg"
                                       class="btn" name="btnLogin"/>
                                <a href="#">忘记密码了？</a></p>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <!--中间内容块结束-->
</div>
<iframe src="../../statics/comment/foot.jsp" width="100%" scrolling="no" frameborder="0" height="185"></iframe>
</body>
</html>
