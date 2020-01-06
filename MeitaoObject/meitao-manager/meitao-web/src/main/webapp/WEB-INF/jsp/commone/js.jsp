<script src="${pageContext.request.contextPath}/statics/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/lib/bootstrap/js/bootstrap.min.js"></script>

<script class="include" type="text/javascript"
        src="${pageContext.request.contextPath}/statics/lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="${pageContext.request.contextPath}/statics/lib/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/lib/jquery.nicescroll.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/statics/lib/jquery.sparkline.js"></script>
<script src="${pageContext.request.contextPath}/statics/lib/common-scripts.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/statics/lib/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/lib/gritter-conf.js"></script>
<script src="${pageContext.request.contextPath}/statics/lib/sparkline-chart.js"></script>
<script src="${pageContext.request.contextPath}/statics/lib/zabuto_calendar.js"></script>
<script type="application/javascript">
    $(document).ready(function () {
        $("#date-popover").popover({
            html: true,
            trigger: "manual"
        });
        $("#date-popover").hide();
        $("#date-popover").click(function (e) {
            $(this).hide();
        });

        $("#my-calendar").zabuto_calendar({
            action: function () {
                return myDateFunction(this.id, false);
            },
            action_nav: function () {
                return myNavFunction(this.id);
            },
            ajax: {
                url: "show_data.php?action=1",
                modal: true
            },
            legend: [{
                type: "text",
                label: "Special event",
                badge: "00"
            },
                {
                    type: "block",
                    label: "Regular event",
                }
            ]
        });
    });

    function myNavFunction(id) {
        $("#date-popover").hide();
        var nav = $("#" + id).data("navigation");
        var to = $("#" + id).data("to");
        console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
</script>
<script>
    //数据循环遍历
    var g_itemList = [];
    $(function () {
        $.ajax({
            type: "GET",
            /* contentType: "application/x-www-form-urlencoded",*/
            url: "http://localhost:8080/user/commonTestJson", /*允许跨域请求*/
            /*xhrFields: {withCredentials: true},*/
            success:
                function (data) {
                    if (data.status == "success") {
                        //定义一个数组
                        g_itemList = data.data;
                        //执行值的传递
                        reloadDomNew();
                    } else {
                        alert("侧边栏加载失败,原因为" + data.data.errMsg)
                    }
                    /*服務器返回非正常情况下的*/
                }
            ,
            error: function (data) {
                alert("侧边栏加载失败,原因是" + data.responseText)
            }
        })
        $("#nav-accordion").on("click", ".sub-menu", function () {
            $(".sub").slideUp();
            //以滑动方式显示元素
            $(this).children("ul").slideDown();
        });
    });


    //$.each 循环遍历方法
    function reloadDomNew() {
        $.each(g_itemList, function (n, value) {
            var itemDo =
                "<li class='sub-menu'><a href='javascript:;'>" +
                "<i class='fa fa-desktop'></i><span>" + value.privilegeName +
                "</span></a><ul class='sub'>";

            $.each(value.functionsList, function (n, values) {
                itemDo +=
                    "<li><a href='" + values.url + "'>"
                    + values.functionName + "</a></li>"
            })
            itemDo += "</ul></li>"
            $("#nav-accordion").append($(itemDo));
        })
    }


    function reloadDom() {
//首先遍历一级菜单
        for (var i = 0; i < g_itemList.length; i++) {
            var itemDo = g_itemList[i];
            var doms = "";
            for (var j = 0; j < itemDo.functionsList.length; j++) {
                var doms1 = itemDo.functionsList[j];
                doms += "<li><a href='" + doms1.url + "'>" + doms1.functionName + "</a></li>";
            }
            var dom = "<li class='sub-menu'><a href='javascript:;'>" +
                "<i class='fa fa-desktop'></i><span>" + itemDo.privilegeName + "</span></a>" +
                "<ul class='sub'>" + doms + "</ul></li>";

            $("#nav-accordion").append($(dom));
        }
    }

</script>