<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gxh
  Date: 2020/7/14
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //项目路径
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<html>
<head>
    <title>查看所有图书</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css" />
    <script src="<%=basePath%>js/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
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
            background-image: url(<%=basePath%>img/page.jpg);
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

    </style>
</head>
<body>
<div class="firstPage">
    <div class="page-header title">
        <h1>查看图书 <small>Show Books</small></h1>
    </div>
<%--    内容--%>
    <div class="content">
        <!-- 小菜单 -->
        <div class="row " style="position: relative;top: 110px;">
<%--${Books}--%>
            <c:forEach items="${requestScope.Books.list}" var="book">
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <img src="<%=basePath%>img/${book.img }" alt="..." style="height: 100px">
                    <div class="caption">
                        <%--<a href="<%=basePath%>/Books?bid=${book.bid}"></a>--%>
                        <a href="xxx"></a>
                        <h3>${book.bookName}</h3>
                        <p>${book.author}</p><p>￥${book.price}元</p>
                        <p><a href="${basePath}/order?id=${book.bid}&num=1" class="btn btn-primary" role="button">加入借书单</a>
                            <a href="<%=basePath%>update?id=${book.bid}&page=2" class="btn btn-default" role="button">修改图书</a></p>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
<%--    分页--%>
        <nav aria-label="Page navigation" style="position: absolute; top: 730px; left: 200px;">
            <ul class="pagination">
                <li>
                    <a href="${basePath}/Books?curPage=${Books.prePage}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
<%--                中间的数字--%>
                <c:forEach items="${Books.pageList}" var="pageNum">
                <li><a href="${basePath}/Books?curPage=${pageNum}">${pageNum}</a></li>
                </c:forEach>
<%--                尾页--%>
                <li>
                    <a href="${basePath}/Books?curPage=${Books.nextPage}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <a href="${basePath}/jsp/home.jsp">
                <button type="button" class="btn btn-primary">返回上一页</button>
                </a>
            </ul>

        </nav>
    </div>
</div>
</body>
</html>

