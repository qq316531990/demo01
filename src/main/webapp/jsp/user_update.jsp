<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link rel="stylesheet" href="/demo01/css/pintuer.css">
    <link rel="stylesheet" href="/demo01/css/admin.css">
    <link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<%=path%>/css/carousel.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>
        window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')
    </script>
    <script src="<%=path%>/asserts/js/vendor/popper.min.js"></script>
    <script src="<%=path%>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script>
        $(function(){
            getType();
            function getUrl(name)
            {
                var query=window.location.search.substring(1);
                var varr=query.split("&");
                 for (var i=0;i<varr.length;i++) {
                    var pare = varr[i].split("=");
                    if(pare[0] == name){return pare[1];}
                }
                return(false);
            }
            var user_id=getUrl("user_id");
            $.ajax({
                url:'<%=path%>/user/getUserByUserId',
                data:{"user_id":user_id},
                dataType:'json',
                success:function(data){
                   loadData(data)
                }
            });


        });
        function  loadData(data){
            $("#user_id").val(data.user_id);
            $("#user_name").val(data.user_name);
            $("#phone").val(data.phone);
            $("#permission_id").val(data.permission_id);
            $("#credibility").val(data.credibility);
            $("#balance").val(data.balance);
            $("#sex").val(data.sex);
        }


        function getType(){
            $.ajax({
                url:'<%=path%>/second/getTypesForUser',
                data:{},
                dataType:'json',
                success:function(data){
                }
            });


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
                    <li class="dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"> ${type.type_name} <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" style=" background-color:#5a5a5a;">
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
<div class="panel admin-panel" style="margin-top: 4%">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>个人信息</strong></div>
    <div class="body-content" style="margin-left: 35%">
        <div method="post" class="form-x" >
            <div class="form-group">
                <div class="label">
                    <label>用户卡号</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="user_id" id="user_id" disabled="disabled" />
                    <div class="tips"></div>
                </div>
            </div>
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
                    <label>信用分</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"  value="" id="credibility" name="credibility" disabled="disabled"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>等级</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"  value="" id="permission_id" name="permission_id" disabled="disabled" />
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>余额</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"  value="" id="balance" name="balance"  disabled="disabled"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>性别</label>
                </div>
                <div class="field">
                    <select name="sex" id="sex" class="input w50">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" id="updateUser" name="updateUser"> 提交</button>
                </div>
            </div>



        </div>
    </div>

</div>
<script type="text/javascript" src="/demo01/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">

    $('#updateUser').click(function(){
        var user_id =$("#user_id").val();
        var user_name =$("#user_name").val();
        var phone =$("#phone").val();
        var reg = /^1[0-9]{10}$/;
         var sex=$("#sex").val();
        if(!reg.test(phone)){
            alert("手机号应为1开头的11位数字！");
            return false;

        }
        else {
            $.ajax({
                type: 'post',
                url: '<%=path %>/user/updateUser',
                dataType: "json",
                async: true,
                data: {phone: phone,user_name:user_name,sex:sex,user_id:user_id},
                success: function (data) {
                    if (data === 1) {
                        alert("修改成功");
                        window.location.href = "user_index.jsp";
                    } else {
                        alert("修改失败！");
                    }
                }
            });
        }
    });
</script>
</body>
</html>