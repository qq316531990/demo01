<%--
  Created by IntelliJ IDEA.
  User: liuhj
  Date: 2019/1/8
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>commentBook</title>
    <link rel="stylesheet" href="<%=path%>/css/Comment.css">

    <link type="text/css" rel="stylesheet" href="<%=path %>/css/dianZan.css"/>
    <link rel="stylesheet" href="<%=path %>/css/pingfen.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.11.0.min.js"></script>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.rating-stars.min.js"></script>

    <style type="text/css">
        *{
            padding: 0px;
            margin: 0px;
        }
        body{

        }
    </style>

</head>
<body>
<div class="book">
    <div class="bookpicture">
        <img src="<%=path%>/images/upload/${book1.bookImage}" alt="">
    </div>
    <div class="bookword">
        <table>
            <tr style="height: 40px">
                <td>图书编号：</td>
                <td>${book1.bookId}</td>
            </tr>
            <tr style="height: 40px">
                <td>图书名称:</td>
                <td>${book1.bookName}</td>
            </tr>
            <tr style="height: 40px">
                <td>出版社：</td>
                <td>${book1.bookPublishedInformation}</td>
            </tr>
            <tr style="height: 40px">
                <td>图书作者：</td>
                <td>${book1.bookAuthor}</td>
            </tr>
             <tr style="height: 40px">
                <td>价格：</td>
                <td>${book1.bookPrice}</td>
            </tr>
             <tr style="height: 40px">
                <td>图书数量：</td>
                <td>${book1.bookCount}</td>
            </tr>
            <tr style="height: 40px">
                <td><a href="<%=path%>/second/getTypesForUser">返回</a></td>
                <td><a id="addBorrow" name="addBorrow" href="#">借阅</a></td>
            </tr>

        </table>
    </div>
</div>

<c:forEach items="${list}" var="c">
    <div class="display">
        <div class="disxx">
            <c:if test="${c.comment_state==1}">
                <p class="xing">★</p>
            </c:if>
            <c:if test="${c.comment_state==2}">
                <p class="xing">★★</p>
            </c:if>
            <c:if test="${c.comment_state==3}">
                <p class="xing">★★★</p>
            </c:if>
            <c:if test="${c.comment_state==4}">
                <p class="xing">★★★★</p>
            </c:if>
            <c:if test="${c.comment_state==5}">
                <p class="xing">★★★★★</p>
            </c:if>
        </div>
        <div class="disid">
            <span>用户id:${c.user_id}</span>
        </div>
        <div class="distext">${c.comment_content}</div>
        <div class="distime"><f:formatDate value="${c.comment_time}" pattern="yyyy-MM-dd HH:mm:ss"></f:formatDate></div>
        <div class="disHuiFu">
            <input type="hidden" id="huiFu1" value="${c.comment_id}">
            <button data-toggle="modal" data-target="#myModalHuiFu" onclick="com_id(${c.comment_id})">
                回复
            </button>
        </div>
            <div class="feed" id="feed">
                <div class="heart" id="like${c.comment_id}" rel="like"></div>
                <div class="likeCount" id="likeCount${c.comment_id}">${c.comment_great_number}</div>
            </div>

        <div class="caoZuo">
            <c:if test="${c.user_id==userLogin.user_id}">
                <input type="button" value="删除" onclick="del(${c.comment_id})">
                <button data-toggle="modal" data-target="#myModal" onclick="com_id_xg(${c.comment_id})">
                    <span>修改</span>
                </button>
            </c:if>
        </div>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            修改评论
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-5 p-lg-5 mx-auto my-5" style="width: 320px">
                            <div class="rating-stars block">
                                <div class="rating-stars-container">
                                    <div class="rating-star">
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="rating-star">
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="rating-star">
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="rating-star">
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="rating-star">
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                                <input type="number" readonly class="form-control rating-value" name="rating-stars-value" id="rating-stars-value" style="width: 50px">
                            </div>
                        </div>
                        <input type="hidden" id="comm_id_xg" value="">
                        <textarea name="comment_content1" id="comment_content1" cols="40" rows="5" style="font-size: 18px"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary" onclick="update()">
                            提交更改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

        <div class="modal fade" id="myModalHuiFu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabe2">
                            回复评论
                        </h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="comm_id" value="">
                        <textarea name="comment_contentHuiFu" id="comment_contentHuiFu" cols="40" rows="5" style="font-size: 18px"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary" onclick="huiFu()">
                            提交
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </div>
<div class="huiFuPl">
    <c:forEach items="${huiFuList}" var="hf" >
        <c:if test="${c.comment_id==hf.parent_comment_id}">
                <tr>
                    <td>用户&nbsp;${hf.user_id}&nbsp;回复:</td>
                    <td>${hf.comment_content}<br></td>
                    <td><f:formatDate value="${hf.comment_time}" pattern="yyyy-MM-dd HH:mm:ss"></f:formatDate><br></td>
                </tr>
        </c:if>
    </c:forEach>
    </div>


    <script type="text/javascript">
        var ratingOptions = {
            selectors: {
                starsSelector: '.rating-stars',
                starSelector: '.rating-star',
                starActiveClass: 'is--active',
                starHoverClass: 'is--hover',
                starNoHoverClass: 'is--no-hover',
                targetFormElementSelector: '.rating-value'
            }
        };
        $(".rating-stars").ratingStars(ratingOptions);



        $("#myModalHuiFu").modal("hide");
        function com_id(comment_id) {
            $("#comm_id").val(comment_id);
        }

        $("#myModal").modal("hide");
        function com_id_xg(comment_id) {
            $("#comm_id_xg").val(comment_id);
        }

        function huiFu() {
            var comment_id;
            var user_id;
            var book_id;
            var comment_content;
            comment_id=$("#comm_id").val();
            user_id=${userLogin.user_id};
            book_id=${book1.bookId};
            comment_content=$('#comment_contentHuiFu').val();
            $.ajax({
                type:'post',
                url:'<%=path %>/comment/huiFu',
                dataType:'json',
                async: true,
                data:{user_id: user_id, book_id: book_id,parent_comment_id:comment_id,comment_content:comment_content},
            });
            alert("回复成功");
            window.location.href='<%=path %>/comment/findBook?book_id=${book1.bookId}';
        }

        function update() {
            var comment_id;
            var comment_content;
            var comment_state;
            comment_id=$("#comm_id_xg").val();
            comment_content=$('#comment_content1').val();
            comment_state=$('#rating-stars-value').val();
            $.ajax({
                type:'post',
                url:'<%=path %>/comment/update',
                dataType:'json',
                async: true,
                data:{comment_id:comment_id,comment_content:comment_content,comment_state:comment_state},
            });
            alert("修改成功");
            window.location.href='<%=path %>/comment/findBook?book_id=${book1.bookId}';
        }

    </script>

