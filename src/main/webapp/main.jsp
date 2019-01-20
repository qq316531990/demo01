<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 导入jstl标准标签库的核心标签：c标签 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 格式化标签 -->
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<a href="book/selectBook" title="" target="mainCont">图书管理</a>
<a href="message/selectMessageForUser" title="" target="mainCont">我的消息</a>
<a href="message/selectMessageForManege" title="" target="mainCont">消息管理</a>
<%--<a href="book/selectBookToUser" title="" target="mainCont">用户首页</a>--%>

<%--<!-- 	内容区 -->--%>
<%--<div class="container-fluid">--%>
    <%--<!-- 		数据库区 -->--%>
    <%--<div class="data-container">--%>
        <%--<table class="table table-striped table-bordered table-hover">--%>
            <%--<tr>--%>
                <%--<th><input type="checkbox" id="selectAll"/></th>--%>

                <%--<th>图书序号</th>--%>
                <%--<th>书籍名称</th>--%>
                <%--<th>作者</th>--%>
                <%--<th>版号</th>--%>
                <%--<th>图书数量</th>--%>
                <%--<th>图书简介</th>--%>
                <%--<th>图片</th>--%>
                <%--<th>上下架</th>--%>
                <%--<th>价格</th>--%>
                <%--<th>借阅量</th>--%>
                <%--<th>总星星数</th>--%>
                <%--<th>评论人数</th>--%>
            <%--</tr>--%>
            <%--<c:forEach items="${list1}" var="book" >--%>
                <%--<tr>--%>
                    <%--<td><input type="checkbox" name="ids" value="${book.bookId}"/></td>--%>
                    <%--<td title="${book.bookId}">${book.bookId}</td>--%>
                    <%--<td title="${book.bookName}">${book.bookName}</td>--%>
                    <%--<td title="${book.bookAuthor}">${book.bookAuthor}</td>--%>
                    <%--<td title="${book.bookPublishedInformation}">${book.bookPublishedInformation}</td>--%>
                    <%--<td title="${book.bookCount}">${book.bookCount}</td>--%>
                    <%--<td title="${book.bookDescription}">${book.bookDescription}</td>--%>
                    <%--<td title="${book.bookImage}">${book.bookImage}</td>--%>
                    <%--<td title="${book.bookTag}">${book.bookTag}</td>--%>
                    <%--<td title="${book.bookPrice}">${book.bookPrice}</td>--%>
                    <%--<td title="${book.bookBorrowingNumber}">${book.bookBorrowingNumber}</td>--%>
                    <%--<td title="${book.bookStar}">${book.bookStar}</td>--%>
                    <%--<td title="${book.bookCommentNumber}">${book.bookCommentNumber}</td>--%>
                    <%--<td>--%>
                        <%--<button class="btn btn-primary btn-sm btnInfo" data-book-id="${book}" data-toggle="modal" data-target="#bookInfo"><span class="glyphicon glyphicon-info-sign"></span>详情</button>--%>
                        <%--<button class="btn btn-info btn-sm btnEdit" data-book-id="${book}" data-toggle="modal" data-target="#bookEdit"><span class="glyphicon glyphicon-edit"></span>修改</button>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
        <%--</table>--%>
    <%--</div>--%>
<%--</div>--%>
</body>
</html>