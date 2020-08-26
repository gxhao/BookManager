<%--
  Created by IntelliJ IDEA.
  User: gxh
  Date: 2020/7/13
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<nav aria-label="Page navigation" style="position: absolute; top: 730px; left: 200px;">
    <ul class="pagination">
        <li>
            <a href="${basePath}/page?curPage=${Page.prePage}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li>
            <a href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
        <button type="button" class="btn btn-primary">返回上一页</button>
    </ul>

</nav>
</body>
</html>
