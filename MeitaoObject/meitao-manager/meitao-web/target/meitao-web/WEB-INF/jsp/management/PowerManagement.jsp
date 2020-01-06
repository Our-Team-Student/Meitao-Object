<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <title>Dashio - Bootstrap Admin Template</title>
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/statics/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/statics/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/statics/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="${pageContext.request.contextPath}/statics/lib/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/statics/lib/gritter/css/jquery.gritter.css"/>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/statics/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/style-responsive.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/lib/chart-master/Chart.js"></script>
</head>
<body>
<section id="container">
    <%@ include file="../../jsp/commone/header.jsp" %>
    <%--<header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <a href="index.html" class="logo"><b>后台管理</b></a>
        <!--logo end-->
        <div class="nav notify-row" id="top_menu">

        </div>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="login.html">注销</a></li>
            </ul>
        </div>
        <div style="text-align: center ;vertical-align: middle;">
            <h1>欢迎光临${sessionScope.LOGIN_USER.loginName}</h1>
        </div>
    </header>--%>
    <%@ include file="../../jsp/commone/left.jsp" %>
    <%--    <aside>
            <div id="sidebar" class="nav-collapse ">
                <!-- sidebar menu start-->
                <ul class="sidebar-menu" id="nav-accordion">
                    <p class="centered"><a href="profile.html"><img
                            src="${pageContext.request.contextPath}/statics/img/ui-sam.jpg" class="img-circle"
                            width="80"></a>
                    </p>
                    <h5 class="centered">${sessionScope.LOGIN_USER.userName}</h5>
                </ul>
                <!-- sidebar menu end-->
            </div>

        </aside>--%>
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-9 main-chart">

                    <div class="content">
                        <h3 class="form-title">权限管理</h3>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>用户名称</th>
                                    <th>登录名</th>
                                    <th>角色信息</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="containers">
                                <!--列表页-->

                                </tbody>
                            </table>

                        </div>
                    </div>

                </div>
            </div>
            <!-- /row -->
        </section>
    </section>
    <%@ include file="../../jsp/commone/footer.jsp" %>
    <%--<footer class="site-footer">
        <div class="text-center">
            <p>
                &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
            </p>
            <div class="credits">
                Created with Dashio template by <a href="https://templatemag.com/">TemplateMag</a>
            </div>
            <a href="index.html#" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>--%>
</section>
<%@ include file="../../jsp/commone/js.jsp" %>
<script>
    //定义一个数组
    var g_userList = [];
    $(function () {

        $.ajax({
            type: "POST",
            contentType: "application/x-www-form-urlencoded",
            url: "http://localhost:8080/product/ulist", /*允许跨域请求*/
            xhrFields: {withCredentials: true},
            success:
                function (data) {
                    if (data.status == "success") {
                        //定义一个数组
                        g_userList = data.data;
                        //执行值的传递
                        //reloadDom();
                        //执行$.each方法
                        reloadDomPower();
                    } else {
                        alert("查询失败,原因为" + data.data.errMsg)
                    }
                    /*服務器返回非正常情况下的*/
                }
            ,
            error: function (data) {
                alert("查询失败,原因是" + data.responseText)
            }
        });
        $("#containers").on("click", ".btn", function () {
            var userId = $(this).attr("userId");
            var roleId = $(this).parent().prev().find("option:selected").val();
            $.ajax({
                type: "POST",
                contentType: "application/x-www-form-urlencoded",
                url: "http://localhost:8080/product/updateUser", /*允许跨域请求*/
                xhrFields: {withCredentials: true},
                data: {
                    "userId": userId,
                    "roleId": roleId
                },
                success:
                    function (data) {
                        if (data.status == "success") {
                            window.location.reload();
                        } else {
                            alert("修改失败,原因为" + data.data.errMsg)
                        }
                        /*服務器返回非正常情况下的*/
                    }
                ,
                error: function (data) {
                    alert("修改失败,原因是" + data.responseText)
                }
            });

        })
    })

    ;

    //$.each 循环遍历方法
    function reloadDomPower() {
        $.each(g_userList.userVO, function (uId, user) {
            var userDO =
                "<tr><form class='userId' method='post'><input type='hidden' name='userId'><td>" + ++uId +
                "</td><td>" + user.userName +
                "</td><td>" + user.loginName +
                "</td><td ><select class='form-control' name='roleId'><option  selected='selected' value='" + user.roleVO.roleId + "'>"
                + user.roleVO.roleName +
                "</option>";
            $.each(g_userList.roleVO, function (rId, role) {
                userDO += "<option value='" + role.roleId + "'>" + role.roleName + "</option>"
            })
            userDO += "</select></td><td>" +
                "<input type='button' userId='" + user.userId + "' class='btn blue'  value='修改'/>" +
                "</td></form></tr>";
            $("#containers").append($(userDO));


        })
    }
</script>
</body>

</html>
