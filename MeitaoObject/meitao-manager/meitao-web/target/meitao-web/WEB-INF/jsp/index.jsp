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
    <%@ include file="../jsp/commone/header.jsp" %>
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
    <%@ include file="../jsp/commone/left.jsp" %>
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
                        <h3 class="form-title">商品列表浏览</h3>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>商品名</th>
                                    <th>商品图片</th>
                                    <th>商品描述</th>
                                    <th>商品价格</th>
                                    <th>商品库存</th>
                                    <th>商品销量</th>
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
    <%@ include file="../jsp/commone/footer.jsp" %>

</section>
<%@ include file="../jsp/commone/js.jsp"%>
</body>

</html>
