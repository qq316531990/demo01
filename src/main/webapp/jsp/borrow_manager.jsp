<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.nio.file.Path" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/pintuer.js"></script>
    <script src="../js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">
    $(function(){
    getData(0,5);
    });
    //获取数据的方法
    function getData(currPage,pageSize){
    var bookName="%"+$("#bookName").val()+"%";
    $.ajax({
    url:'<%=path%>/book/selectBookForBorrow',
    data:{"bookName":bookName,"currPage":currPage,"pageSize":pageSize},
    dataType:'json',
    success:function(data){
        loadData(data);

    }

    });

    }

    function  loadData(data){
        $("#count").text(data.totalNum);
        $("#currPage").text(data.currentPage);
        $("#tbody").empty();
        var list=data.list;
        for(var i=0;i<list.length;i++){
            var $bookId=$('<td>'+list[i].bookId+'</td>');
            var $bookName=$('<td>'+list[i].bookName+'</td>');
            var $bookAuthor=$('<td>'+list[i].bookAuthor+'</td>');
            var $bookDescription=$('<td style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" >'+list[i].bookDescription+'</td>');
            var $bookImage=$(' <td ><img src="<%=path%>/images/upload/'+list[i].bookImage+'" STYLE="width:100px; height: 100px" alt=""></td>');
            var $bookCount=$('<td >'+list[i].bookCount+'</td>');
            var $bookPrice=$('<td >'+list[i].bookPrice+'</td>');
            var $do=$(' <td  class="borrow"><div class="button-group"> <a class="button border-main"  ><span class="icon-edit"></span>借阅</a> </div></td>');
            var $tr=$("<tr></tr>").append($bookId).append($bookName).append($bookAuthor).append($bookDescription).append($bookImage).append($bookCount).append($bookPrice).append($do);
            $("#tbody").append($tr);
        }

    }
    function pre(){
        var currPage=parseInt($("#currPage").text());
        getData(currPage-1,5);
    }

    //下一页
    function next(){
        var currPage=parseInt($("#currPage").text());
        getData(currPage+1,5);
    }
    function go(reg){
        $("#nav a").removeClass("current");
        $(this).addClass("current");
        getData(reg,5);
    }
    </script>

    </head>
<body>

    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 借阅信息管理</strong></div>

        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <input type="text" placeholder="请输入书名" id="bookName" name="bookName" class="input" style="width:250px; line-height:17px;display:inline-block"  value=""/>
                    <a onclick="javascript:getData(0,5)" href="javascript:void(0)" class="button border-main icon-search"  > 搜索</a>
                </li>
                 </ul>
        </div>
        <table class="table table-hover text-center" style="table-layout: fixed;">
            <tr>
                <th  >id</th>
                <th  >书名</th>
                <th>作者</th>
                <th >简介</th>
                <th >图片</th>
                <th>库存</th>
                <th>价格</th>
            </tr>
            <tbody id="tbody">
            </tbody>
            <tr>


                <td colspan="8"><div class="pagelist" id="nav"> <a href ="#" onclick ="pre()">上一页</a> <a href ="#" onclick ="go(1)" >1</a><a href ="#" onclick ="go(2)" >2</a><a href ="#" onclick ="go(3)">3</a><a href ="#" onclick ="next()">下一页</a>
                    共<span id="count"></span>条记录
                    当前第<span id="currPage"></span>页 </div></td>
            </tr>

        </table>

    </div>



<script type="text/javascript">
    $(".borrow").each(function () {
        $(this).click(function(){
            var count=$(this).prev().prev().text();
            var bookId=$(this).prev().prev().prev().prev().prev().prev().prev().text();
             if(count==0){
              alert("库存不足！");
            }else{
                window.location.href="<%=path %>/jsp/borrow_add.jsp?book_id="+bookId;
            }


        });

    })


    </script>
</body></html>