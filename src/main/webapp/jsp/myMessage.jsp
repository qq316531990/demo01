<%@ page language="java"  pageEncoding="UTF-8"%>
<!-- 导入jstl标准标签库的核心标签：c标签 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 格式化标签 -->
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="../sourceCss.jsp" %>
    <link rel="stylesheet" href="/demo01/css/pintuer.css">
    <link rel="stylesheet" href="/demo01/css/admin.css">
    <link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<%=path%>/css/carousel.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>
        window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')
    </script>
    <script src="<%=path%>/asserts/js/vendor/popper.min.js"></script>
    <script src="<%=path%>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script >

        function loginOut() {
            $.ajax({
                type: 'get',
                url:'<%=path %>/user/loginOut',
                dataType: "json",
                async: false,
                data: {},
                success: function (data) {
                    if (data == 1) {
                        alert("注销成功!");
                        window.location.href = "../login.jsp";
                    }


                }
            })}


    </script>
    <style>
        .choose{
            width :20%;
            height:4%;
        }

        .aa{
            width:85%;
            display:inline-block;
            margin-top:0;
            position:fixed;
        }
        .navbar{
            border-radius:0;
        }
        .table td{
            vertical-align: middle;
            white-space:nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 200px;
        }
        .table td:last-child{
            text-align:center;
        }
        .btn-group{
            margin-bottom:10px;
        }
        textarea{
            resize:none;/*禁止改变大小*/
        }
        dl>dt,dl>dd{
            padding:5px 0;
        }
    </style>
</head>
<body>
<div class="modal animated bounceIn" id="messageInfo">
    <form action="/demo01/message/updateMessage">
    <input type="hidden" name="messageId" value="" id="d0"/>
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4>消息详情</h4>
            </div>
            <div class="modal-body">
                <dl class="dl-horizontal">
                    <dt>消息内容</dt>
                    <dd id="d1"></dd>
                    <dt>消息类型:</dt>
                    <dd id="d2"></dd>
                    <dt>消息时间:</dt>
                    <dd id="d3"></dd>
                    <%--<dt>关联图书:</dt>--%>
                    <%--<dd id="d4"></dd>--%>

                </dl>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" type="submit">关闭</button>
            </div>
        </div>
    </div>
    </form>
</div>

<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="">
        <a class="navbar-brand" href="#">WondersLibrary</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto" >
                <li class="nav-item active">
                    <a class="nav-link" href="<%=path%>/second/getTypesForUser">首页<span class="sr-only">(current)</span></a>
                </li>
                <c:forEach var="type" items="${typeList}">
                    <li class="dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"> ${type.type_name} <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" style=" background-color:#5a5a5a;">
                            <c:forEach var="secondType" items="${secondTypeList}">
                                <c:if test="${type.type_id==secondType.type_id}">
                                    <li><a href="#" style="color:#FFFFFF">${secondType.secondType_name} </a></li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
            </ul>
            <form class="form-inline my-2 my-lg-0"> <input class="form-control mr-sm-2" type="text" placeholder="Search"> <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> </form>
        </div>
        <c:if test="${adminIsLogin!='OK'}">
            <span class="navbar-text">&nbsp; &nbsp;<a href="<%=path%>/login.jsp" > 登陆</a>&nbsp; &nbsp;</span>
        </c:if>
        <c:if test="${adminIsLogin=='OK'}">
            <span class="navbar-text"><a href="#" onclick="loginOut()">&nbsp; &nbsp;退出&nbsp; &nbsp;</a></span>
            <ul class="navbar-nav mr-auto">
                <li class="dropdown">
                    <a href="#" class="nav-link dropdown-toggle navbar-text" data-toggle="dropdown"> <img src="../images/user.jpg" style="width: 30px;height: 30px">个人中心 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu " style=" background-color:#5a5a5a;">
                        <li><a href="<%=path%>/borrow/listBorrowsForUsers?currPage=1"  class="navbar-text" style="color:#FFFFFF">借阅历史查询</a></li>
                        <li><a href="<%=path%>/jsp/user_updatePass.jsp"  class="navbar-text" style="color:#FFFFFF">修改密码</a></li>
                        <li><a href="<%=path%>/jsp/user_update.jsp?user_id=${userLogin.user_id}"  class="navbar-text" style="color:#FFFFFF">个人信息</a></li>
                        <li><a href="#"  class="navbar-text" style="color:#FFFFFF">我的评论</a></li>
                        <li><a href="<%=path%>/message/selectMessageForUser"  class="navbar-text" style="color:#FFFFFF">我的消息<span class="badge">${sessionScope.unRead}</span></a></li>
                    </ul>
                </li>
            </ul>
        </c:if>
    </nav>
