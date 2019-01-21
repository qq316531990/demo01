<%@ page import="com.pojo.Type" %>
<%@ page import="com.controller.TypeController" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<!-- 导入jstl标准标签库的核心标签：c标签 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 格式化标签 -->
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="../sourceCss.jsp" %>
    <style>

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

<!-- 选择查询模态框 -->
<div class="modal animated fadeInUp" id="bookSelect">
    <form action="/demo01/book/selectBook" class="form-horizontal" id="bookSelectForm" method="get">
        <!-- 隐藏域用于请求后台指定的方法 -->
        <input type="hidden" name="tab" value="1"/>

        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4>输入条件</h4>
                    <button class="btn btn-primary" type="submit">全部图书</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">图书编号</label>
                        <div class="col-sm-8">
                            <textarea name="bookId"  rows="3" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">书籍名称</label>
                        <div class="col-sm-8">
                            <textarea name="bookName" rows="3" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">作者</label>
                        <div class="col-sm-8">
                            <textarea name="bookAuthor" rows="3" class="form-control" ></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">版号</label>
                        <div class="col-sm-8">
                            <textarea name="bookPublishedInformation" rows="3" class="form-control" ></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">图书数量</label>
                        <div class="col-sm-8">
                            <textarea name="bookCount" rows="3" class="form-control" ></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">上下架</label>
                        <div class="col-sm-8">
                            <textarea name="bookTag"  rows="3" class="form-control" ></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">价格</label>
                        <div class="col-sm-8">
                            <textarea name="bookPrice"  rows="3" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">借阅人数(最低)</label>
                        <div class="col-sm-8">
                            <textarea name="bookBorrowingNumber"  rows="3" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">评论星级</label>
                        <div class="col-sm-8">
                         <textarea name="bookStar"  rows="3" class="form-control"></textarea>
                        </div>
                     </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">评论人数</label>
                        <div class="col-sm-8">
                            <textarea name="bookCommentNumber"  rows="3" class="form-control"></textarea>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal">取消</button>
                    <button class="btn btn-primary" type="submit">提交</button>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- 添加图书模态框 -->
<div class="modal animated fadeInUp" id="bookAdd">
    <form action="/demo01/book/addBook" class="form-horizontal" id="bookAddForm" method="post" enctype="multipart/form-data">
        <!-- 隐藏域用于请求后台指定的方法 -->
        <%--<input type="hidden" name="add" />--%>
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4>添加图书</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">书籍名称</label>
                        <div class="col-sm-8">
                            <textarea name="bookName" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">作者</label>
                        <div class="col-sm-8">
                            <textarea name="bookAuthor" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">版号</label>
                        <div class="col-sm-8">
                            <textarea name="bookPublishedInformation" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">图书数量</label>
                        <div class="col-sm-8">
                            <textarea name="bookCount" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">图书简介</label>
                        <div class="col-sm-8">
                            <textarea name="bookDescription"  rows="3" class="form-control" required></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">图片</label>
                        <div class="col-sm-8">
                            选择文件:<input type="file" name="file"> 
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">上下架</label>
                        <input type="radio" name="bookTag" value="1" checked />上架
                        <input type="radio" name="bookTag" value="2"  />下架
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">价格</label>
                        <div class="col-sm-8">
                            <textarea name="bookPrice"  rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="control-label col-sm-2">分类</label>
                    <form id="form1" runat="server">
                        <div>
                            <select id="pro_c" name="pro_c" >
                                <option>---请选择---</option>
                            </select>
                            <select id="city_c" name="city_c">
                                <option>---请选择---</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal">取消</button>
                    <button class="btn btn-primary" type="submit">提交</button>
                </div>
            </div>
        </div>
    </form>

</div>



<!-- 图书详情模态框 -->
<div class="modal animated bounceIn" id="bookInfo">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4>图书详情</h4>
            </div>
            <div class="modal-body">
                <dl class="dl-horizontal">
                    <dt>图书序号:</dt>
                    <dd id="d1"></dd>
                    <dt>书籍名称:</dt>
                    <dd id="d2"></dd>
                    <dt>作者:</dt>
                    <dd id="d3"></dd>
                    <dt>版号:</dt>
                    <dd id="d4"></dd>
                    <dt>图书数量:</dt>
                    <dd id="d5"></dd>
                    <dt>图书简介:</dt>
                    <dd id="d6"></dd>

                    <dt>上下架:</dt>
                    <dd id="d8"></dd>
                    <dt>价格:</dt>
                    <dd id="d9"></dd>
                    <dt>借阅量:</dt>
                    <dd id="d10"></dd>
                    <dt>总星星数:</dt>
                    <dd id="d11"></dd>
                    <dt>评论人数:</dt>
                    <dd id="d12"></dd>
                </dl>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>




