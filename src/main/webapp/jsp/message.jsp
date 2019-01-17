<%@ page language="java"  pageEncoding="UTF-8"%>
<!-- 导入jstl标准标签库的核心标签：c标签 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 格式化标签 -->
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="../sourceCss.jsp" %>
    <style>

        .choose{
            width :20%;
            height:4%;
        }
        .aa{
            width:85%;
            display:inline-block;
            margin-top:0;
            position:fixed;
        }
        .navbar{
            border-radius:0;
        }
        .table td{
            vertical-align: middle;
            white-space:nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 200px;
        }
        .table td:last-child{
            text-align:center;
        }
        .btn-group{
            margin-bottom:10px;
        }
        textarea{
            resize:none;/*禁止改变大小*/
        }
        dl>dt,dl>dd{
            padding:5px 0;
        }
    </style>
</head>
<body>
<div class="modal animated bounceIn" id="messageInfo">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4>消息详情</h4>
                </div>
                <div class="modal-body">
                    <dl class="dl-horizontal">
                        <dt>消息序号</dt>
                        <dd id="d1"></dd>
                        <dt>用户名:</dt>
                        <dd id="d2"></dd>
                        <dt>消息内容</dt>
                        <dd id="d3"></dd>
                        <dt>消息类型:</dt>
                        <dd id="d4"></dd>
                        <dt>消息时间:</dt>
                        <dd id="d5"></dd>
                        <dt>消息状态:</dt>
                        <dd id="d6"></dd>
                        <dt>关联图书:</dt>
                        <dd id="d7"></dd>

                    </dl>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>

</div>

<div class="aa">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="" class="navbar-brand">消息管理</a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#userInfo">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse" id="userInfo">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎你，${userLogin.user_name}<span class="caret"></span></a>
                        <ul class="dropdown-menu">

                            <li><a href="javascript:void(0)" id="logout">安全退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- 	内容区 -->
    <div class="container-fluid">
        <!-- 		路径导航 -->
        <ol class="breadcrumb">
            <li><a href="#">消息管理</a></li>
            <li class="active">消息列表</li>
        </ol>

        <!-- 		按钮组 -->
        <%--<div class="btn-group">--%>
            <%--<button class="btn btn-primary"  data-toggle="modal" data-target="#messageAdd"><span class="glyphicon glyphicon-cloud-upload"></span>添加图书</button>--%>
            <%--<!-- 			用户禁止删除操作 -->--%>
            <%--<button class="btn btn-danger volumeDel" type="submit"><span class="glyphicon glyphicon-remove"></span>批量删除</button>--%>

            <%--<button class="btn btn-primary"  data-toggle="modal" data-target="#messageSelect"><span class="glyphicon glyphicon-cloud-upload"></span>查找图书</button>--%>
        <%--</div>--%>
        <form action="/demo01/message/selectMessageForManege?tab=1" class="form-inline" id="" method="post">
            <div class="form-group">
                <label for="exampleInputName2">用户ID</label>
                <input type="text" name="userId" class="form-control" id="exampleInputName2" placeholder="1">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">图书ID</label>
                <input type="text" name="bookId" class="form-control" id="exampleInputEmail2" placeholder="1">
            </div>
            <button type="submit" class="btn btn-default">查找</button>

        </form>
        <br /><br />
        <div class="data-container">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <%--<th><input type="checkbox" id="selectAll"/></th>--%>

                    <th>消息序号</th>
                    <th>用户名</th>
                    <th>消息内容</th>
                    <th>消息类型</th>
                    <th>消息时间</th>
                    <th>消息状态</th>
                    <th>关联图书</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pu.list}" var="messageAdmin" >
                    <tr>
                        <%--<td><input type="checkbox" name="ids" value="${messageAdmin.messageId}"/></td>--%>
                        <td title="${messageAdmin.messageId}">${messageAdmin.messageId}</td>
                        <td title="${messageAdmin.userName}">${messageAdmin.userName}</td>
                        <td title="${messageAdmin.messageContent}">${messageAdmin.messageContent}</td>
                        <td>
                            <c:if test="${messageAdmin.messageType==1}">借阅消息</c:if>
                            <c:if test="${messageAdmin.messageType==0}">预约消息</c:if>
                            <c:if test="${messageAdmin.messageType==2}">还书提醒消息</c:if>
                            <c:if test="${messageAdmin.messageType==3}">超时消息</c:if>
                            <c:if test="${messageAdmin.messageType==4}">评论消息</c:if>
                        </td>
                        <td title="${messageAdmin.messageTime}"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${messageAdmin.messageTime}"/></td>
                        <td>
                            <c:if test="${messageAdmin.messageState==1}">已读</c:if>
                            <c:if test="${messageAdmin.messageState==0}">未读</c:if>
                        <td title="${messageAdmin.bookName}">${messageAdmin.bookName}</td>
                        <td>
                            <button class="btn btn-primary btn-sm btnInfo" data-message-id="${messageAdmin}" data-toggle="modal" data-target="#messageInfo"><span class="glyphicon glyphicon-info-sign"></span>详情</button>

                        </td>
                    </tr>
                </c:forEach>
            </table>
            <%--分页标签 -->--%>
            <div class="text-right">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${pu.currentPage == 1}">
                            <li class="disabled"><a href="#"><span>&laquo;</span></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/demo01/message/selectMessageForManege?cp=${pu.prev}"><span>&laquo;</span></a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach begin="${pu.start}" end="${pu.end}"  var="i">
                        <c:choose>
                            <c:when test="${i == pu.currentPage}">
                                <li class="active"><a href="#">${i}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/demo01/message/selectMessageForManege?cp=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${pu.currentPage == pu.last}">
                            <li class="disabled"><a href="#"><span>&raquo;</span></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/demo01/message/selectMessageForManege?cp=${pu.next}"><span>&raquo;</span></a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
</div>

<%@ include file="../sourceJs.jsp" %>

<script>


    $('.btnInfo').on('click',function(){
        var tr = $(this).parents('tr');
        $('#d1').text($(tr).find('td').eq(0).text());
        $('#d2').text($(tr).find('td').eq(1).text());
        $('#d3').text($(tr).find('td').eq(2).text());
        $('#d4').text($(tr).find('td').eq(3).text());
        $('#d5').text($(tr).find('td').eq(4).text());
        $('#d6').text($(tr).find('td').eq(5).text());
        $('#d7').text($(tr).find('td').eq(6).text());
        // $('#d4').text($(tr).find('td').eq(5).text());
    });

</script>

</body>
</html>
