<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE>
<html>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>
</head>
<body>
<div id="header">
    <div class="logo">Libiary</div>
    <div class="navigation">
        <ul>
            <li>欢迎您！</li>
            <li><a href="">${userLogin.userName}</a>
            </li>
            <li><a href="">修改密码</a>
            </li>
            <li><a href="">设置</a>
            </li>
            <li><a href="<%=path%>/login.jsp">退出</a>
            </li>
            <li>

        </ul>

    </div>
</div>
<div id="content">
    <div class="left_menu">
        <ul id="nav_dot">


                <li>
                    <h4 class="M7">
                        <span></span>管理
                    </h4>
                    <div class="list-item none">
                        <a href='<%=path %>/jsp/book.jsp' target="main">用户管理</a>
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
                    src="..\welcome.jsp"> </iframe>
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
</script>
</body>
</html>

