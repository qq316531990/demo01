<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="<%=path%>/css/book_detail2.css">
     <style>

    </style>

<title></title>
    <!-- Bootstrap core CSS -->
     <link href="<%=path%>/css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="<%=path%>/asserts/js/vendor/popper.min.js"></script>
    <script src="<%=path%>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script >
        function showCom(obj) {
            obj=obj.toString();
            var div = document.getElementsByClassName(obj);
            var i;
            for (i = 0; i < div.length; i++) {
                if (div[i].style.display == "none") {
                    div[i].style.display = 'block';

                } else {
                    div[i].style.display = 'none';

                }
            }

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
                    <li class="dropdown" >
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"> ${type.type_name} <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" style=" background-color:#5a5a5a;border-top:none">
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
                        <li><a href="<%=path%>/comment/plList?user_id=${userLogin.user_id}"  class="navbar-text" style="color:#FFFFFF">我的评论</a></li>
                        <li><a href="<%=path%>/message/selectMessageForUser"  class="navbar-text" style="color:#FFFFFF">我的消息<span class="badge">${sessionScope.unRead}</span></a></li>
                    </ul>
                </li>
            </ul>
        </c:if>
    </nav>
</header>




<div class="banner" >
    <div class="wrapper clearfix">
        <div class="celeInfo-left">
            <div class="avatar-shadow">
                <img class="avatar" src="<%=path%>/images/upload/${book1.bookImage}" alt="">
                <div class="movie-ver"></div>
            </div>
        </div>
        <div class="celeInfo-right clearfix">
            <div class="movie-brief-container" style="margin-top: 10%">
                <h3 class="name">${book1.bookName}</h3>
                <div class="ename ellipsis">￥：${book1.bookPrice}</div>
                <ul>
                    <li class="ellipsis">库存：${book1.bookCount}</li>
                    <li class="ellipsis">
                        作者：${book1.bookAuthor}
                    </li>
                    <li class="ellipsis">出版社：${book1.bookPublishedInformation}</li>
                </ul>
            </div>
            <div class="action-buyBtn" style=" width: 250px; height: 40px;text-align: center;
               background-color: #df2d2d;">
                <a   style="color: white" target="_blank">立即借阅</a>
            </div>

            <div class="movie-stats-container">

                <div class="movie-index">
                    <p class="movie-index-title">用户评分</p>
                    <div class="movie-index-content score normal-score">
              <span class="index-left info-num ">
                <span class="stonefont">${book1.bookStar*2}</span>
              </span>
                        <div class="index-right">
                            <div class="star-wrapper">
                                <div class="star-on" style="width:${book1.bookStar*20}%;"></div>
                            </div>
                            <span class="score-num"><span class="stonefont">${book1.bookCommentNumber}</span>人评分</span>
                        </div>
                    </div>
                </div>



                <div class="movie-index">
                    <p class="movie-index-title">累计借阅</p>
                    <div class="movie-index-content box">
                        <span class="stonefont">${book1.bookBorrowingNumber}</span><span class="unit">次</span>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<div class="container" id="app">
    <div class="main-content-container clearfix">
        <div class="main-content">
            <div class="tab-container">
                <div class="tab-title-container clearfix">
                    <div class="tab-title active" data-act="tab-desc-click">介绍</div>
                 </div>
                <div class="tab-content-container">
                    <div class="tab-desc tab-content active" data-val="">

                        <div class="module">
                            <div class="mod-title">
                                <h3>内容简介</h3>
                            </div>
                            <div class="mod-content">
                                <span class="dra">${book1.bookDescription}</span>

                            </div>
                        </div>




                        <div class="module">
                            <div class="mod-title">
                                <h3>热门短评</h3>
                            </div>
                            <div class="mod-content">
                                <div class="comment-list-container" data-hot="10">

                                    <ul>
                                        <c:forEach items="${list}" var="c">
                                        <li class="comment-container " data-val="">
                                            <div class="main">
                                                <div class="main-header clearfix">
                                                    <div class="user">
                                                        <span class="name">${c.user_id}</span>
                                                        <span class="tag">读</span>
                                                    </div>
                                                    <div class="time" >
                                                        <span ><fmt:formatDate value="${c.comment_time}" type="both"/></span>
                                                        <ul class="score-star clearfix" data-score="10">
                                                           <c:if test="${c.comment_state==1}">
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left "></i><i class="half-star right "></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left "></i><i class="half-star right "></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left "></i><i class="half-star right "></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left "></i><i class="half-star right "></i>    </li>
                                                               <li>
                                                           </c:if>
                                                               <c:if test="${c.comment_state==2}">
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left "></i><i class="half-star right "></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left "></i><i class="half-star right "></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left "></i><i class="half-star right "></i>    </li>
                                                               <li>
                                                                   </c:if>
                                                                       <c:if test="${c.comment_state==3}">
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left "></i><i class="half-star right "></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left "></i><i class="half-star right "></i>    </li>
                                                               <li>
                                                                   </c:if>
                                                                       <c:if test="${c.comment_state==4}">
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left "></i><i class="half-star right "></i>    </li>
                                                               <li>
                                                                   </c:if>
                                                                       <c:if test="${c.comment_state==5}">
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                               <li>
                                                                   <i class="half-star left active"></i><i class="half-star right active"></i>    </li>
                                                               <li>
                                                                   </c:if>


                                                        </ul>

                                                    </div>
                                                    <div class="approve " data-id="1051001593">
                                                        <i data-act="comment-approve-click" class="approve-icon"></i><span class="num">
                                                            ${c.comment_great_number}
                          </span>
                                                    </div>
                                                </div>
                                                <div class="comment-content">${c.comment_content}
                                                    <div style="margin-left: 90%"><img src="<%=path%>/images/com.jpg" alt="" width="25" height="18" style="cursor:pointer" onclick="showCom(${c.comment_id})" ><span class="num">
                                                            ${c.comment_great_number}
                                                    </span></div>
                                                </div>

                                            </div>

                                            <c:forEach items="${huiFuList}" var="hf" >
                                                <c:if test="${c.comment_id==hf.parent_comment_id}">
                                                          <div class="${c.comment_id}" style="margin-left: 18%;display: none" >
                                                            <div class="main-header clearfix">
                                                                <div class="user">
                                                                    <span class="name" style="font-size: 13px ">用户&nbsp;${hf.user_id}&nbsp;回复:</span>
                                                                    <span class="tag">回</span>
                                                                </div>
                                                            </div>
                                                            <div class="comment-content">${hf.comment_content}</div>
                                                         </div>

                                                </c:if>
                                            </c:forEach>
                                        </li>
                                        </c:forEach>


                                    </ul>
                                </div>
                                <a class="comment-entry" data-act="comment-no-content-click">写短评</a>

                            </div>
                        </div>
                    </div>

                    <div class="tab-award tab-content" data-val="{tabtype:'award'}">
                    </div>

                </div>
            </div>
        </div>
        <div class="related">

            <div class="module">
                <div class="mod-title">
                    <h3>相关电影</h3>
                </div>
                <div class="mod-content">
                    <div class="related-movies">
                        <dl class="movie-list">
                            <dd>
                                <div class="movie-item">
                                    <a href="https://maoyan.com/films/1250634" target="_blank" data-act="movie-click" data-val="{movieid:1250634}">
                                        <div class="movie-poster">
                                            <img class="poster-default" src="https://s0.meituan.net/bs/?f=myfe/mywww:/image/loading_2.e3d934bf.png">
                                            <img src="https://p1.meituan.net/movie/ee58fe45d4c9b8a6745348458663225a3604840.jpg@106w_145h_1e_1c">
                                        </div>
                                    </a>
                                    <div class="movie-ver"></div>
                                </div>
                                <div class="channel-detail movie-item-title" title="如珠如宝的人生">
                                    <a href="https://maoyan.com/films/1250634" target="_blank" data-act="movies-click" data-val="{movieId:1250634}">如珠如宝的人生</a>
                                </div>
                                <div class="channel-detail channel-detail-orange">暂无评分</div>

                            </dd><dd>
                            <div class="movie-item">
                                <a href="https://maoyan.com/films/343455" target="_blank" data-act="movie-click" data-val="{movieid:343455}">
                                    <div class="movie-poster">
                                        <img class="poster-default" src="https://s0.meituan.net/bs/?f=myfe/mywww:/image/loading_2.e3d934bf.png">
                                        <img src="https://p0.meituan.net/movie/c9ab3960cb0ce3b3ffdf7f71fb88d9532170517.jpg@106w_145h_1e_1c">
                                    </div>
                                </a>
                                <div class="movie-ver"></div>
                            </div>
                            <div class="channel-detail movie-item-title" title="五十米之恋">
                                <a href="https://maoyan.com/films/343455" target="_blank" data-act="movies-click" data-val="{movieId:343455}">五十米之恋</a>
                            </div>
                            <div class="channel-detail channel-detail-orange">暂无评分</div>

                        </dd><dd>
                            <div class="movie-item">
                                <a href="https://maoyan.com/films/1240159" target="_blank" data-act="movie-click" data-val="{movieid:1240159}">
                                    <div class="movie-poster">
                                        <img class="poster-default" src="https://s0.meituan.net/bs/?f=myfe/mywww:/image/loading_2.e3d934bf.png">
                                        <img src="https://p1.meituan.net/movie/a596474c1c29118d908d1eff0fd4293f1017066.jpg@106w_145h_1e_1c">
                                    </div>
                                </a>
                                <div class="movie-ver"></div>
                            </div>
                            <div class="channel-detail movie-item-title" title="来电狂响">
                                <a href="https://maoyan.com/films/1240159" target="_blank" data-act="movies-click" data-val="{movieId:1240159}">来电狂响</a>
                            </div>
                            <div class="channel-detail channel-detail-orange"><i class="integer">8.</i><i class="fraction">6</i></div>

                        </dd><dd>
                            <div class="movie-item">
                                <a href="https://maoyan.com/films/1200486" target="_blank" data-act="movie-click" data-val="{movieid:1200486}">
                                    <div class="movie-poster">
                                        <img class="poster-default" src="https://s0.meituan.net/bs/?f=myfe/mywww:/image/loading_2.e3d934bf.png">
                                        <img src="https://p0.meituan.net/movie/238e2dc36beae55a71cabfc14069fe78236351.jpg@106w_145h_1e_1c">
                                    </div>
                                </a>
                                <div class="movie-ver"></div>
                            </div>
                            <div class="channel-detail movie-item-title" title="我不是药神">
                                <a href="https://maoyan.com/films/1200486" target="_blank" data-act="movies-click" data-val="{movieId:1200486}">我不是药神</a>
                            </div>
                            <div class="channel-detail channel-detail-orange"><i class="integer">9.</i><i class="fraction">6</i></div>

                        </dd><dd>
                            <div class="movie-item">
                                <a href="https://maoyan.com/films/344649" target="_blank" data-act="movie-click" data-val="{movieid:344649}">
                                    <div class="movie-poster">
                                        <img class="poster-default" src="https://s0.meituan.net/bs/?f=myfe/mywww:/image/loading_2.e3d934bf.png">
                                        <img src="https://p1.meituan.net/movie/19efcfbf1a98c02cb5efd69a2edf766e2421917.jpg@106w_145h_1e_1c">
                                    </div>
                                </a>
                                <div class="movie-ver"></div>
                            </div>
                            <div class="channel-detail movie-item-title" title="天气预爆">
                                <a href="https://maoyan.com/films/344649" target="_blank" data-act="movies-click" data-val="{movieId:344649}">天气预爆</a>
                            </div>
                            <div class="channel-detail channel-detail-orange"><i class="integer">6.</i><i class="fraction">6</i></div>

                        </dd><dd>
                            <div class="movie-item">
                                <a href="https://maoyan.com/films/1212192" target="_blank" data-act="movie-click" data-val="{movieid:1212192}">
                                    <div class="movie-poster">
                                        <img class="poster-default" src="https://s0.meituan.net/bs/?f=myfe/mywww:/image/loading_2.e3d934bf.png">
                                        <img src="https://p0.meituan.net/movie/6674a3e556f559f72167646aad3ac3611602818.jpg@106w_145h_1e_1c">
                                    </div>
                                </a>
                                <div class="movie-ver"></div>
                            </div>
                            <div class="channel-detail movie-item-title" title="差等生乔曦">
                                <a href="https://maoyan.com/films/1212192" target="_blank" data-act="movies-click" data-val="{movieId:1212192}">差等生乔曦</a>
                            </div>
                            <div class="channel-detail channel-detail-orange">暂无评分</div>

                        </dd></dl>

                    </div>


                </div>
            </div>
        </div>
    </div>

</div>






<div id="qb-sougou-search" style="display: none; opacity: 0;"><p>搜索</p><p class="last-btn">复制</p><iframe src="cid:frame-791-b25072f1-9bdf-4eb6-9b61-63a7bebcac16@mhtml.blink"></iframe></div></body></html>
