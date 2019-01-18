<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ page isELIgnored="false" %>
<!DOCTYPE>
<html>
<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/menu.js"></script>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/menu.js"></script>
</head>
<body>
<div id="header">
    <div class="logo">Libiary</div>
    <div class="navigation">
        <ul>
            <li>欢迎您！</li>
            <li><a href="">${userLogin.user_name}</a>
            </li>
            <li><a href="<%=path%>/jsp/admin_updatePass.jsp" target="main">修改密码</a>
            </li>
            <li><a href="">设置</a>
            </li>
            <li><a href="#" onclick="loginOut()">注销</a>
            </li>
            <li>

        </ul>

    </div>
</div>
<div id="content">
    <div class="left_menu">
        <ul id="nav_dot">

           <c:if test="${userLogin.permission_id==6}">
                <li>
            <h4 class="M7">
                <span></span>用户
            </h4>
            <div class="list-item none">
                <a href='<%=path %>/jsp/user_manager.jsp' target="main">用户管理</a>
            </div>
        </li>
           </c:if>
            <li>
       <c:if test="${userLogin.permission_id==6}">
            <h4 class="M5">
                <span></span>书籍分类管理
            </h4>
            <div class="list-item none">
                <a href='<%=path %>/jsp/type_manager.jsp' target="main">一级分类管理</a>
                <a href='<%=path %>/jsp/secondType_manager.jsp' target="main">二级分类管理</a>
            </div>
        </li>
            </c:if>
            <li>
                <h4 class="M1">
                    <span></span>书籍借阅归还
                </h4>
                <div class="list-item none">
                    <a href='<%=path %>/jsp/borrow_manager.jsp' target="main">借阅</a>
                    <a href='<%=path %>/jsp/returnBook.jsp' target="main">归还</a>
                </div>
            </li>
            <li>
                <h4 class="M2">
                    <span></span>图书管理
                </h4>
                <div class="list-item none">
                    <a href='<%=path %>/book/selectBook' target="main">图书管理</a>

                </div>
            </li>
            <li>
                <h4 class="M2">
                    <span></span>消息管理
                </h4>
                <div class="list-item none">
                    <a href='<%=path %>/message/selectMessageForManege' target="main">消息管理</a>

                </div>
            </li>
            <li>
                <h4 class="M2">
                    <span></span>统计
                </h4>
                <div class="list-item none">
                    <a href='<%=path %>/jsp/countTypesByBorrow.jsp' target="main">书籍分类借阅统计</a>
                </div>
            </li>

            <li>
                <h4 class="M1">
                    <span></span>评论管理
                </h4>
                <div class="list-item none">
                    <a href='<%=path %>/comment/find' target="main">书籍评论管理</a>
                    <a href='<%=path %>/comment/findHuiFu' target="main">评论回复管理</a>
                    <a href="<%=path %>/comment/findBook?book_id=18">用户评论</a>
                </div>
            </li>



        </ul>
    </div>
    <div class="m-right">
        <div class="right-nav">
            <ul>
                <li><img src="<%=path%>/images/home.png"
                         style="vertical-align:top;">
                </li>
                <li style="margin-left:25px;">您当前的位置：</li>
                <li id="right-nav1"></li>
                <li id="right-nav2"></li>
            </ul>



        </div>

        <div class="main">
            <iframe name="main" style=" width:100%; height:95%; border:none"
                    src=""> </iframe>
        </div>

    </div>
</div>
<div id="footer">
    <p>版权所有，仿冒必究</p>
</div>
<script>
    navList(12);
</script>
<script>
    $("#nav_dot a").click(function() {
        var $a = $(this).clone();
        var str = $(this).parent().prev().text();
        $("#right-nav1").html(str + " < ");
        $("#right-nav2").empty();
        $("#right-nav2").append($a);
    });

    function loginOut() {
        $.ajax({
            type: 'post',
            url: '<%=path %>/user/loginOut',
            dataType: "json",
            async: true,
            data: {},
            success: function (data) {
                     if(data==1){
                         alert("注销成功!");
                         window.location.href = "../login.jsp" ;
                     }


            }
        });

    }
</script>
</body>
</html>

