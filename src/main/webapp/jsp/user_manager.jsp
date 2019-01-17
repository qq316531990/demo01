<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
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

        //获取数据的方法
        function getData(currPage,pageSize){
            var user_name="%"+$("#user_name").val()+"%";
             $.ajax({
                url:'<%=path%>/user/listUsers',
                data:{"user_name":user_name,"currPage":currPage,"pageSize":pageSize},
                dataType:'json',
                success:function(data){
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
                var check_id=i+1;
                var $checkbox=$('<td><input type="checkbox" name="id[]" value="'+list[i].user_id+'" id="'+check_id+'"/></td>');
                var $user_id=$('<td>'+list[i].user_id+'</td>');
                var $user_name=$("<td style='width: 100px'>"+list[i].user_name+"</td>");
                var $phone=$("<td>"+list[i].phone+"</td>");
                var $sex=$("<td>"+list[i].sex+"</td>");
                var $credibility=$("<td>"+list[i].credibility+"</td>");
                var $balance=$("<td>"+list[i].balance+"</td>");
                var $do=$('<td><div class="button-group"> <a class="button border-main" href="user_edit.jsp?user_id='+list[i].user_id+'"><span class="icon-edit"></span> 修改</a> <a class="button border-red" href="javascript:void(0)" onclick="return del('+list[i].user_id+')"><span class="icon-trash-o"></span> 删除</a> </div></td>\n');
                var $tr=$("<tr></tr>").append($checkbox).append($user_id).append($user_name).append($phone).append($sex).append($credibility).append($balance).append($do);
                $("#tbody").append($tr);
            }

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
        <div class="panel-head"><strong class="icon-reorder"> 用户管理</strong></div>
        <div class="padding border-bottom">


            <ul class="search">
                <li>
                    <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
                    <button  class="button border-red" onclick="javascript:DelSelect()"><span class="icon-trash-o"  ></span> 批量删除</button>
                </li>
                <li>
                    <button type="button" class="button border-yellow" onclick="window.location.href='user_add.jsp'"><span class="icon-plus-square-o"></span> 添加用户</button>
                </li>

                <li>
                    <input type="text" placeholder="请输入用户名或者电话号码" id="user_name" class="input" style="width:250px; line-height:17px;display:inline-block" />
                    <a href="javascript:void(0)" class="button border-main icon-search" onclick="javascript:getData(1,5)" > 搜索</a>
                </li>
                 </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="120" >ID</th>
                <th>id</th>
                <th style='width: 100px'>用户名</th>
                <th>电话</th>
                <th>性别</th>
                <th >信用分</th>
                <th >余额</th>
                <th>操作</th>
            </tr>
            <tbody id="tbody">
            <tr>
                <td><input type="checkbox" name="id[]" value="1" />
                    1</td>
                <td>lalal</td>
                <td>lalal</td>
                <td>lalal</td>
                <td>lalal</td>
                <td>lalal</td>
                <td>lalal</td>
                <td><div class="button-group"> <a class="button border-main" href=""><span class="icon-edit"></span> 修改</a> <a class="button border-red" href="javascript:void(0)" ><span class="icon-trash-o"></span> 删除</a> </div></td>
            </tr>

            </tbody>
            <tr>
                <td colspan="8"><div class="pagelist" id="nav"> <a href ="#" onclick ="pre()">上一页</a> <a href ="#" onclick ="go(1)" >1</a><a href ="#" onclick ="go(2)" >2</a><a href ="#" onclick ="go(3)">3</a><a href ="#" onclick ="next()">下一页</a>
                    共<span id="count"></span>条记录
                    当前第<span id="currPage"></span>页 </div></td>
            </tr>
        </table>
    </div>

<script type="text/javascript">

    function del(id){
        if(confirm("您确定要删除吗?")){
            alert(123);
            $.ajax({
                url:'../user/deleteUsers',
                data:{"user_id":id},
                dataType:'json',
                traditional: true,
                success:function (data) {
                    if(data===1){
                        alert("删除成功啦！");
                        window.location.href="user_manager.jsp";
                    }else{
                        alert("删除失败！");
                    }
                }
            });
        }
    }

    $("#checkall").click(function(){
        $("input[name='id[]']").each(function(){
            if (this.checked) {
                this.checked = false;

            }
            else {
                this.checked = true;
            }
        });
    })

    function DelSelect(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;

            }

        });
        if (Checkbox){

           var t=confirm("您确认要删除选中的内容吗？");
            if (t==false) return false;
            alert("开始进入ajax啦！");
            var checkID=[];
            var user_id=[];
            $("input[name='id[]']:checked").each(function(i){
                    checkID[i] = $(this).val();
                    user_id.push(checkID[i]);
                });
            alert(user_id);
            $.ajax({
               url:'../user/deleteUsers',
               data:{"user_id":user_id},
               dataType:'json',
               traditional: true,
                success:function (data) {
                  alert("成功传回来啦！");
                  if(data==1){
                      alert("终于删除成功啦！");
                      window.location.href="user_manager.jsp";
                  }else{
                      alert("删除失败！");
                  }

                }
            });

        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }

</script>
</body></html>