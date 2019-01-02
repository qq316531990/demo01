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
    <script src="../js/jquery-1.8.2.min.js"></script>
    <script>
        $(function(){
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
            var type_id=getUrl("type_id");
            $.ajax({
                url:'<%=path%>/type/getTypeByTypeId',
                data:{"type_id":type_id},
                dataType:'json',
                success:function(data){
                    loadData(data)
                }
            });


        });
        function  loadData(data){
            $("#type_id").val(data.type_id);
            $("#type_name").val(data.type_name);
             }





    </script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改内容</strong></div>
    <div class="body-content">
        <div method="post" class="form-x" >
            <div class="form-group">
                <div class="label">
                    <label>分类名</label>
                </div>
                <div class="field">
                    <input type="hidden"  id="type_id" name="type_id">
                    <input type="text" class="input w50" value="" name="type_name" id="type_name" data-validate="required:请输入分类名" />
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" id="updateType" name="updateType"> 提交</button>
                </div>
            </div>

        </div>
    </div>

</div>
<script type="text/javascript" src="/demo01/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">

    $('#updateType').click(function(){
        var type_id =$("#type_id").val();
        var type_name =$("#type_name").val();
        if(type_name==""){
            alert("分类名不能为空！")
            return false;
        }
        else {
            $.ajax({
                type: 'post',
                url: '<%=path %>/type/updateType',
                dataType: "json",
                async: true,
                data: {type_name:type_name,type_id:type_id},
                success: function (data) {
                    if (data === 1) {
                        alert("修改成功");
                        window.location.href = "type_manager.jsp";

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