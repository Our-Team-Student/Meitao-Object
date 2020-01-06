<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <title>美淘后台登录界面</title>
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/statics/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/statics/img/apple-touch-icon.png" rel="apple-touch-icon">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/statics/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="${pageContext.request.contextPath}/statics/lib/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/statics/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/style-responsive.css" rel="stylesheet">
</head>
<body>
<div id="login-page">
    <form action="management/PowerManagement.jsp"></form>
    <div class="container">
        <div class="form-login">
            <h2 class="form-login-heading">用户登录</h2>
            <div class="login-wrap">
                <input type="text" class="form-control" placeholder="User ID" autofocus name="userName" id="userName">
                <br>
                <input type="password" class="form-control" placeholder="Password" name="userPwd" id="userPwd">
                <label class="checkbox">
                    <a data-toggle="modal" href="login.html#myModal">忘记密码?</a>
                    </span>
                </label>
                <button class="btn btn-theme btn-block" id="login"><i class="fa fa-lock"></i> 登录
                </button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/statics/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/lib/jquery.backstretch.min.js"></script>
<script>
    $.backstretch("${pageContext.request.contextPath}/statics/img/login-bg.jpg", {
        speed: 500
    });
    $(function () {
        $("#login").on("click", function () {
            var userName = $("#userName").val();
            var userPwd = $("#userPwd").val();
            if (userName == null || userName == "") {
                alert("用户名不能为空！！！");
                return false;
            }
            if (userPwd == null || userPwd == "") {
                alert("密码不能为空！！！");
                return false;
            }

            $.ajax({
                type: "POST",
                /*  contentType: "application/x-www-form-urlencoded",*/
                url: "user/loginUser",
                data: {
                    "userName": userName,
                    "userPwd": userPwd
                }, /*允许跨域请求*/
                /*  xhrFields: {withCredentials: true},*/
                success:
                    function (data) {
                        if (data.status == "success") {
                            alert("登录成功")
                            window.location.href = "user/index";
                            /*发送之后跳转路径*/
                        } else {
                            alert("登录失败,原因为" + data.data.errMsg)
                        }
                        /*服務器返回非正常情况下的*/
                    }
                ,
                error: function (data) {

                    alert("登录失败,原因是" + data.responseText)
                }
            })
        })
    });

</script>
</body>
</html>