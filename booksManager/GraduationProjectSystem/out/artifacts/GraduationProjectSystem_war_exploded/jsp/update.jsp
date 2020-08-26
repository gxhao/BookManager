<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gxh
  Date: 2020/7/15
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改</title>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.min.css" />
    <script src="${basePath}/js/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${basePath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        .title{
            text-align: center;
            position: absolute;
            top: 0;
            left: 500px;
            /* opacity:0.2; */
            color: darkgoldenrod;
            font-family: 楷体;
            font-size: 100px;
        }
        .firstPage{
            width: 100%;
            height:800px;
            background-image: url(${basePath}/img/page.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            /* position: absolute;
            left: 300px;
            top: 100px; */
        }
        .content{
            position: absolute;

            left: 500px;
            width: 700px;
            text-align: center;
        }
        table{
            position: absolute;
            top: 170px;
        }
        form{
            position: absolute;
            top: 200px;
        }
        input{
            position: relative;
            left: 250px;
        }
        label{
            position: relative;
            left: 200px;
            padding: 30px 30px;

        }

    </style>
<%--    ajax修改参数--%>
    <script>
        $(function () {
            $("#update").submit(function () {
            //    取值
                let author=$("#author").val();
                let publishing=$("#publishing").val();
                let price = $("#price").val();
                let coding=$("#coding").val();
                let path =$("#basePath").val();
                let bookName=$("#bookName").val();
                $.ajax({
                    url:path+"/updateAjax",
                    type:"post",
                    data:{author:author,
                        publishing:publishing,
                        price:price,
                        coding:coding,
                        bookName:bookName
                    },
                    success:function (rtn) {
                        if (rtn=="true"||rtn==true){
                            alert("修改成功");
                        }
                    },
                    error:function (rtn) {
                        if (rtn=="false"||rtn==false){
                            alert("修改失败");
                        }
                    }
                });
            });


        })
    </script>
</head>
<body>
<div class="firstPage">
    <input type="hidden" id="basePath" value="${basePath}">
    <div class="page-header title">
        <h1>修改图书信息 <small>Update Books</small></h1>
    </div>
    <div class="content">
        <!-- 表单 -->

        <form class="form-horizontal" id="update" action="${basePath}/Books">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">BookName：</label>
                <div class="col-sm-10">

                    <input type="text" disabled id="bookName" class="form-control" placeholder="书名" value="${detail.bookName}" style="user-select: none">

                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Author：</label>
                <div class="col-sm-10">
                    <input type="text" id="author" class="form-control" placeholder="作者" value="${detail.author}">
                </div>
            </div><div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Publishing：</label>
            <div class="col-sm-10">
                <input type="text" id="publishing" class="form-control" placeholder="出版社" value="${detail.publishing}">
            </div>
        </div><div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Price：</label>
            <div class="col-sm-10">
                <input type="text" id="price" class="form-control" placeholder="价格" value="${detail.price}">
            </div>
        </div><div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Coding：</label>
            <div class="col-sm-10">
                <input type="text" id="coding" class="form-control" placeholder="编码" value="${detail.coding}">
            </div>
        </div>
            <div class="form-group" style="position: relative; left: 200px;">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">提交</button>
                    <button type="reset" class="btn btn-default">取消</button>
                </div>
            </div>

        </form>
        <!-- 分页 -->
       <%-- <nav aria-label="Page navigation" style="position: absolute; top: 700px; left: 50px;">
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">6</a></li>
                <li><a href="#">7</a></li>
                <li><a href="#">8</a></li>
                <li><a href="#">9</a></li>
                <li><a href="#">10</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <button type="button" class="btn btn-primary">返回上一页</button>
            </ul>

        </nav>--%>

    </div>
</div>
</body>
</html>

