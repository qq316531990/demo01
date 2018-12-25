<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>无标题文档</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet" />
	<style type="text/css">
	<!--
	body {
		background-color: #FFFFFF;
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	body,td,th {
		color: #000000;
	}
	-->
	    </style>

  </head>

  <body>
  <table width="100%" border="0" height="88" border="1" >


		<tr>
			<td width="65%" height="84" align="center" valign="top" >

			</td>
		</tr>
		<tr><td height=2></td></tr>
	
	</table>
  </body>
</html>
