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
    <link rel="stylesheet" href="<%=path%>/css/Comment.css">

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/pintuer.js"></script>
    <script src="../js/jquery-1.8.2.min.js"></script>

    <style type="text/css">
        *{
            padding: 0px;
            margin: 0px;
        }

    </style>
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
          <%--  <th>评论id</th>--%>
            <th style='width: 100px'>书名</th>
           <%-- <th>书名</th>--%>
            <th>评论内容</th>
            <th>回复时间</th>
            <th>点赞数量</th>
            <th>图书星级</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${plList}" var="pl">
        <tbody id="tbody">

            <tr>
                <td>
                    <input type="checkbox" name="id[]" value="${pl.comment_id}" />
                </td>
                <td>${pl.book_name}</td>
                <td>${pl.comment_content}</td>
                <td><f:formatDate value="${pl.comment_time}" pattern="yyyy-MM-dd HH:mm:ss"></f:formatDate></td>
                <td>${pl.comment_great_number}</td>
                <td>${pl.comment_state}</td>
                <td>
                    <div class="button-group">
                        <a class="button border-red" href="javascript:void(0)" onclick="del(${pl.comment_id})"><span class="icon-trash-o"></span> 删除</a>
                        <a class="button border-red" href="javascript:void(0)" data-toggle="modal" data-target="#myModal" onclick="com_id_xg(${pl.comment_id})"><span class="icon-trash-o"></span> 修改</a>
                    </div>

                </td>
            </tr>
        </tbody>

        </c:forEach>
    </table>

</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">

                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改评论
                </h4>
            </div>
            <div class="modal-body">
                <div class="col-md-5 p-lg-5 mx-auto my-5" style="width: 320px">
                    <div class="rating-stars block">
                        <div class="rating-stars-container">
                            <div class="rating-star">
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="rating-star">
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="rating-star">
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="rating-star">
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="rating-star">
                                <i class="fa fa-star"></i>
                            </div>
                        </div>
                        <input type="number" readonly class="form-control rating-value" name="rating-stars-value" id="rating-stars-value" style="width: 50px">
                    </div>
                </div>
                <input type="hidden" id="comm_id_xg" value="">
                <textarea name="comment_content1" id="comment_content1" cols="40" rows="5" style="font-size: 18px"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="update()">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.rating-stars.min.js"></script>
<script type="text/javascript">

    function tiaoZhuan() {
        window.location.href='<%=path %>/second/getTypesForUser';
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
            window.location.href='<%=path %>/comment/plList?user_id=${userLogin.user_id}';
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
            window.location.href='<%=path %>/comment/plList?user_id=${userLogin.user_id}';

        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }


    var ratingOptions = {
        selectors: {
            starsSelector: '.rating-stars',
            starSelector: '.rating-star',
            starActiveClass: 'is--active',
            starHoverClass: 'is--hover',
            starNoHoverClass: 'is--no-hover',
            targetFormElementSelector: '.rating-value'
        }
    };
    $(".rating-stars").ratingStars(ratingOptions);


    $("#myModal").modal("hide");
    function com_id_xg(comment_id) {
        $("#comm_id_xg").val(comment_id);
    }

    function update() {
        var comment_id;
        var comment_content;
        var comment_state;
        comment_id=$("#comm_id_xg").val();
        comment_content=$('#comment_content1').val();
        comment_state=$('#rating-stars-value').val();
        $.ajax({
            type:'post',
            url:'<%=path %>/comment/update',
            dataType:'json',
            async: true,
            data:{comment_id:comment_id,comment_content:comment_content,comment_state:comment_state},
        });
        alert("修改成功");
        window.location.href='<%=path%>/comment/plList?user_id=${userLogin.user_id}';
    }
</script>
</body></html>