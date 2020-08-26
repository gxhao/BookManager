<%--
  Created by IntelliJ IDEA.
  User: gxh
  Date: 2020/7/14
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //项目路径
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>管理</title>
    <%--		<base href="<%=basePath%>" />--%>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css" />
    <script src="<%=basePath%>js/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <style type="text/css">
        h1 {
            text-align: center;
            position: absolute;
            top: 80px;
            left: 600px;
            /* opacity:0.2; */
            color: darkgoldenrod;
            font-family: 楷体;
            font-size: 60px;
        }
        .firsthand{
            width: 100%;
            height:800px;
            /*background-image: url(../img/page.jpg);*/
            background-repeat: no-repeat;
            background-size: cover;
            /* position: absolute;
            left: 300px;
            top: 100px; */
        }
        .content{
            position: absolute;
            top: 300px;
            left: 500px;
            width: 700px;
            text-align: center;
        }
        button{
            position: absolute;
            top: 220px;
            left: 800px;
        }

    </style>
</head>
<body>
<div class="firsthand">
    <div class="">
        <h1>图书后台管理设置</h1>

        <button type="submit" class="btn btn-default" style="width: 100px;">${user.username}</button>
    </div>
    <div id="image">
        <img src="<%=basePath%>img/page.jpg" class="img-responsive login" alt="Responsive image" width: 100% style="width: 100%; height: 800px;">
    </div>