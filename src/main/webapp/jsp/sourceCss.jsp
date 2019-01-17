<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="<%=path %>/asserts/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path %>/asserts/bootstrapvalidator/css/bootstrapValidator.min.css" />
<link rel="stylesheet" href="<%=path %>/css/animate.css"/>