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
    <link rel="stylesheet" href="/demo01/css/pintuer.css">
    <link rel="stylesheet" href="/demo01/css/admin.css">
    <script src="/demo01/js/jquery.js"></script>
    <script src="/demo01/js/pintuer.js"></script>

</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加分类</strong></div>
    <div class="body-content">
        <div method="post" class="form-x" >
            <div class="form-group">
                <div class="label">
                    <label>分类名</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="type_name" id="type_name" data-validate="required:请输入分类名" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" id="addType" name="addType"> 提交</button>
                </div>
            </div>

        </div>
    </div>

</div>
<script type="text/javascript" src="/demo01/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">

    $('#addType').click(function(){
         var type_name =$("#type_name").val();

            $.ajax({
                type: 'post',
                url: '<%=path %>/type/insertType',
                dataType: "json",
                async: true,
                data: {type_name:type_name},
                success: function (data) {
                    if (data === null) {
                        alert("添加成功");
                        window.location.href = "type_manager.jsp";

                    } else {
                        alert("该分类已存在！");
                    }
                }
            });


    });
</script>
</body>

</html>