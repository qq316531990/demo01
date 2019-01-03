<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28/028
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 修改会员密码</strong></div>
    <div class="body-content">
        <form  class="form-x" >
            <div class="form-group">
                <input type="hidden" value="${userLogin.pwd}" id="hiddenPwd">
                <input type="hidden" value="${userLogin.user_id}" id="user_id">
                <div class="label">
                    <label >原始密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="mpass" name="mpass" size="50" placeholder="请输入原始密码" data-validate="required:请输入原始密码" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="newpass" id="newpass" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >确认新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="renewpass" id="renewpass" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致" />
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" id="updatePwd"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="/demo01/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('#updatePwd').click(function () {
            var hiddenPwd=$('#hiddenPwd').val();
            var mpass=$('#mpass').val();
            var newpass=$('#newpass').val();
            var renewpass=$('#renewpass').val();
            var user_id=$('#user_id').val();

            if(mpass==""){
                alert("原密码不能为空！");
                return false;
            }
            else if(newpass==""){
                alert("新密码不能为空！");
                return false;
            }
            else if(renewpass==""){
                alert("请重复输入新密码！");
                return false;
            }

            else if(hiddenPwd!=mpass){
                alert("原密码错误！");
                return false;
            }else{
                $.ajax({
                    type: 'post',
                    url: '<%=path %>/user/updateUser',
                    dataType: "json",
                    data: {user_id:user_id,pwd:renewpass},
                    success: function (data) {
                        if (data === 1) {
                            alert("修改成功,请重新登录！");
                            window.top.location.href = "<%=path%>/login.jsp";

                        } else {
                            alert("修改失败！");
                        }
                    }
                });


            }
        })

    });

</script>
</body>
</html>