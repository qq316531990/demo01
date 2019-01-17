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
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
</head>
<body>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<p id="p01" style="font-size: 30px; font-family:'微软雅黑';margin-left: 50px">Wonders Library</p>
						<div class="input_outer">
							<span class="u_user"></span> <input name="user_name" id="user_name" class="text"
								style="color: #FFFFFF !important; font-size:20px; " type="text"
								placeholder="请输入用户名">
						</div>
						<div class="input_outer">
							<span class="us_uer"></span> <input name="pwd" class="text" id="pwd"
								style="color: #FFFFFF !important; font-size:20px; position:absolute; z-index:100;"
								value="" type="password" placeholder="请输入密码">
						</div>
						<div class="mb2">
							<button class="act-but submit" id="login"
								style="color: #FFFFFF; width: 325px; height: 50px;" >登录</button>
						              <a id="reg" style="color: #FFFFFF; width: 325px; height: 50px;  margin-left:43%; " href="<%=path %>/register.jsp" >去注册</a>
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
	</div>
	<script type="text/javascript">
	   $('#login').click(function(){
		   var user_name =$("#user_name").val();
		   var pwd =$("#pwd").val();
		   if(user_name===""){
			   alert("用户名不能为空！");
			   return false;
		   }
		   else if(pwd===""){
			   alert("密码不能为空！");
			   return false;
		   }
		   else {
			   $.ajax({
				   type: 'post',
				   url: '<%=path %>/user/login',
				   dataType: "json",
				   async: true,
				   data: {user_name: user_name, pwd: pwd},
				   success: function (data) {
					   if (data === null) {
						   alert("账号或密码错误！")
					   } else {
						   alert("登录成功")
						   if (data.permission_id==1){
							   window.location.href = "second/getTypesForUser" ;
						   }else{
							   window.location.href = "jsp/index.jsp" ;
						   }

					   }
				   }
			   });
		   }

		   });
   </script>

</body>
</html>