<!-- 图书修改模态框 -->
<div class="modal animated pulse" id="bookEdit">
    <form action="/demo01/book/updateBook" class="form-horizontal" id="bookUpdateForm" method="post">
        <!-- 		<input type="hidden" name="fid" value="" /> -->
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4>图书修改</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">图书序号</label>
                        <div class="col-sm-8">
                            <textarea name="bookId" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">图书名</label>
                        <div class="col-sm-8">
                            <textarea name="bookName" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">作者</label>
                        <div class="col-sm-8">
                            <textarea name="bookAuthor" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">版号</label>
                        <div class="col-sm-8">
                            <textarea name="bookPublishedInformation" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">图书数量</label>
                        <div class="col-sm-8">
                            <textarea name="bookCount" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">图书简介</label>
                        <div class="col-sm-8">
                            <textarea name="bookDescription" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="control-label col-sm-2">价格</label>
                        <div class="col-sm-8">
                            <textarea name="bookPrice" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal">取消</button>
                    <button class="btn btn-primary" type="submit">确认修改</button>
                </div>
            </div>
        </div>
    </form>
</div>



<!-- 	导航区 -->
<div class="aa">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="" class="navbar-brand">图书管理</a>
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
            <li><a href="#">图书管理</a></li>
            <li class="active">图书列表</li>
        </ol>

        <!-- 		按钮组 -->
        <div class="btn-group">
            <button class="btn btn-primary"  data-toggle="modal" data-target="#bookAdd"><span class="glyphicon "></span>添加图书</button>
            <!-- 			用户禁止删除操作 -->
            <button class="btn btn-danger volumeDel" type="submit"><span class="glyphicon "></span>上架/下架</button>

            <button class="btn btn-primary"  data-toggle="modal" data-target="#bookSelect"><span class="glyphicon "></span>查找图书</button>
        </div>
        <br /><br />
        <div class="data-container">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <th><input type="checkbox" id="selectAll"/></th>

                    <th>图书序号</th>
                    <th>书籍名称</th>
                    <th>作者</th>
                    <th>版号</th>
                    <th>图书数量</th>
                    <th>图书简介</th>
                    <th>图片</th>
                    <th>上下架</th>
                    <th>价格</th>
                    <th>借阅量</th>
                    <th>总星星数</th>
                    <th>评论人数</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pu.list}" var="book" >
                    <tr>
                        <td><input type="checkbox" name="ids" value="${book.bookId}"/></td>
                        <td title="${book.bookId}">${book.bookId}</td>
                        <td title="${book.bookName}">${book.bookName}</td>
                        <td title="${book.bookAuthor}">${book.bookAuthor}</td>
                        <td title="${book.bookPublishedInformation}">${book.bookPublishedInformation}</td>
                        <td title="${book.bookCount}">${book.bookCount}</td>
                        <td title="${book.bookDescription}">${book.bookDescription}</td>
                        <td title="${book.bookImage}"><img src="<%=path%>/images/upload/${book.bookImage}" width=50px height=80px alt="" /></td>
                        <td >
                            <c:if test="${book.bookTag==1}">上架</c:if>
                            <c:if test="${book.bookTag==2}">下架</c:if>
                        </td>
                        <td title="${book.bookPrice}">${book.bookPrice}</td>
                        <td title="${book.bookBorrowingNumber}">${book.bookBorrowingNumber}</td>
                        <td title="${book.bookStar}">${book.bookStar}</td>
                        <td title="${book.bookCommentNumber}">${book.bookCommentNumber}</td>
                        <td>
                            <button class="btn btn-primary btn-sm btnInfo" data-book-id="${book}" data-toggle="modal" data-target="#bookInfo"><span class="glyphicon"></span>详情</button>
                            <button class="btn btn-info btn-sm btnEdit" data-book-id="${book}" data-toggle="modal" data-target="#bookEdit"><span class="glyphicon "></span>修改</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <%--分页标签 -->--%>



            <div class="text-right">
                <ul class="pagination">
                    共 ${pu.totalNum} 条
                    <c:choose>
                        <c:when test="${pu.currentPage == 1}">
                            <li class="disabled"><a href="#"><span>&laquo;</span></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/demo01/book/selectBook?cp=${pu.prev}"><span>&laquo;</span></a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach begin="${pu.start}" end="${pu.end}"  var="i">
                        <c:choose>
                            <c:when test="${i == pu.currentPage}">
                                <li class="active"><a href="#">${i}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/demo01/book/selectBook?cp=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${pu.currentPage == pu.last}">
                            <li class="disabled"><a href="#"><span>&raquo;</span></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/demo01/book/selectBook?cp=${pu.next}"><span>&raquo;</span></a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
