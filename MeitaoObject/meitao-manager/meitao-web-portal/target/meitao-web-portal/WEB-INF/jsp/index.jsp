﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>美淘网首页</title>
    <link href="${pageContext.request.contextPath}/statics/css/global.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
        function movePrice() {
            var marginTop = 0;
            var stopScroll = false; //控制停止/继续滚动
            setInterval(function () {
                if (stopScroll) return;
                $("div#price ul li:first").animate({"margin-top": marginTop--}, 0, function () {
                    var $first = $(this);
                    if (!$first.is(":animated")) {//动画执行完毕
                        if ((-marginTop) > $first.height()) {
                            $first.css({"margin-top": 0}).appendTo($("div#price ul"));
                            marginTop = 0;
                        }
                    }
                });
            }, 50);
            $("div#price ul ").mouseover(function () {
                stopScroll = true; //当鼠标移动到列表项时，停止滚动
            }).mouseout(function () {
                stopScroll = false;
            });
        }

        $(function () {
//抽奖项目循环垂直向上滚动
            movePrice();
            //下拉级联菜单即三级菜单的滑入滑出
            $('div#nav li.menuList>ul>li').hover(function () { // 鼠标移入到第二级菜单，对应的三级菜单滑入
                var subMenuWidth = $(this).width();  //二级菜单的宽度，即是三级菜单水平偏移的距离
                $(this).children('ul').css({"width": "100px", "top": "0px", "left": subMenuWidth})
                    .stop()
                    .slideDown('fast'); //设置三级菜单的css属性和滑入效果
            }, function () { //鼠标移出二级菜单项，对应的三级级菜单滑出
                $(this).children('ul').stop().slideUp('fast');
            });
        });
    </script>
    <script>
        $(function () {
            $.ajax({
                url: "http://localhost:8090/portal/portalList",
                type: "post",
                success:
                    function (data) {
                        $.each(data, function (index, value) {
                            var dom = "<dl>" +
                                "<dt><a href='#'><img src='${pageContext.request.contextPath}/statics/images/" + value.picture + "'/></a></dt><dd class='name'>" + value.title + "</dd> " +
                                "<dd>" + value.productdesc + "</dd>" +
                                "<dd><span class='discount'>" + value.currentprice + "</span> 门店价<span class='price'>" + value.originaprice + "</span></dd>" +
                                "</dl>"
                            $("#goods").append($(dom));
                        })
                    }
                ,
                error: function (data) {
                    alert("数据加载失败,原因是" + data.responseText)
                }
            })
        });
    </script>
    <style type="text/css">
        #nav, #mtop, #mbottom {
            width: 985px; /*内容固定宽度*/
            margin: 0px auto; /*固定宽度且居中*/
        }

        #middle #allnav {
            width: 100%; /*自适应宽度，占据整个屏幕*/
            height: 39px;
            background-color: #ff7701;
        }

        /*中间导航*/
        #middle #nav {
            height: 39px;
        }

        #nav ul li {
            float: left;
        }

        #nav ul li a {
            float: left; /*兼容ie6*/
            padding: 0px 16px;
            height: 39px;
            line-height: 39px;
            display: block;
            font-weight: bold;
            font-size: 15px;
            color: white;
        }

        #nav ul li a:hover {
            background-color: #ff8c00
        }

        #nav ul li a.category {
            background-image: url(images/arrow-down.gif);
            background-repeat: no-repeat;
            background-position: right;
        }

        /*中间的上面*/
        #mtop {
            overflow: hidden; /*解决浮动塌陷*/
            margin-bottom: 4px; /*下外边距 和中下保持4px的间隔*/
        }

        /*导航菜单的二级菜单用到定位*/
        #nav ul li.menuList {
            position: relative;
        }

        #nav ul li.menuList ul {
            background-color: #ff7701;
            text-align: center;
            top: 39px; /*脱离原文档流*/
            left: 0px;
            position: absolute;
            width: 123px;
        }

        /*二级菜单*/
        #nav ul li ul li {
            float: none;
            position: relative; /*定位三级菜单new*/
        }

        #nav ul li ul li a {
            float: none
        }

        /*三级菜单(new)*/
        #nav ul li.menuList ul li ul {
            display: none;
            position: absolute; /*脱离文档流*/

        }

        /*三级菜单(new)*/
        #nav ul li.menuList ul li ul li a {
            line-height: 20px;
            height: 20px;
            font-size: 12px;
            text-align: left;
        }

        /*占位符*/
        #mtop #navlist {
            float: left;
            width: 121px;
            height: 271px;
            border: 1px solid #963;
            margin-right: 5px; /*右外边距*/
        }

        #mtop #content {
            float: left;
            width: 850px;
            height: 273px;
        }

        /*分类搜索*/
        #mtop #content #typesearch {
            height: 54px; /* border:1px solid #03F;*/
        }

        #mtop #content #typesearch ul {
            clear: both;
        }

        #mtop #content #typesearch ul li {
            float: left;
            margin: 0px 12px; /*水平方向利用外边距调开项的间隔*/
            height: 27px; /*垂直方向利用行高调开项的间隔*/
            line-height: 27px;
        }

        #mtop #content #typesearch ul li.title {
            font-weight: bold;
            font-size: 13px;
        }

        #mtop #content #typesearch ul li.title span {
            width: 16px;
            height: 17px;
            display: block;
            background-image: url(images/icon.gif);
            float: left;
            margin-top: 5px; /*背景和文字对齐*/
        }

        #mtop #content #typesearch ul li.title span.business {
            background-position: 0px -21px;
        }

        /*本周精选*/
        #mtop #content #week {
            height: 214px; /* border:1px solid #F00;*/
        }

        #mtop #content #week p {
            font-weight: bold;
            font-size: 13px;
            height: 32px;
            line-height: 32px;
            margin: 0px 12px; /*和分类搜索的标题在垂直方向对齐*/
        }

        #week p span {
            width: 16px;
            height: 17px;
            display: block;
            background-image: url(images/icon.gif);
            float: left;
            background-position: 0px -64px;
            margin-top: 5px; /*背景和文字对齐*/
        }

        #week p span.weekicon {
            background-position: 0px -45px;
        }

        /*本周精选的图片*/
        #week ul li {
            float: left;
        }

        /*团购精选*/
        #mbottom #goods {
            width: 735px;
            float: left; /*height:500px;*//* border:1px solid #C0C;*/
        }

        #mbottom #goods p {
            font-weight: bold;
            font-size: 13px;
            height: 32px;
            line-height: 32px;
        }

        #mbottom #goods p span {
            width: 16px;
            height: 17px;
            display: block;
            background-image: url(images/icon.gif);
            float: left;
            background-position: 0px -64px;
            margin-top: 5px; /*背景和文字对齐*/
        }

        #mbottom #goods dl {
            float: left;
            width: 350px;
            height: 320px;
            border: 1px solid #CCC;
            margin-right: 6px;
            margin-bottom: 8px;
        }

        #mbottom #goods dl dd {
            line-height: 25px;
            padding-left: 17px; /*文字离边框17*/
        }

        #mbottom #goods dl dd.name {
            font-weight: bold;
            font-size: 13px
        }

        /*价格*/
        #goods dl dd span.discount {
            color: orange;
            font: bold 16px Verdana, Geneva, sans-serif;
        }

        #goods dl dd span.price {
            text-decoration: line-through;
        }

        /*带透明效果的文字特效*/
        #goods dl dt.dtTxt {
            position: relative;
        }

        #goods dl dt.dtTxt p {
            height: 30px;
            width: 350px;
            background-color: black;
            font: bold 14px Verdana, Geneva, sans-serif;
            color: white;
            position: absolute;
            top: 182px;
            left: 0px;
            text-align: center;
            filter: alpha(opacity=50); /*ie能识别的滤镜效果*/
            opacity: 0.5; /*火狐能识别的滤镜效果*/
            border-left: 1px solid #CCC;
            border-right: 1px solid #CCC;
            display: none;
        }

        #goods dl dt.dtTxt:hover p {
            display: block;
        }

        /*侧边栏*/
        #mbottom #side {
            width: 240px;
            float: right;
            /*height: 500px;*/
            /*border: 1px solid #6F9;*/
            margin-top: 33px; /*和团购精选的图片垂直对齐，而不是和团购精选的标题*/
        }

        /*侧边栏每个专题的标题*/
        #side h2 {
            height: 40px;
            line-height: 40px;
        }

        /*热门专题*/
        #side #hottopic h2 {
            padding-left: 17px;
        }

        #side #hottopic {
            border: 1px solid #CCC;
            margin-bottom: 14px;
        }

        /*热卖排行榜*/
        #side #hotbuy {
            padding-left: 17px;
            border: 1px solid #CCC;
            padding-right: 17px;
            margin-bottom: 14px; /*和下个专题的垂直间隔*/
        }

        #side #hotbuy dl {
            border-bottom: 1px dashed #ccc;
            margin-bottom: 11px; /*每个商品垂直的间距*/
        }

        #side #hotbuy dl.last {
            border: none; /*最后一个热门商品没有下边框*/
        }

        #hotbuy dd {
            line-height: 24px; /*文字垂直间隔*/
        }

        #hotbuy dd span {
            font: bold 20px Verdana, Geneva, sans-serif;
            color: orange;
        }

        /*0元抽奖*/
        #side #price {

            background-image: url(images/pricebg.JPG);
            height: 86px; /*156-70*/
            padding-top: 70px;
            padding-left: 70px;
            margin-bottom: 14px;
        }

        #side #price a {
            color: red;
        }

        #side #price a:hover {
            text-decoration: underline;
        }

        #price ul {
            height: 66px;
            overflow: hidden;

        }

        #price ul li {
            line-height: 22px;
            height: 22px;
        }

        /*最近浏览*/
        #side #lastview {
            border: 1px solid #CCC;
            padding-left: 17px;
            padding-right: 17px;
        }

        #side #lastview h2 {
            float: left;

        }

        /*清空*/
        #side #lastview p {
            float: right;
            height: 40px;
            line-height: 40px; /*和标题垂直对齐*/
        }

        #lastview dl {
            clear: both;
            border-bottom: 1px dashed #ccc;
            width: 200px;
            height: 70px;
            margin-bottom: 11px; /*每个浏览过的商品垂直间隔*/
        }

        #lastview dl dt {
            float: left;
            margin-right: 10px; /*图片和文字水平间隔*/
        }

        #lastview dl dd {
            height: 25px;
            line-height: 25px;
        }

        #lastview dl dd span.discount {
            color: orange;
            font: bold 14px Verdana, Geneva, sans-serif;
        }

        #lastview dl dd span.previous {
            text-decoration: line-through;
        }

        #lastview dl.noborder {
            border: none;
        }

        /*不随滚动条移动的美淘广告*/
        div#adv {
            position: fixed;
            top: 300px;
            right: 0px;
        }
    </style>
