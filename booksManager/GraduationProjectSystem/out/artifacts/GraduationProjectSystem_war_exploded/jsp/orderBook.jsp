<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gxh
  Date: 2020/7/20
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>借书单</title>
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
            width: 900px;
            text-align: left;
        }
        table{
            position: absolute;
            top: 150px;
        }
        form{
            position: absolute;
            top: 200px;
        }
        label{
            position: absolute;
            top: 150px;
            left: 0px;
            font-size: 22px;
            font-family: 华文行楷;
        }
        #check{
            position: relative;
            top: 0px;
            left: 0px;
        }
    </style>
    <script>
        //减按钮实现
       function  sub(ss) {
            let num=$(ss).next().text();
            let price=$(ss).parent().prev().children().text();
            num=--num;
            let sum = parseFloat(price*num).toFixed(2);
            if(num>0){
                $(ss).next().text(num);
                $(ss).parent().next().children().text(sum);
                getSumPrice();
            }
        }
       //加按钮的实现
       function add(jia){
           let num=$(jia).prev().text();
           let price=$(jia).parent().prev().children().text();
           num=++num;
           let sum = parseFloat(price*num).toFixed(2);
           $(jia).prev().text(num);
           $(jia).parent().next().children().text(sum);
           getSumPrice();


       }
       //全选
        function check(chk){
            if ($(chk).get(0).checked==true){
                $("input[type='checkbox']").prop("checked",true);
            }
            else {
                $("input[type='checkbox']").prop("checked",false);
            }
        }
        //删除
        function del(del){
            //alert(1);
            //$(del).parents("tr").remove();
            let bid= $(".check:checked").prev().val();
            let num = parseFloat($(".check:checked").parents("tr").find("span").eq(1).text());
            let path=$("#basePath").val();
            $.ajax({
                url:path+"/deleteOrder",
                type:"post",
                data:{
                    bid:bid,
                    num:num
                },
                success:function (rtn) {
                   if (rtn=="true"){
                       alert("删除成功");
                       $(del).parent().parent().remove();

                   }

                }
                }
            )
        }
        //总计
        function getSumPrice(){
                let price= $(".sumPrice");
                let sum=0;
                for (let i=0;i<price.length;i++){
                    sum+=parseFloat(price.eq(i).text());
                    sum.toFixed(2);
                }
                $(".sum").text(sum);
        }
        //加载时运行
        $(function () {
            $("form").submit(function(){
                let tr = $("tr");
                //物品id
                let bid = $(".check:checked").prev().val();
                let num = parseFloat($(".check:checked").parents("tr").find("span").eq(1).text());
                let path = $("#basePath").val();
                $.ajax({
                        url: path + "/updateNum",
                        type: "post",
                        data: {
                            num: num,
                            bid: bid
                        },
                        success: function (rtn) {
                            if (rtn == "true") {
                                alert("提交成功");
                                window.location.reload();
                            }
                        }
                    },
                )
            });
        })
    </script>
</head>
<body>
<div class="firstPage">
    <input type="hidden" id="basePath" value="${basePath}">
    <div class="page-header title">
        <h1>借书单 <small>Books Order</small></h1>
    </div>
    <div class="content">
        <!-- 表格 -->
        <table class="table table-hover " id="tb" style="font-size: 18px;">
            <tr>
                <th>
                    <input type="checkbox" name="check" id="check" value="" onclick="check(this)" />
                </th>
                <th>
                    图书名称
                </th>
                <th>
                    作者
                </th>
                <th>
                    单价
                </th>
                <th>
                    数量
                </th>
                <th>
                    小计
                </th>
                <th>
                    创建时间
                </th>
                <th>
                    删除
                </th>
            </tr>
            <c:forEach items="${orders}" var="book">
            <tr style="text-align:left">
                <td style="width: 0px">
                    <input type="hidden" value="${book.bid}">
                    <input type="checkbox" name="check" class="check"/>
                </td>
                <td style="width: 180px">
                        ${book.bookName}
                </td>
                <td style="width: 130px">
                        ${book.author}
                </td>
                <td style="width: 60px">
                       <span class="price">${book.price}</span>
                </td>
                <td style="width:150px">
                    <button class="sub" onclick="sub(this)">-</button>
                        <span>${book.num}</span>
                    <button class="add" onclick="add(this)">+</button>
                </td>
                <td style="width: 100px">
                       <span class="sumPrice">${book.sumPrice}</span>
                </td>
                <td style="width: 300px">
                        ${book.dateTime}
                </td>
                <td style="width: 100px">
                    <input class="btn btn-default" type="button" value="删除"  onclick="del(this)" style="position: relative;top: 0px">
                </td>
            </tr>
            </c:forEach>
        </table>
        <form>
            <span style="position: relative; top: 440px;left: 750px"  >￥</span>
            <span  style="position: relative; top: 440px;left: 750px" class="sum"></span>
            <button type="submit" class="btn btn-primary btn-lg btn-block"  style="position: relative;top: 450px;left: 750px;">立即提交</button>
        </form>
        <!-- 分页 -->
        <nav aria-label="Page navigation" style="position: absolute; top: 700px; left: 50px;">
            <ul class="pagination">
                <%--<li>
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
                    <a href="${basePath}/Books">
                    <button type="button" class="btn btn-primary">返回上一页</button>
                    </a>--%>
            </ul>

        </nav>

    </div>
</div>
</body>
</html>

