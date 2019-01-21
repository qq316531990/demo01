<%--
  Created by IntelliJ IDEA.
  User: liuhj
  Date: 2019/1/17
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=path%>/css/Comment.css">

    <link type="text/css" rel="stylesheet" href="<%=path %>/css/dianZan.css"/>
    <link rel="stylesheet" href="<%=path %>/css/pingfen.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.11.0.min.js"></script>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.rating-stars.min.js"></script>
</head>
<body>

<div class="input">
    <div>
        <h2>发表评论</h2>
    </div>
    <div id="starRating">
        <p class="photo">
            <span><i class="high"></i><i class="nohigh"></i></span>
            <span><i class="high"></i><i class="nohigh"></i></span>
            <span><i class="high"></i><i class="nohigh"></i></span>
            <span><i class="high"></i><i class="nohigh"></i></span>
            <span><i class="high"></i><i class="nohigh"></i></span>
        </p>
        <p class="starNum">0.0分</p>
        <div>
            <form action="">
                <textarea name="comment_content" id="comment_content" cols="40" rows="5" style="font-size: 18px"></textarea>
            </form>
        </div>
        <div class="bottoms">
            <a class="garyBtn cancleStar">取消评分</a><a class="blueBtn sureStar">确认</a>
        </div>
    </div>
</div>

<script>
    /*发表评论时，打分*/
    $(function () {
        var starRating = 0;
        var user_id;
        var book_id;
        var comment_content;
        $('.photo span').on('mouseenter',function () {
            var index = $(this).index()+1;
            $(this).prevAll().find('.high').css('z-index',1)
            $(this).find('.high').css('z-index',1)
            $(this).nextAll().find('.high').css('z-index',0)
            $('.starNum').html((index*1).toFixed(1)+'分')
        })
        $('.photo').on('mouseleave',function () {
            $(this).find('.high').css('z-index',0)
            var count = starRating / 1
            if(count == 5) {
                $('.photo span').find('.high').css('z-index',1);
            } else {
                $('.photo span').eq(count).prevAll().find('.high').css('z-index',1);
            }
            $('.starNum').html(starRating.toFixed(1)+'分')
        })
        $('.photo span').on('click',function () {
            var index = $(this).index()+1;
            $(this).prevAll().find('.high').css('z-index',1)
            $(this).find('.high').css('z-index',1)
            starRating = index*1;
            $('.starNum').html(starRating.toFixed(1)+'分');
            /*alert('评分：'+(starRating.toFixed(1)+'分'))*/
        })
        //取消评分
        $('.cancleStar').on('click',function () {
            starRating = 0;
            $('.photo span').find('.high').css('z-index',0);
            $('.starNum').html(starRating.toFixed(1)+'分');
        })
        //确定评分
        $('.sureStar').on('click',function () {
            if(starRating===0) {
                alert('最低一颗星！');
            } else {
                alert('评分：'+(starRating.toFixed(1)+'分'));
                comment_content=$('#comment_content').val();
                user_id=${userLogin.user_id};
                book_id=${param.vo_book_id};
                $.ajax({
                    type:'post',
                    url:'<%=path %>/comment/add',
                    dataType:'json',
                    async: true,
                    data:{user_id: user_id, book_id: book_id,comment_content:comment_content,comment_state:starRating},
                });
                alert('发表成功');
                window.location.href='<%=path%>/borrow/listBorrowsForUsers?currPage=1';
            }
        })
    })
</script>

</body>
</html>
