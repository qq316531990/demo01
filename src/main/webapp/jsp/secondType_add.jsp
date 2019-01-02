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
            getData();
        });

        //获取数据的方法
        function getData(){
             $.ajax({
                url:'<%=path%>/type/getAllType',
                data:{},
                dataType:'json',
                success:function(data){
                    loadData(data);
                }
            });
        }


        //填充数据的方法
        function  loadData(data){
            $("#type_id").empty();
            var list=data;
            for(var i=0;i<list.length;i++){
                var $type_name=$("<option value='"+list[i].type_id+"'>"+list[i].type_name+"</option>");
                 $("#type_id").append($type_name);
            }

        }

    </script>

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
                    <input type="text" class="input w50" value="" name="secondType_name" id="secondType_name" data-validate="required:请输入分类名" />
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>所属一级分类</label>
                </div>
                <div class="field">
                    <select name="type_id" id="type_id" class="input w50">

                    </select>
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
        var secondType_name =$("#secondType_name").val();
        var type_id=$("#type_id option:selected").val();

        $.ajax({
                type: 'post',
                url: '<%=path %>/second/insertType',
                dataType: "json",
                async: true,
                data: {secondType_name:secondType_name,type_id:type_id},
                success: function (data) {
                    if (data === null) {
                        alert("添加成功");
                        window.location.href = "secondType_manager.jsp";

                    } else {
                        alert("该分类已存在！");
                    }
                }
            });


    });
</script>
</body>

</html>