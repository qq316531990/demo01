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
            var secondType_id=getUrl("secondType_id");
            $.ajax({
                    url:'<%=path%>/type/getAllType',
                    data:{},
                    dataType:'json',
                    success:function(data){
                        $("#type_id").empty();
                        var list=data;
                        for(var i=0;i<list.length;i++){
                            var $type_name=$("<option value='"+list[i].type_id+"'>"+list[i].type_name+"</option>");
                            $("#type_id").append($type_name);
                        }
                    }
                });


            $.ajax({
                url:'<%=path%>/second/getTypeByTypeId',
                data:{"secondType_id":secondType_id},
                dataType:'json',
                success:function(data){
                    loadData(data)
                }
            });

        });
        function  loadData(data){
            $("#secondType_id").val(data.secondType_id);
            $("#secondType_name").val(data.secondType_name);
            $("#type_id").val(data.type_id);

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
                    <input type="hidden"  id="secondType_id" name="secondType_id">
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
                  <option value="">111</option>
                    </select>
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
        var secondType_id =$("#secondType_id").val();
        var secondType_name =$("#secondType_name").val();
        var type_id=$("#type_id option:selected").val();
        if(secondType_name==""){
            alert("分类名不能为空！")
            return false;
        }
        else {
            $.ajax({
                type: 'post',
                url: '<%=path %>/second/updateType',
                dataType: "json",
                async: true,
                data: {secondType_name:secondType_name,secondType_id:secondType_id,type_id:type_id},
                success: function (data) {
                    if (data === 1) {
                        alert("修改成功");
                        window.location.href = "secondType_manager.jsp";

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