</head>

<body>
<iframe src="../../statics/comment/head.jsp" width="100%" height="106" scrolling="no" frameborder="0"></iframe>
<div id="middle">
    <div id="allnav">
        <div id="nav">
            <ul>
                <li class="menuList"><a href="#" class="category">全部商品分类</a>
                    <ul>
                        <!--二级菜单-->
                        <li><a href="#">美食</a>
                            <!--三级菜单-->
                            <ul>
                                <li><a href="#">火锅</a></li>
                                <li><a href="#">自助餐</a></li>
                                <li><a href="#">西餐</a></li>
                            </ul>
                        </li>
                        <li><a href="#">旅游</a></li>
                        <li><a href="#">酒店</a>
                            <!--三级菜单-->
                            <ul>
                                <li><a href="hottopic.html#best">豪华酒店</a></li>
                                <li><a href="hottopic.html#flat">公寓酒店</a></li>
                                <li><a href="hottopic.html#holiday">度假首选</a></li>
                                <li><a href="hottopic.html#love">经济有爱</a></li>
                                <li><a href="hottopic.html#inn">客栈情怀</a></li>
                            </ul>
                        </li>
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
    <div id="mtop">
        <div id="navlist">#navlist 导航菜单的下拉列表</div>
        <div id="content">
            <div id="typesearch">
                <ul>
                    <li class="title"><span class="hot"></span>热门团购</li>
                    <li><a href="#">代金劵</a></li>
                    <li><a href="#">火锅</a></li>
                    <li><a href="#">自助餐</a></li>
                    <li><a href="#">KTV</a></li>
                    <li><a href="#">电影</a></li>
                    <li><a href="#">美发</a></li>
                    <li><a href="#">川湘菜</a></li>
                    <li><a href="#">足疗按摩</a></li>
                    <li><a href="#">服装</a></li>
                    <li><a href="#">烧烤烤肉</a></li>
                </ul>
                <ul>
                    <li class="title"><span class="business"></span>热门商圈</li>
                    <li><a href="#">武昌区</a></li>
                    <li><a href="#">江汉区</a></li>
                    <li><a href="#">汉阳区</a></li>
                    <li><a href="#">江岸区</a></li>
                    <li><a href="#">硚口区</a></li>
                    <li><a href="#">青山区</a></li>
                    <li><a href="#">光谷高新</a></li>
                    <li><a href="#">东西湖区</a></li>
                </ul>
            </div>
            <div id="week">
                <P><span class="weekicon"></span>本周精选</P>
                <ul>
                    <li><a href="#"><img src="${pageContext.request.contextPath}/statics/images/week1.jpg"/></a></li>
                    <li><a href="#"><img src="${pageContext.request.contextPath}/statics/images/week2.jpg"/></a></li>
                    <li><a href="#"><img src="${pageContext.request.contextPath}/statics/images/week3.jpg"/></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="mbottom">
        <div id="goods">
            <P><span class="goodicon"></span>团购精选</P>
        </div>
        <div id="side">
            <div id="hottopic">
                <h2>热门主题</h2>
                <a href="#"><img src="${pageContext.request.contextPath}/statics/images/hottopic1.jpg"/></a> <a
                    href="#"><img src="images/hottopic2.jpg"/></a> <a
                    href="#"><img src="${pageContext.request.contextPath}/statics/images/hottopic3.jpg"/></a>
                </dl>
            </div>
            <!--热门主题-->
            <div id="hotbuy">
                <h2>热卖排行榜</h2>
                <dl>
                    <dt><a href="#"><img src="${pageContext.request.contextPath}/statics/images/hotbuy1.jpg"/></a></dt>
                    <dd>【武汉广场】武商摩尔国际电影城单人票</dd>
                    <dd><span>¥25</span>每天1416人团购</dd>
                </dl>
                <dl>
                    <dt><a href="#"><img src="${pageContext.request.contextPath}/statics/images/hotbuy2.jpg"/></a></dt>
                    <dd>【3店通用】万达国际影城电影票</dd>
                    <dd><span>¥25</span>每天1166人团购</dd>
                </dl>
                <dl class="last">
                    <dt><a href="#"><img src="${pageContext.request.contextPath}/statics/images/hotbuy3.jpg"/></a></dt>
                    <dd>【武汉等】金汉斯烤肉自助餐</dd>
                    <dd><span>¥46.75</span>每天468人团购</dd>
                </dl>
            </div>
            <!--热门排行榜-->
            <div id="price">

                <ul>
                    <li>金汉斯&nbsp; <a href="#">进行中</a></li>
                    <li>兰蔻升级版小黑瓶 &nbsp; <a href="#">进行中</a></li>
                    <li>苹果 iPhone 5s &nbsp;<a href="#">进行中</a></li>
                    <li>HTC One max &nbsp;<a href="#">进行中</a></li>
                    <li>三星最新平板电 &nbsp;<a href="#">进行中</a></li>
                    <li>苹果 iPad Air &nbsp;<a href="#">进行中</a></li>
                </ul>
            </div><!--抽奖-->

            <div id="lastview">
                <h2>最近浏览</h2>
                <P><a href="#">清空</a></P>
                <dl>
                    <dt><a href="#"><img src="${pageContext.request.contextPath}/statics/images/lastview1.jpg"/></a>
                    </dt>
                    <dd>三星最新平板电脑</dd>
                    <dd><span class="discount">&yen;0</span><span class="previous">0</span></dd>
                </dl>
                <dl>
                    <dt><a href="#"><img src="${pageContext.request.contextPath}/statics/images/lastview2.jpg"/></a>
                    </dt>
                    <dd>中商广场提供现金卡</dd>
                    <dd><span class="discount">&yen;50</span><span class="previous">100</span></dd>
                </dl>
                <dl class="noborder">
                    <dt><a href="#"><img src="${pageContext.request.contextPath}/statics/images/lastview3.jpg"/></a>
                    </dt>
                    <dd>金汉斯烤肉自助餐</dd>
                    <dd><span class="discount">&yen;46</span><span class="previous">58</span></dd>
                </dl>

            </div>
        </div>
    </div>
</div>
<iframe src="../../statics/comment/foot.jsp" width="100%" scrolling="no" frameborder="0" height="185"></iframe>
<div id="adv"><img src="${pageContext.request.contextPath}/statics/images/ban.jpg" width="100"/></div>

</body>
</html>
