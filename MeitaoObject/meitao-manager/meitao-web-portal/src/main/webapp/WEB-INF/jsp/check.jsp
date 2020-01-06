<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车--结算</title>
<link href="css/global.css" rel="stylesheet"  type="text/css"/>
<link href="css/nav.css" rel="stylesheet"  type="text/css"/>
<link href="css/check.css" rel="stylesheet"  type="text/css"/>
</head>

<body>
<iframe src="head.html" width="100%" height="104" scrolling="no" frameborder="0"></iframe>
<div id="middle">
  <div id="allnav">
    <div id="nav">
      <ul>
        <li class="menuList"><a href="#" class="category">全部商品分类</a>
          <ul>
            <!--二级菜单-->
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
    <div id="left">
      <form method="post" action="check.html">
        <p class="step"></p>
        <h3>项目名称及数量：</h3>
        <ul class="items">
          <li>欢乐空间量贩式KTV：欢唱套餐2选1，国家法定节假日需到店另付20元，共一份</li>
          <li>途乐时尚主题量贩式KTV：任选1小时欢唱，可升级，提供免费WiFi，共一份 </li>
        </ul>
        <hr />
        <h3>接收美淘券密码的手机号：</h3>
        <p class="phone"> <span>130****4939，</span>凭美淘券密码去商家消费。</p>
        <hr />
        <h3>应付总额<span>¥43.9</span></h3>
        <ul class="cash">
          <li><span></span>网上银行支付（支持储蓄卡和信用卡）<br />
            <input type="radio" name="bank" checked="checked" />
            <img src="images/cart/jhbank.jpg"  align="middle"/>
            <input type="radio" name="bank" />
            <img src="images/cart/jtbank.jpg" align="middle" />
            <input type="radio" name="bank"  />
            <img src="images/cart/zgbank.jpg" align="middle" /><br />
            <input type="radio" name="bank"  />
            <img src="images/cart/xybank.jpg" align="middle" />
            <input type="radio" name="bank"  />
            <img src="images/cart/zsbank.jpg" align="middle" />
            <input type="radio" name="bank"  />
            <img src="images/cart/gdbank.jpg" align="middle" /> </li>
          <li><span></span>支付宝/财付通支付<br />
            <input type="radio"  name="other"/>
            <img src="images/cart/zfb.jpg"  align="middle"/>
            <input type="radio" name="other" />
            <img src="images/cart/cft.jpg" align="middle" /> </li>
        </ul>
        <p class="sale">支付：&yen;43.9</p>
        <p class="sale">
          <input type="image" src="images/cart/fk.jpg"/>
        </p>
      </form>
    </div>
    <!--左边结束-->
    <div id="right">
      <h2>请放心购买</h2>
      <dl class="easy">
        <dt><img src="images/cart/warn.jpg" /></dt>
        <dd>采用网银和第三方平台支付，最大限度保证您支付安全。</dd>
      </dl>
      <dl class="easy">
        <dt><img src="images/cart/ie.jpg" /></dt>
        <dd>为了支付便捷，建议windows用户使用IE浏览器支付。</dd>
      </dl>
      <h2 >支付帮助？</h2>
      <dl class="help">
        <dt>没有开通网上银行如何购买？</dt>
        <dd>各银行已有支持无需网银的小额支付产品，可直接选择付款。或者，可选择银联在线支付或快捷支付（只支持信用卡）付款。 </dd>
      </dl>
      <dl class="help">
        <dt>没找到我常用的网上银行？</dt>
        <dd>建议选择银联在线支付付款，支持超过180家银行，包括主流银行和地方银行，例如华夏银行，汉口银行，南京银行等。</dd>
      </dl>
     <dl class="help">
        <dt>什么是地方银行？</dt>
        <dd>地方银行主要指注册和经营在当地的城市商业银行、农村合作银行、村镇银行等中小金融机构，例如江苏银行，南京银行，华夏银行等。 </dd>
      </dl>
      <dl class="help">
        <dt>无法跳转到对应的支付页面支付？</dt>
        <dd>建议刷新当前页面，如果没恢复正常建议重启或更换到IE浏览器。</dd>
      </dl>
    
    </div>
    <!--中间内容的右边结束--> 
  </div>
  <!--中间内容结束--> 
</div>
<!--中间结束-->
<iframe src="foot.html" width="100%"  scrolling="no" frameborder="0" height="185"></iframe>
</body>
</html>
