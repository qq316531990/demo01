<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
          + request.getServerName() + ":" + request.getServerPort()
          + path + "/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

    <!-- Custom styles for this template -->
    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

    <link rel="stylesheet" href="<%=path %>/asserts/bootstrapvalidator/css/bootstrapValidator.min.css" />
    <link rel="stylesheet" href="<%=path %>/css/animate.css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>
        window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')
    </script>
    <script src="<%=path%>/asserts/js/vendor/popper.min.js"></script>
    <script src="<%=path%>/js/bootstrap.min.js"></script>
  <link href="<%=path%>/css/carousel.css" rel="stylesheet">

    <link rel="stylesheet" href="<%=path%>/css/carts.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script>
        $(function(){
            getType();
        });
        //获取数据的方法
        function getType(){
            $.ajax({
                url:'<%=path%>/second/getTypesForUser',
                data:{},
                dataType:'json',
                success:function(data){
                }
            });
        }

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

<script src="<%=path%>/js/myPagination.js"></script>
<script src="../js/jquery-1.8.2.min.js"></script>
<script>
  function pre(){
    var currPage=parseInt($("#currPage").text())-1;
     window.location.href="<%=path%>/borrow/listBorrowsForUsers?currPage="+currPage
  }

  //下一页
  function next(){
    var currPage=parseInt($("#currPage").text())+1;
    window.location.href="<%=path%>/borrow/listBorrowsForUsers?currPage="+currPage
  }
  function go(reg){
    $("#nav a").removeClass("current");
    $(this).addClass("current");
    window.location.href="<%=path%>/borrow/listBorrowsForUsers?currPage="+reg
  }
</script>

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
                                    <li><a href="<%=path%>/book/selectBookToUser?tab=2&typeId=${secondType.secondType_id}" style="color:#FFFFFF">${secondType.secondType_name} </a></li>
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
            <span class="navbar-text">&nbsp; &nbsp;<a href="<%=path%>/login.jsp"> 登陆</a>&nbsp; &nbsp;</span>
        </c:if>
        <c:if test="${adminIsLogin=='OK'}">
            <span class="navbar-text"><a href="#" onclick="loginOut()">&nbsp; &nbsp;退出&nbsp; &nbsp;</a></span>
            <ul class="navbar-nav mr-auto">
                <li class="dropdown">

                    <a href="#" class="nav-link dropdown-toggle navbar-text" data-toggle="dropdown">  <img src="../images/user.jpg" style="width: 30px;height: 30px">个人中心 <b class="caret"></b>
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



<main role="main" style="">


  <!-- /END THE FEATURETTES -->
  <main class="cartMain">
    <div class="cartMain_hd">
      <ul class="order_lists cartTop">

      </ul>
    </div>

    <div class="cartBox">
      <div class="shop_info">

        <div class="shop_name">
          <button type="button" class="btn btn-default btn-xs">
            <span class="glyphicon glyphicon-user"></span>借阅历史
          </button>

        </div>
      </div>
      <div class="order_content">
        <ul class="order_lists" style="height:50px">

          <li class="list_price1" style="position:absolute;margin-left:100px">
            <p class="price">书名</p>
          </li>
          <li class="list_price1" style="position:absolute;margin-left:400px">
            <p class="price">作者</p>
          </li>
          <li class="list_price1" style="position:absolute;margin-left:600px">
            <p class="price">借阅时间</p>
          </li>

          <li class="list_price1" style="position:absolute;margin-left:725px">
            <p class="price">应归还时间</p>
          </li>
          <li class="list_price1" style="position:absolute;margin-left:860px">
            <p class="price">是否归还</p>
          </li>

        </ul>

        <div class="order_content">
            <c:if test="${empty borrowList.data}">
                <ul class="order_lists"> <li >
                    <p>您还未借阅过任何书籍！</p>
                </li></ul>
            </c:if>
        <c:forEach var="vo" items="${borrowList.data}">

                <ul class="order_lists">

                    <li class="list_con">
                        <div class="list_img"><img src="<%=path%>/images/upload/${vo.book_image}" alt=""></div>
                        <div class="list_text"><a href="javascript:;">${vo.book_name}</a></div>
                    </li>
                    <li class="list_info">
                        <p>${vo.book_author}</p>
                    </li>
                    <li class="list_price">
                        <p ><fmt:formatDate value="${vo.lend_time}" pattern="yyyy-MM-dd"/></p>
                    </li>

                    <li class="list_sum">
                        <p><fmt:formatDate value="${vo.return_time}" pattern="yyyy-MM-dd"/></p>
                    </li>
                    <li class="list_op">
                        <c:if test="${ empty vo.actual_return_time}">   <p ><a class="delBtn" style="color: #942a25">未归还</a></p> </c:if>
                        <c:if test="${not empty vo.actual_return_time}">   <p ><a class="delBtn" style="color: #00a300">已归还</a></p> </c:if>

                    </li>
                    <li>
                    <li class="list_op1">
                        <div  class="btn-group btn-group-xs">
                            <c:if test="${ empty vo.actual_return_time}">
                            <a  class="btn btn-info" style="opacity: 0.6;">
                                评论
                            </a>
                            </c:if>
                            <c:if test="${not empty vo.actual_return_time}">
                                <a href="<%=path%>/jsp/commentPingLun.jsp?vo_book_id=${vo.book_id}" class="btn btn-info" >
                                    评论
                                </a>
                            </c:if>
                        </div>
                    </li>

                </ul>
</c:forEach>

        </div>
      </div>
      <div class="pagelist" id="nav" style="position: absolute;margin-left:30%">  <a href ="#" onclick ="pre()">上一页</a> <a href ="#" onclick ="go(1)" >1</a><a href ="#" onclick ="go(2)" >2</a><a href ="#" onclick ="go(3)">3</a><a href ="#" onclick ="next()">下一页</a>
        共<a id="count">${borrowList.count}</a>条记录
        当前第<a id="currPage">${borrowList.currPage}</a>页 </div>
    </div>
    <!--底部-->








    <!-- FOOTER -->

  </main>
</main>
<!-- Bootstrap core JavaScript
  ================================================== -->

</body>

</html>