</div>


<%@ include file="../sourceJs.jsp" %>

<script>


        //根据是否返回消息，在页面提示信息
        if('${msg}'){
            layer.msg('${msg}');
        }


        $(document).ready(function () {
               $.ajax({
                   timeout: 3000,
                   async: false,
                   type: "POST",
                   url: "/demo01/type/getAllType",
                   dataType: "json",
                   data: {},
                   success: function (data) {
                       for (var i = 0; i < data.length; i++) {
                           $("#pro_c").append("<option value='"+data[i].type_id+"'>" + data[i].type_name + "</option>");
                       }
                   }
               });
               $("#pro_c").change(function () {
                   $("#city_c").empty();
                   $("#city_c").append("<option>---请选择---</option>");
                   var pro = document.getElementById("pro_c").value;
                   console.log(pro);
                   $.ajax({
                       timeout: 3000,
                       async: false,
                       type: "POST",
                       url: "/demo01/second/selectType2ById",
                       dataType: "json",
                       data: {
                           type_id: pro,
                       },
                       success: function (data) {
                           for (var i = 0; i < data.length; i++) {
                               $("#city_c").append("<option value='"+data[i].secondType_id+"'>" + data[i].secondType_name + "</option>");
                           }
                       }
                   });
               })
        });





        //为详情按钮绑定事件{"":""}  {'':''}
        $('.btnInfo').on('click',function(){
            var tr = $(this).parents('tr');
            $('#d1').text($(tr).find('td').eq(1).text());
            $('#d2').text($(tr).find('td').eq(2).text());
            $('#d3').text($(tr).find('td').eq(3).text());
            $('#d4').text($(tr).find('td').eq(4).text());
            $('#d5').text($(tr).find('td').eq(5).text());
            $('#d6').text($(tr).find('td').eq(6).text());
            $('#d7').text($(tr).find('td').eq(7).text());
            $('#d8').text($(tr).find('td').eq(8).text());
            $('#d9').text($(tr).find('td').eq(9).text());
            $('#d10').text($(tr).find('td').eq(10).text());
            $('#d11').text($(tr).find('td').eq(11).text());
            $('#d12').text($(tr).find('td').eq(12).text());
        });

        //为编辑按钮绑定事件
        $('.btnEdit').on('click',function(){
            var tr = $(this).parents('tr');
            $('#bookUpdateForm textarea[name=bookId]').val($(tr).find('td').eq(1).text());
            $('#bookUpdateForm textarea[name=bookName]').val($(tr).find('td').eq(2).text());
            $('#bookUpdateForm textarea[name=bookAuthor]').val($(tr).find('td').eq(3).text());
            $('#bookUpdateForm textarea[name=bookPublishedInformation]').val($(tr).find('td').eq(4).text());
            $('#bookUpdateForm textarea[name=bookCount]').val($(tr).find('td').eq(5).text());
            $('#bookUpdateForm textarea[name=bookDescription]').val($(tr).find('td').eq(6).text());
            $('#bookUpdateForm textarea[name=bookImage]').val($(tr).find('td').eq(7).text());
            $('#bookUpdateForm textarea[name=bookTag]').val($(tr).find('td').eq(8).text());
            $('#bookUpdateForm textarea[name=bookPrice]').val($(tr).find('td').eq(9).text());
        });


        //批量删除
        $('.volumeDel').on('click',function(){
            if($('input[name=ids]:checked').length>0){
                //获取所有被选中的复选框集合
                var cks = $('input[name=ids]:checked');
                var ids = [];
                //遍历
                $.each(cks,function(i,n){
                    ids.push($(n).val());
                })
                layer.confirm('确定修改这 '+ids.length+' 条数据？',{
                    btn:['确认','取消'],
                    icon:0
                },function(){
                    //ids = ids.join(',');
                    location.href='/demo01/book/deleteBook?bookId='+ids;
                })
            }else{
                layer.alert('请至少选择一项修改!');
            }
        })

        //全选 保持其他复选框的选中状态与全选按钮的选中状态一致
        $('#selectAll').on('click',function(){
            //将所有input元素中name为ids的元素的选中状态设置为全选复选框的选中状态
            $('input[name=ids]').prop('checked',$(this).prop('checked'))
        })

        //安全退出
        $('#logout').on('click',function(){
            location.replace('stu?method=logout');
        })

</script>
</body>
</html>