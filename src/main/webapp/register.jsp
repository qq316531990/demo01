<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>login</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/demo.css" />
<link href="<%=path %>/css/admin_login.css" rel="stylesheet" type="text/css"/>
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<%=path %>/css/component.css" />





 <script type="text/javascript">

	



 </script>
</head>
<body>

	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<p id="p01" style="font-size: 30px; font-family:'微软雅黑';margin-left: 50px">注册</p>


				        <div class="input_outer">
							<span class="u_user"></span> <input name="user_name "  id="user_name" class="text"
								style="color: #FFFFFF !important; font-size:20px; " type="text"
								placeholder="请输入用户名">
						</div>
					<div class="input_outer">
						<span class="u_user"></span> <input name="phone"  id="phone" class="text"
															style="color: #FFFFFF !important; font-size:20px; " type="text"
															placeholder="请输入手机号">
					</div>
							<div class="input_outer">
							<span class="us_uer"></span> <input name="pwd" id="pwd" class="text"
								style="color: #FFFFFF !important; font-size:20px; position:absolute; z-index:100;"
								value="" type="password" placeholder="请输入密码">
						</div>
						<div class="mb2">
							<button class="act-but submit"  id="register"
								style="color: #FFFFFF; width: 325px; height: 50px;" >提交</button>
						</div>
							
	

					</div>
			</div>
		</div>
	</div>
	<div style="text-align:center;">
		<!-- /container -->
		<script src="<%=path %>/js/login/TweenLite.min.js"></script>
		<script src="<%=path %>/js/login/EasePack.min.js"></script>
		<script src="<%=path %>/js/login/rAF.js"></script>
		<script src="<%=path %>/js/login/demo-1.js"></script>
		<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	</div>
	<script type="text/javascript">

		$('#register').click(function(){
			var phone =$("#phone").val();
			var user_name =$("#user_name").val();
			var pwd =$("#pwd").val();
			var reg = /^1[0-9]{10}$/;
            if(user_name===""){
				alert("用户名不能为空！");
				return false;
			}
			else if(phone===""){
				alert("手机号不能为空！");
				return false;
			}
			else if(!reg.test(phone)){
				alert("手机号应为1开头的11位数字！");
				return false;
			}
			else if(pwd===""){
				alert("密码不能为空！");
				return false;
			}
			else {
				$.ajax({
					type: 'post',
					url: '<%=path %>/user/register',
					dataType: "json",
					async: true,
					data: {phone: phone, pwd: pwd,user_name:user_name},
					success: function (data) {
						if (data === null) {
							alert("注册成功");
							window.location.href = "login.jsp";

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