</c:forEach>

<div class="fenYe">
    <a href="<%=path %>/comment/findBook?book_id=${book1.bookId}&index=1">首页</a>
    <c:if test="${index>1}">
        <a href="<%=path %>/comment/findBook?book_id=${book1.bookId}&index=${index-1}">上页</a>
    </c:if>
    <span>第${index}页</span>
    <c:if test="${index<total}">
        <a href="<%=path %>/comment/findBook?book_id=${book1.bookId}&index=${index+1}">下页</a>
        <a href="<%=path %>/comment/findBook?book_id=${book1.bookId}&index=${total}">末页</a>
    </c:if>
</div>

    <script type="text/javascript">
/*删除*/
        function del(comment_id) {
            if(confirm("确认删除？")){
                $.ajax({
                    type:'post',
                    url:'<%=path %>/comment/delete',
                    dataType:'json',
                    async: true,
                    data:{comment_id:comment_id},
                });
                window.location.href='<%=path %>/comment/findBook?book_id=${book1.bookId}';
            }
            return false;
        }

/*点赞*/
$(document).ready(function(){
    $('body').on("click",'.heart',function(){
        var comment_great_number;
        var A=$(this).attr("id");
        var B=A.split("like");
        var messageID=B[1];
        var C=parseInt($("#likeCount"+messageID).html());
        $(this).css("background-position","")
        var D=$(this).attr("rel");
        if(D === 'like') {
            $("#likeCount"+messageID).html(C+1);
            $(this).addClass("heartAnimation").attr("rel","unlike");
            comment_great_number=parseInt($("#likeCount"+messageID).html());
        }
        else{
            $("#likeCount"+messageID).html(C-1);
            $(this).removeClass("heartAnimation").attr("rel","like");
            $(this).css("background-position","left");
            comment_great_number=parseInt($("#likeCount"+messageID).html());
        }
        $.ajax({
            type:'post',
            url:'<%=path %>/comment/updateDianZan',
            dataType:'json',
            async: true,
            data:{comment_id: messageID,great_number:comment_great_number},
        });
    });

});
    </script>
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
        var user_id = ${userLogin.user_id};;
        $.ajax({
            url: '<%=path%>/borrow/insertBorrow',
            data: {"book_id": book_id, "user_id": user_id},
            async: false,
            dataType: 'json',
            success: function (data) {
                if(data === -2){
                    alert("库存不足！");
                    return;
                }
                else if(data === -1){
                    alert("卡号不存在！");
                    return;
                } else
                {
                    window.event.returnValue=false;
                    window.location.href="<%=path%>//borrow/listBorrowsForUsers?currPage=1";
                    alert("借阅成功!");
                }
            }
        });

    })
</script>



</body>
</html>
