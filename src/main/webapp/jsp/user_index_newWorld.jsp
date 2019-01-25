<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>
    <!-- Bootstrap core CSS -->
    <link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .table td{
            vertical-align: middle;
            white-space:nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 50px;
        }
        .dropdown {
            appearance:none;
            -moz-appearance:none; /* Firefox */
            -webkit-appearance:none; /* Safari 和 Chrome */
        }

    </style>
    <link rel="stylesheet" href="<%=path %>/asserts/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="<%=path %>/asserts/bootstrapvalidator/css/bootstrapValidator.min.css" />
    <link rel="stylesheet" href="<%=path %>/css/animate.css"/>
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
                type: 'post',
                url:'<%=path %>/user/loginOut',
                dataType: "json",
                async: true,
                data: {},
                success: function (data) {
                    if (data == 1) {
                        alert("注销成功!");
                        window.location.href = "../login.jsp";
                    }


                }
            })}

    </script>
</head>

<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="height: 4%;margin-top: 0%">
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
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"> ${type.type_name}
                    </a>
                    <ul class="dropdown-menu" style=" background-color:#5a5a5a;">
                        <c:forEach var="secondType" items="${secondTypeList}">
                            <c:if test="${type.type_id==secondType.type_id}">
                                <li><a href="<%=path%>/book/selectBookToUser?tab=2&typeId=${secondType.secondType_id}" style="color:#FFFFFF">${secondType.secondType_name} </a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
           </c:forEach>
            </ul>


        </div>
        <c:if test="${adminIsLogin!='OK'}">
        <span class="navbar-text">&nbsp; &nbsp;<a href="<%=path%>/login.jsp"> 登陆</a>&nbsp; &nbsp;</span>
        </c:if>
        <c:if test="${adminIsLogin=='OK'}">
            <span class="navbar-text"><a href="#" onclick="loginOut()">&nbsp; &nbsp;退出&nbsp; &nbsp;</a></span>
        <ul class="navbar-nav mr-auto">
            <li class="dropdown">

            <a href="#" class="nav-link dropdown-toggle navbar-text" data-toggle="dropdown">  <img src="../images/user.jpg" style="width: 30px;height: 30px">个人中心
            </a>
            <ul class="dropdown-menu " style=" background-color:#5a5a5a;">
                <li><a href="<%=path%>/borrow/listBorrowsForUsers?currPage=1"  class="navbar-text" style="color:#FFFFFF">借阅历史查询</a></li>
                <li><a href="<%=path%>/jsp/user_updatePass.jsp"  class="navbar-text" style="color:#FFFFFF">修改密码</a></li>
                <li><a href="<%=path%>/jsp/user_update.jsp?user_id=${userLogin.user_id}"  class="navbar-text" style="color:#FFFFFF">个人信息</a></li>
                <li><a href="<%=path%>/message/selectMessageForUser"  class="navbar-text" style="color:#FFFFFF">我的消息<span class="badge">${sessionScope.unRead}</span></a></li>
                <li><a href="<%=path%>/comment/plList?user_id=${userLogin.user_id}"  class="navbar-text" style="color:#FFFFFF">我的评论</a></li>
            </ul>
            </li>
        </ul>
        </c:if>
    </nav>
</header>
<main role="main" style="">
    <div class="row">

        <div class="col-sm-7 col-sm-offset-1 row mt-2"  style="width: 80%;margin-left: 10%;margin-bottom: 2%" >
    <form class="form-inline" action="/demo01/book/selectBookToUser?tab=3" method="post">
        <div class="form-group">
            <input type="text" name="bookName" class="form-control" id="exampleInputName2" placeholder="图书名">
        </div>
        <div class="form-group">
            <input type="email" name="bookAuthor" class="form-control" id="exampleInputAuthor2" placeholder="作者">
        </div>

        <button type="submit" class="btn btn-default btn-primary">开启新世界</button>
    </form>
        </div>
    </div>
    <!-- Marketing messaging and featurettes
      ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
    <div class="aa">

    </div>
    <div class="row">

    <div class="col-sm-7 col-sm-offset-1 row mt-2" id="card-1" style="width: 80%;margin-left: 10%">
        <c:forEach items="${pu.list}" var="book" >
        <div class="col-sm-6 col-md-4 col-lg-3 ">
            <div class="card card-inverse card-info" >
                <img class="card-img-top"  style="width:150px;height:160px;text-align: center" src="<%=path%>/images/upload/${book.bookImage}">
                <div class="card-block" style="width:151px;height:40px;text-align: center" >
                    <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <td>${book.bookName}</td>
                    </tr>
                    </table>
                    <%--<h4 class="card-title"></h4>--%>
                </div>
                <div class="card-footer">
                    <small>价格:${book.bookPrice}</small>
                    <button class="btn btn-info float-right btn-sm"><a href="<%=path %>/comment/findBook?book_id=${book.bookId}">详情</a></button>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
        <div class="col-sm-1"></div>

    </div>
        <div class="text-right" style="margin-right: 20%">
        <ul class="pagination">
            <c:choose>
                <c:when test="${pu.currentPage == 1}">
                    <li class="disabled"><a href="#"><span>&laquo;</span></a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/demo01/book/selectBookToUser?cp=${pu.prev}"><span>&laquo;</span></a></li>
                </c:otherwise>
            </c:choose>

            <c:forEach begin="${pu.start}" end="${pu.end}"  var="i">
                <c:choose>
                    <c:when test="${i == pu.currentPage}">
                        <li class="active"><a href="#">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/demo01/book/selectBookToUser?cp=${i}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${pu.currentPage == pu.last}">
                    <li class="disabled"><a href="#"><span>&raquo;</span></a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/demo01/book/selectBookToUser?cp=${pu.next}"><span>&raquo;</span></a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>

    <!-- FOOTER -->
    <footer class="container">
        <p class="float-right"><a href="#">Back to top</a></p>
        <p>© 2017-2018 Company, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
    </footer>
</main>
<!-- Bootstrap core JavaScript
  ================================================== -->


</body>

</html>