</header>
<div class="aa">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="" class="navbar-brand">我的消息</a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#userInfo">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

        </div>
    </nav>
    <!-- 	内容区 -->
    <div class="container-fluid">
        <!-- 		路径导航 -->
        <ol class="breadcrumb">
            <li><a href="#">我的消息</a></li>
            <li class="active">消息列表</li>
        </ol>


        <%--<form action="/demo01/message/selectMessageForUser" class="form-horizontal" id="" method="post">--%>
            <%--<div class="form-group">--%>
                <%--<label for="exampleInputName2">用户ID</label>--%>
                <%--<input type="text" name="userId" class="form-control" id="exampleInputName2" placeholder="1">--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
                <%--<label for="exampleInputEmail2">图书ID</label>--%>
                <%--<input type="text" name="bookId" class="form-control" id="exampleInputEmail2" placeholder="1">--%>
            <%--</div>--%>
            <%--<button type="submit" class="btn btn-default">查找</button>--%>
        <%--</form>--%>
        <br /><br />
        <div class="data-container">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <%--<th><input type="checkbox" id="selectAll"/></th>--%>


                    <th>消息内容</th>
                    <th>消息类型</th>
                    <th>消息时间</th>
                    <th>消息状态</th>
                    <%--<th>关联图书</th>--%>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pu.list}" var="message" >
                    <tr>
                        <%--<td><input type="checkbox" name="ids" value="${message.messageId}"/></td>--%>
                        <td style="display:none;" title="${message.messageId}">${message.messageId}</td>
                        <td title="${message.messageContent}">${message.messageContent}</td>
                        <td>
                            <c:if test="${message.messageType==1}">借阅消息</c:if>
                            <c:if test="${message.messageType==0}">预约消息</c:if>
                            <c:if test="${message.messageType==2}">还书提醒消息</c:if>
                            <c:if test="${message.messageType==3}">超时消息</c:if>
                            <c:if test="${message.messageType==4}">评论消息</c:if>
                        </td>
                        <td title="${message.messageTime}"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${message.messageTime}"/></td>
                        <td>
                            <c:if test="${message.messageState==1}">已读</c:if>
                            <c:if test="${message.messageState==0}">未读</c:if>
                        </td>
                        <%--<td title="${message.bookId}">${message.bookId}</td>--%>
                        <td>
                            <button class="btn btn-primary btn-sm btnInfo" data-message-id="${message}" data-toggle="modal" data-target="#messageInfo"><span class="glyphicon glyphicon-info-sign"></span>详情</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <%--分页标签 -->--%>
            <div class="text-right">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${pu.currentPage == 1}">
                            <li class="disabled"><a href="#"><span>&laquo;</span></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/demo01/message/selectMessageForUser?cp=${pu.prev}"><span>&laquo;</span></a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach begin="${pu.start}" end="${pu.end}"  var="i">
                        <c:choose>
                            <c:when test="${i == pu.currentPage}">
                                <li class="active"><a href="#">${i}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/demo01/message/selectMessageForUser?cp=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${pu.currentPage == pu.last}">
                            <li class="disabled"><a href="#"><span>&raquo;</span></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/demo01/message/selectMessageForUser?cp=${pu.next}"><span>&raquo;</span></a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
</div>

<%@ include file="../sourceJs.jsp" %>

<script>


    $('.btnInfo').on('click',function(){
    var tr = $(this).parents('tr');
    document.getElementById("d0").value=$(tr).find('td').eq(0).text();
    $('#d0').text($(tr).find('td').eq(0).text());
    $('#d1').text($(tr).find('td').eq(1).text());
    $('#d2').text($(tr).find('td').eq(2).text());
    $('#d3').text($(tr).find('td').eq(3).text());
    // $('#d4').text($(tr).find('td').eq(5).text());
    });

</script>
</body>
</html>
