﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>美淘网商品详情</title>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/detail.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" >
        $(function () {
            $("div#nav li.menuList").hover(function () {
                $("div#nav li.menuList ul:first").stop().slideDown(500);
            }, function () {
                $("div#nav li.menuList ul:first").stop().slideUp(500);
            });
            //下拉级联菜单即三级菜单的滑入滑出
            $('div#nav li.menuList>ul>li').hover(function () { // 鼠标移入到第二级菜单，对应的三级菜单滑入
                var subMenuWidth = $(this).width();  //二级菜单的宽度，即是三级菜单水平偏移的距离
                $(this).children('ul').css({ "width": "100px", "top": "0px", "left": subMenuWidth })
                                       .stop()
                                      .slideDown('fast'); //设置三级菜单的css属性和滑入效果
            }, function () { //鼠标移出二级菜单项，对应的三级级菜单滑出  
                $(this).children('ul').stop().slideUp('fast');
            });
        });
    </script>
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
<div id="content">
  <div id="detail">
    <div id="intro1">
      <h2>武汉团购»美食团购»自助餐»大渔铁板烧</h2>
      <ul class="picture">
        <li><img src="images/good2.jpg" /></li>
        <li class="ps"><img src="images/view1.jpg" /></li>
        <li class="ps"><img src="images/view2.jpg" /></li>
        <li class="ps"><img src="images/view3.jpg" /></li>
        <li class="ps"><img src="images/view4.jpg" /></li>
      </ul>
      <ul class="info">
        <li>团购价：<span>&yen;149</span></li>
        <li>门店价：&yen;224</li>
        <li>剩余时间：14小时40分11秒</li>
        <li>已经售出：<span>3895</span></li>
        <li>消费评分：4.4</li>
        <li>已有357人评价</li>
        <li class="txt">仅售149元！价值224元的大渔铁板烧单人可口自助套餐<br />
          与精美菜品的一场冰火约会，好好慰劳自己吧。</li>
        <li class="buy"><a href="#"><img src="images/intocart.gif" /></a></li>
      </ul>
    </div>
    <!--详细的第一栏目结束-->
    <div id="intro2">
      <div class="menubox">
        <ul>
          <li><a href="#tab1">商家位置</a></li>
          <li><a href="#tab2">团购详情</a></li>
          <li><a href="#tab3">美淘推荐</a></li>
          <li><a href="#tab4">消费评价</a></li>
        </ul>
      </div>
      <div class="tab">
        <div id="tab1">
          <h2>商家位置</h2>
          <dl>
            <dt><img src="images/map.jpg" height="150" /></dt>
            <dd><span>大渔铁板烧（汉街万达店）</span><br />
              地址：武昌区汉街一号万达广场4楼4017铺<br />
              电话：027-87126609 </dd>
            <dd><span>大渔铁板烧...武汉（国际广场店）</span><br />
              地址：江汉区解放大道武汉国际广场B座5楼<br />
              电话：027-85823026 </dd>
            <dd><span>大渔铁板烧（花园道店）</span><br />
              地址：江汉区青年路308号花园道商业街A-112号<br />
              电话：027-85803792 </dd>
          </dl>
        </div>
        <!--第一个选项卡内容结束-->
        <div id="tab2">
          <h2>团购详情</h2>
          <table>
            <tr>
              <th>内容</th>
              <th>单价</th>
              <th>数量/规格 </th>
              <th>小计</th>
            </tr>
            <tr>
              <th colspan="4">以下2选1</th>
            </tr>
            <tr>
              <td>周一至周四午餐晚餐二选一</td>
              <td>168元</td>
              <td>1位</td>
              <td>168</td>
            </tr>
            <tr>
              <td>周五至周日午餐晚餐二选一</td>
              <td>168元</td>
              <td>1位</td>
              <td>168</td>
            </tr>
            <tr>
              <th colspan="4">其他</th>
            </tr>
            <tr>
              <td>哈根达斯单球</td>
              <td>28元</td>
              <td>2球</td>
              <td>56元</td>
            </tr>
          </table>
          <p>价值：224元</p>
          <p>美淘价：149元</p>
          <ul>
            <li>周一至周四午餐晚餐二选一：周一至周四11:00-15:00,17:00-22:00</li>
            <li>周五至周日午餐晚餐二选一：周五至周日11:00-15:00,20:30-22:30</li>
          </ul>
          <div id="buyrule">
            <h3>购买须知</h3>
            <p><span>有效期：</span>2013.10.17 至 2013.12.18（周末、法定节假日通用）</p>
            <p><span>预约提醒：</span>请至少提前1天致电商家预约</p>
            <p><span>使用规则：</span></p>
            <ul>
              <li>1.2米（含）以下儿童享原价的半价优惠，到店支付即可（不含自助餐外其它零点），1.2米（不含）以上需独立使用1张美淘券</li>
              <li>团购用户不可同时享受商家其他优惠</li>
              <li>部分菜品因时令原因有所不同，请以店内当日实际供应为准</li>
            </ul>
          </div>
          <!--购买须知结束--> 
        </div>
        <!--第二个选项卡内容结束-->
        <div id="tab3">
          <h2>美淘推荐</h2>
          <dl>
            <dt><img src="images/detail/ok1.jpg" /></dt>
            <dd>爱她就请她吃Haagen-Dazs（单球2个） ： 哈根达斯冰激凌1921年诞生于纽约布朗克斯市的一个家庭，创始人鲁本·马特斯立志要生产纯天然的，高质量，风味绝佳的冰激凌产品，让世人享受真正高品质的冰淇淋美味。纽约时代杂志曾赋予哈根达斯“冰淇淋中的劳斯莱斯”的美名。 </dd>
          </dl>
          <dl>
            <dt><img src="images/detail/ok2.jpg" /></dt>
            <dd>香芒芝士焗扇贝 ： 扇贝拌上奶油汁，最后放上足量的芝士，上烤箱烤制。芝士与奶油汁的味道浓郁，香气飘散开来，品尝一口，会发现扇贝难以抵挡的鲜味更是让您垂涎三尺不止～ </dd>
          </dl>
          <dl>
            <dt><img src="images/detail/ok3.jpg" /></dt>
            <dd>铁板蟹籽蒸蛋 ： 鹅肝鱼子酱烘蛋，世界食材的烹饪，堪称经典。润滑爽口的松茸，入口即化的鹅肝，让您一次享尽极致美味。 </dd>
          </dl>
          <dl>
            <dt><img src="images/detail/ok4.jpg" /></dt>
            <dd>芝士青口贝 ： 一道鲜味十足的海鲜大餐，浓浓的芝士淋在鲜美的青口贝上，搭配着爽口的鱼籽，一口吃下去，芝士香加上鲜香在嘴里徜徉一翻，让你沉醉其中。 </dd>
          </dl>
        </div>
        <!--第三个选项卡内容结束-->
        <div id="tab4">
          <h2>消费评价</h2>
          <ul>
            <li><img src="images/detail/remark1.jpg" /></li>
            <li><img src="images/detail/remark2.jpg" /></li>
            <li><img src="images/detail/remark3.jpg" /></li>
          </ul>
          <P><a href="#">1</a> <a href="#">2</a> <a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#">8</a></P>
        </div>
        <!--第4个选项卡内容结束--> 
      </div>
      <!--选项卡内容结束--> 
    </div>
    <!--详细的第二个栏目结束--> 
  </div>
  <div id="side">
    <div id="hottopic">
      <h2>热门主题</h2>
      <a href="#"><img src="images/hottopic1.jpg" /></a> <a href="#"><img src="images/hottopic2.jpg" /></a> <a href="#"><img src="images/hottopic3.jpg" /></a>
      </dl>
    </div>
    <!--热门主题-->
    <div id="hotbuy">
      <h2>热卖排行榜</h2>
      <dl>
        <dt><a href="#"><img src="images/hotbuy1.jpg" /></a></dt>
        <dd>【武汉广场】武商摩尔国际电影城单人票</dd>
        <dd><span>¥25</span>每天1416人团购</dd>
      </dl>
      <dl>
        <dt><a href="#"><img src="images/hotbuy2.jpg" /></a></dt>
        <dd>【3店通用】万达国际影城电影票</dd>
        <dd><span>¥25</span>每天1166人团购</dd>
      </dl>
      <dl class="last">
        <dt><a href="#"><img src="images/hotbuy3.jpg" /></a></dt>
        <dd>【武汉等】金汉斯烤肉自助餐</dd>
        <dd><span>¥46.75</span>每天468人团购</dd>
      </dl>
    </div>
    <!--热门排行榜-->
    <div id="price">
      <ul>
        <li>金汉斯&nbsp; <a href="#">进行中</a></li>
        <li>兰蔻升级版小黑瓶  &nbsp; <a href="#">进行中</a></li>
        <li>苹果 iPhone 5s   &nbsp;<a href="#">进行中</a></li>
        <li>HTC One max   &nbsp;<a href="#">进行中</a> </li>
        <li>三星最新平板电   &nbsp;<a href="#">进行中</a></li>
        <li>苹果 iPad Air  &nbsp;<a href="#">进行中</a></li>
      </ul>
    </div>
    <!--抽奖-->
    
    <div id="lastview">
      <h2>最近浏览</h2>
      <P><a href="#">清空</a></P>
      <dl>
        <dt><a href="#"><img src="images/lastview1.jpg" /></a></dt>
        <dd>三星最新平板电脑</dd>
        <dd><span class="discount">&yen;0</span><span class="previous">0</span></dd>
      </dl>
      <dl>
        <dt><a href="#"><img src="images/lastview2.jpg" /></a></dt>
        <dd>中商广场提供现金卡</dd>
        <dd><span class="discount">&yen;50</span><span class="previous">100</span></dd>
      </dl>
      <dl class="noborder">
        <dt><a href="#"><img src="images/lastview3.jpg" /></a></dt>
        <dd>金汉斯烤肉自助餐</dd>
        <dd><span class="discount">&yen;46</span><span class="previous">58</span></dd>
      </dl>
    </div>
  </div>
</div>
<iframe src="foot.html" width="100%"  scrolling="no" frameborder="0" height="185"></iframe>
<div id="adv"> <img src="images/ban.jpg" width="100"  /> </div>
</body>
</html>
