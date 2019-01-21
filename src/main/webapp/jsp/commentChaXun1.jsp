<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
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
</head>
<body>

<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 评论管理</strong></div>
    <div class="padding border-bottom">

        <ul class="search">
            <li>
                <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
                <button  class="button border-red" onclick="javascript:DelSelect()"><span class="icon-trash-o"  ></span> 批量删除</button>
            </li>
            <li>
                <input type="button" class="button border-main icon-search" value="返回" onclick="tiaoZhuan()">
            </li>
        </ul>
    </div>
    <table class="table table-hover text-center">
        <tr>
            <th width="120"></th>
            <th>评论id</th>
            <th style='width: 100px'>用户id</th>
            <th>图书id</th>
            <th>评论内容</th>
            <th>回复时间</th>
            <th>点赞数量</th>
            <th>图书星级</th>
            <th>操作</th>
        </tr>
        <tbody id="tbody">
        <c:forEach items="${listOne}" var="o">
            <tr>
                <td>
                    <input type="checkbox" name="id[]" value="${o.comment_id}" />
                </td>
                <td>${o.comment_id}</td>
                <td>${o.user_id}</td>
                <td>${o.book_id}</td>
                <td>${o.comment_content}</td>
                <td><f:formatDate value="${o.comment_time}" pattern="yyyy-MM-dd HH:mm:ss"></f:formatDate></td>
                <td>${o.comment_great_number}</td>
                <td>${o.comment_state}</td>
                <td>
                    <div class="button-group">
                        <a class="button border-red" href="javascript:void(0)" onclick="del(${o.comment_id})"><span class="icon-trash-o"></span> 删除</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tr>
            <td colspan="8">
                <div class="pagelist" id="nav">
                    <a href="<%=path %>/comment/findOne?index=1">首页</a>
                    <c:if test="${index>1}">
                        <a href ="<%=path %>/comment/findOne?index=${index-1}">上一页</a>
                    </c:if>
                    <c:if test="${index<total}">
                        <a href ="<%=path %>/comment/findOne?index=${index+1}">下一页</a>
                        <a href ="<%=path %>/comment/findOne?index=${total}">末页</a>
                    </c:if>
                    共<span id="count">${total}</span>页记录
                    当前第<span id="currPage">${index}</span>页
                </div>
            </td>
        </tr>
    </table>
</div>

<script type="text/javascript">

    function tiaoZhuan() {
        window.location.href='<%=path %>/comment/find';
    }

    function del(comment_id) {
        if(confirm("确认删除？")){
            $.ajax({
                type:'post',
                url:'<%=path %>/comment/delete',
                dataType:'json',
                async: true,
                data:{comment_id:comment_id},
            });
            window.location.href='<%=path %>/comment/find';
        }
        return false;
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
            var checkID=[];
            var comment_id=[];
            $("input[name='id[]']:checked").each(function(i){
                checkID[i] = $(this).val();
                comment_id.push(checkID[i]);
            });
            $.ajax({
                url:'<%=path %>/comment/deleteComment',
                data:{"comment_id":comment_id},
                dataType:'json',
                traditional: true,
            });
            window.location.href="<%=path %>/comment/find";

        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }

</script>
</body></html>