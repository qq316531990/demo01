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
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
    <div class="body-content">
        <div method="post" class="form-x" >
        <div class="form-group">
                <div class="label">
                    <label>用户名</label>
        </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="user_name" id="user_name" data-validate="required:请输入用户名" />
                    <div class="tips"></div>
                </div>
            </div>
        <div class="form-group">
            <div class="label">
                <label>手机号</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" id="phone" value="" id="phone" name="phone" data-validate="required:请输入手机号" />
                <div class="tips"></div>
            </div>
        </div>
        <div class="form-group">
            <div class="label">
                <label>密码</label>
            </div>
            <div class="field">
                <input type="password" class="input w50" value="" id="pwd" name="pwd " data-validate="required:请输入密码" />
                <div class="tips"></div>
            </div>
        </div>
        <div class="form-group">
            <div class="label">
                <label>权限</label>
            </div>
            <div class="field">
                <select name="permission_id" id="permission_id" class="input w50">
                    <option value="1">普通用户</option>
                    <option value="5">管理员</option>
                 </select>
                <div class="tips"></div>
            </div>
        </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" id="addUser" name="addUser"> 提交</button>
                </div>
            </div>

        </div>
    </div>

</div>
<script type="text/javascript" src="/demo01/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
    $(function(){
    if('${msg}'){
        layer.msg('${msg}');
    }
    })
    $('#addUser').click(function(){
        var user_name =$("#user_name").val();
        var pwd =$("#pwd").val();
        var phone =$("#phone").val();
        var reg = /^1[0-9]{10}$/;
        var permission_id=$("#permission_id option:selected").val();
        if(!reg.test(phone)){
            alert("手机号应为1开头的11位数字！");
            return false;

        }

        else {
            $.ajax({
                type: 'post',
                url: '<%=path %>/user/register',
                dataType: "json",
                async: true,
                data: {phone: phone, pwd: pwd,user_name:user_name,permission_id:permission_id},
                success: function (data) {
                    if (data === null) {
                        alert("添加成功");
                        window.location.href = "user_manager.jsp";

                    } else {
                        alert("该用户名已被注册！");
                    }

                }
            });
        }

    });
</script>
</body>

</html>