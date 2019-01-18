<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  String path = request.getContextPath();

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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>借阅</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="">  
      <div class="form-group">
        <div class="label">
          <label>用户卡号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="user_id" id="user_id" data-validate="required:请输入卡号" />
          <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" id="addBorrow" name="addBorrow" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript" src="/demo01/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
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
   $('#addBorrow').click(function () {
     var book_id = getUrl("book_id");
     var user_id = parseInt($("#user_id").val());
     $.ajax({
       url: '<%=path%>/borrow/insertBorrow',
       data: {"book_id": book_id, "user_id": user_id},
       async: false,
       dataType: 'json',
       success: function (data) {
         if(data === -1){
           alert("卡号不存在！");
           return;
         } else
         {
           window.event.returnValue=false;
           window.location.href="<%=path%>/jsp/borrow_manager.jsp";
           alert("借阅成功!");
         }
       }
     });

   })
</script>


</body></html>