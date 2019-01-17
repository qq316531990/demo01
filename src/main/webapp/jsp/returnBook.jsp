<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.nio.file.Path" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <script>
        $(function(){
            getData(1,5);
        });
        function getTime(date){
            var date=new Date(date);
            date=date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0"+date.getDate()).slice(-2);
            return date;

        }

        //获取数据的方法
        function getData(currPage,pageSize){
            if($("#user_id").val()==null||$("#user_id").val()=="") {
                var user_id=0;
            }
            else{
                var user_id=parseInt($("#user_id").val());
            }
              $.ajax({
                url:'<%=path%>/borrow/listBorrows',
                data:{"user_id":user_id,"currPage":currPage,"pageSize":pageSize},
                dataType:'json',
                success:function(data){
                    console.log(data);
                    loadData(data);
                }
            });
        }


        //填充数据的方法
        function  loadData(data){
            $("#count").text(data.count);
            $("#currPage").text(data.currPage);
            $("#tbody").empty();
            var list=data.data;
            for(var i=0;i<list.length;i++){
                var $borrow_id=$('<td>'+list[i].borrow_id+'</td>');
                var $user_id=$("<td >"+list[i].user_id+"</td>");
                var $user_name=$("<td >"+list[i].user_name+"</td>");
                var $book_name=$("<td >"+list[i].book_name+"</td>");
                var $book_price=$("<td >"+list[i].book_price+"</td>");
                var $lend_time=$("<td >"+getTime(list[i].lend_time)+"</td>");
                var $return_time=$("<td >"+getTime(list[i].return_time)+" \</td>");
                var $do=$('<td><div class="button-group"> <a class="button border-main" onclick="returnBook('+list[i].borrow_id+','+list[i].book_id+')"><span class="icon-edit"></span> 还书</a></div></td>\n');
                var $tr=$("<tr></tr>").append($borrow_id).append($user_id).append($user_name).append($book_name).append($book_price).append($lend_time).append($return_time).append($do);
                   $("#tbody").append($tr);
            }

        }
        function returnBook(borrow_id,book_id){

            $.ajax({
                url:'<%=path%>/borrow/returnBook',
                data:{"borrow_id":borrow_id,"book_id":book_id},
                dataType:'json',
                success:function(data){
                    if(data===1){
                        alert("还书成功");
                        var currPage=parseInt($("#currPage").text());
                        getData(currPage,5);
                        return false;
                    }else{
                        alert("还书失败!");
                    }
                }
            });
        }

        //上一页
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
        <div class="panel-head"><strong class="icon-reorder"> 还书</strong></div>
        <div class="padding border-bottom">


            <ul class="search">

                <li>

                    <input type="text" placeholder="请输入用户卡号" id="user_id" name="user_id" class="input" style="width:250px; line-height:17px;display:inline-block" />
                    <a  onclick="javascript:getData(1,5)" class="button border-main icon-search"  > 搜索</a>
                    </form>
                </li>
                 </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th >借阅id</th>
                <th >用户卡号</th>
                <th >用户名</th>
                <th >书名</th>
                <th>价格</th>
                <th>借阅时间</th>
                <th>应还时间</th>

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






</script>
</body></html>