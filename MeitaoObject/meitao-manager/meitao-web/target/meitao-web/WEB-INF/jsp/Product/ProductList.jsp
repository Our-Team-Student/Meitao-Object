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
    <link href="${pageContext.request.contextPath}/statics/lib/bootstrap-table/bootstrap-table.css" rel="stylesheet">
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
                    <table id="productList"></table>
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
<script src="${pageContext.request.contextPath}/statics/lib/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/lib/bootstrap-table/bootstrap-table.js"></script>
<script>
    $(function () {

        //销毁之前的列表信息
        $("#productList").bootstrapTable("destroy");
        $("#productList").bootstrapTable({
            contentType: "application/x-www-form-urlencoded",
            xhrFields: {withCredentials: true},
            url: 'http://localhost:8080/product/productList',
            method: 'POST',                      //请求方式（*）
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
            pageSize: 5,                     //每页的记录行数（*）
            pageList: [5, 10, 25, 50],        //可供选择的每页的行数（*）
            showRefresh: true,                  //是否显示刷新按钮
            showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表
            queryParams: function (params) {
                //这里的键的名字和控制器的变量名必须一致，这边改动，控制器也需要改成一样的
                var temp = {
                    rows: params.limit,                         //页面大小
                    offset: params.offset,   //页码
                    sort: params.sort,      //排序列名
                    sortOrder: params.order //排位命令（desc，asc）
                };
                return temp;
            },

            columns: [{
                checkbox: true,
                visible: true,//是否复选框
            }, {
                field: 'productid',
                title: '产品编号',
                width: '10%'
            },
                {
                    field: 'title',
                    title: '产品标题',
                    width: '10%'
                },
                {
                    field: 'productdesc',
                    title: '描述',
                    width: '10%'
                },
                {
                    field: 'originaprice',
                    title: '原价',
                    width: '10%'
                },
                {
                    field: 'currentprice',
                    title: '现价',
                    width: '10%'
                },
                {
                    field: 'areaid',
                    title: '区域id',
                    width: '10%'
                }, {
                    field: 'shopid',
                    title: '酒店id',
                    width: '10%'
                }, {
                    field: 'picture',
                    title: '图片',
                    width: '20%'
                }
            ],
            onLoadSuccess: function () {
            },
            onLoadError: function () {
                showTips("数据加载失败！");
            },
            onDblClickRow: function (row, $element) {
                var id = row.ID;
                EditViewById(id, 'view');
            }
        });

    })
</script>
</body>

</html>
