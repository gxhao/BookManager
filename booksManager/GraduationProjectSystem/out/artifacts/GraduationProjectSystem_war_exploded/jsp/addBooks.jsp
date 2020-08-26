<%--
  Created by IntelliJ IDEA.
  User: gxh
  Date: 2020/7/17
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加图书</title>
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
    <script>
        $(function () {


            //表单提交
          /*  $("#add").submit(function () {

                alert($("#value").text());
            });*/
        })

    </script>
</head>
<body>
<div class="firstPage">
    <div class="page-header title">
        <h1>添加图书 <small>Add Books</small></h1>
    </div>
    <div class="content">
        <!-- 表单 -->
        <form class="form-horizontal" method="post" action="${basePath}/addPage" id="add">
            <div id="value">
                ${addBooks}
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">BookName：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="书名" name="bookName">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Author：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="作者" name="author">
                </div>
            </div>
            <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Publishing：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" placeholder="出版社" name="publishing">
            </div>
        </div>
<%--            价格--%>
            <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Price：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" placeholder="价格" name="price">
            </div>
            </div>
<%--            编码--%>
            <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Coding：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" placeholder="编码" name="coding">
            </div>
            </div>
<%--            图片--%>

<%--        <img src="${basePath}/img/book7.gif" class="img-responsive" alt="Responsive image" name="img">--%>
            <div class="form-group" style="position: relative; left: 200px;">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">提交</button>
                    <button type="reset" class="btn btn-default">取消</button>
                </div>
            </div>

        </form>


    </div>
</div>
</body>
</html>


