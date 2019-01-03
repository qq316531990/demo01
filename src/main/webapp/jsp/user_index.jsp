<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>拼夕夕夕夕</title>
    <link href="<%=path%>/css/slider.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/css/index.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path%>/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">



    </script>
</head>
<body>

<div class="container header">
    <div class="span5">
        <div class="logo">

            <img width="190px" height="56px"   src="<%=path%>/images/dd.gif" alt="传智播客"/>
            </a>
        </div>
    </div>
    <div class="span9">
        <div class="headerAd">
            <img  height="56px" src="<%=path%>/images/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
        </div>
    </div>


    <div class="span10 last">
        <div class="topNav clearfix">
            <ul>


                <c:choose>

                    <c:when test="${user==null}">
                        <li id="headerLogin" class="headerLogin" style="display: list-item;">
                            <a href="<%=path%>/users/login.jsp">登录</a>|</li>
                        <li id="headerRegister" class="headerRegister"
                            style="display: list-item;"><a href="<%=path%>/users/register.jsp">注册</a>|
                        </li>

                    </c:when>
                    <c:otherwise>
                        <li id="headerLogin" class="headerLogin" style="display: list-item;">
                                ${user.userName} 欢迎您！
                            |</li>
                        <li id="headerLogin" class="headerLogin" style="display: list-item;">
                            <a href="<%=path%>/QueryOrderIdByUserIdServlet?userID=${user.userID}">我的订单</a>
                            |</li>
                        <li id="headerRegister" class="headerRegister"
                            style="display: list-item;"><a href="<%=path%>/users/login.jsp">退出</a>|
                        </li>
                    </c:otherwise>

                </c:choose>
                <li><a>会员中心</a> |</li>
                <li><a>购物指南</a> |</li>
                <li><a>关于我们</a></li>

            </ul>

        </div>
        <input type="text" id="pname" />
        <button onclick="search()">查询</button>
        <div class="cart">

            <a href="<%=path%>/ShowUserCartServlet?userID=${user.userID}">购物车</a>
        </div>
        <div class="phone">

            客服热线: <strong>96008/53277764</strong>
        </div>
    </div>
    <div class="span24">
        <ul class="mainNav">
            <li><a href="<%=path%>/">首页</a> |</li>
            <li><a href="<%=path%>/users/productList.jsp?booktype=青春文学">青春文学</a> |</li>
            <li><a href="<%=path%>/users/productList.jsp?booktype=人文社科">人文社科</a> |</li>
            <li><a href="<%=path%>/users/productList.jsp?booktype=科学技术">科学技术</a> |</li>
            <li><a href="<%=path%>/users/productList.jsp?booktype=经济管理">经济管理</a> |</li>
            <li><a href="<%=path%>/users/productList.jsp?booktype=小说">小说</a> </li>


        </ul>
    </div>

</div>

<div class="container index">


    <div class="span24">
        <div id="hotProduct" class="hotProduct clearfix">
            <div class="title">
                <strong>热门商品</strong>
                <!-- <a  target="_blank"></a> -->
            </div>
            <ul class="tab">
                <li class="current">
                    <a  target="_blank"></a>
                </li>
                <li>
                    <a  target="_blank"></a>
                </li>
                <li>
                    <a target="_blank"></a>
                </li>
            </ul>
            <ul class="tabContent" style="display: block;">
                <c:forEach items="${hotList}" var="books" >

                    <li>

                        <a href="<%=path %>/QueryByIdServlet?bookID=${books.bookID}" ><img src="<%=path %>/img/books/${books.img}"></a>
                    </li>
                </c:forEach>

            </ul>

        </div>
    </div>
    <div class="span24">
        <div id="newProduct" class="newProduct clearfix">
            <div class="title">
                <strong>最新商品</strong>
                <a  target="_blank"></a>
            </div>
            <ul class="tab">
                <li class="current">
                </li>
                <li>
                    <a  target="_blank"></a>
                </li>
                <li>
                    <a target="_blank"></a>
                </li>
            </ul>



            <ul class="tabContent" style="display: block;">
                <c:forEach items="${newList}" var="books" >

                    <li>

                        <a href="<%=path %>/QueryByIdServlet?bookID=${books.bookID}"><img src="<%=path %>/img/books/${books.img}"></a>
                    </li>
                </c:forEach>

            </ul>

        </div>
    </div>
    <div class="span24">
        <div class="friendLink">
            <dl>
                <dt>新手指南</dt>
                <dd>
                    <a  target="_blank">支付方式</a>
                    |
                </dd>
                <dd>
                    <a  target="_blank">配送方式</a>
                    |
                </dd>
                <dd>
                    <a  target="_blank">售后服务</a>
                    |
                </dd>
                <dd>
                    <a  target="_blank">购物帮助</a>
                    |
                </dd>
                <dd>
                    <a  target="_blank">蔬菜卡</a>
                    |
                </dd>
                <dd>
                    <a  target="_blank">礼品卡</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">银联卡</a>
                    |
                </dd>
                <dd>
                    <a  target="_blank">亿家卡</a>
                    |
                </dd>

                <dd class="more">
                    <a >更多</a>
                </dd>
            </dl>
        </div>
    </div>
</div>
<div class="container footer">
    <div class="span24">
        <div class="footerAd">
            <img src="<%=path%>/images/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
        </div>	</div>
    <div class="span24">
        <ul class="bottomNav">
            <li>
                <a>关于我们</a>
                |
            </li>
            <li>
                <a>联系我们</a>
                |
            </li>
            <li>
                <a>招贤纳士</a>
                |
            </li>
            <li>
                <a>法律声明</a>
                |
            </li>
            <li>
                <a>友情链接</a>
                |
            </li>
            <li>
                <a target="_blank">支付方式</a>
                |
            </li>
            <li>
                <a target="_blank">配送方式</a>
                |
            </li>
            <li>
                <a>服务声明</a>
                |
            </li>
            <li>
                <a>广告声明</a>

            </li>
        </ul>
    </div>
    <div class="span24">
        <div class="copyright">Copyright © 2005-2015 网上商城 版权所有</div>
    </div>
</div>
</body>
</html>