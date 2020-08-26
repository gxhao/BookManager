<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
        <!-- 编码集 -->
        <meta charset="utf-8">
        <!-- 响应式设置 -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>登录页</title>
		<%  //获取文件上下文
			String path=request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		%>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css" />
		<script src="<%=basePath%>js/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath%>js/bootstrap.min.js"></script>
		<style type="text/css">	
			form{
				float: right;
				position: absolute;
				top: 300px;
				left: 900px;
			}
			form input[type='radio']{
				margin: 0px 10px 0px 10px;
				color: white;
			}
			h1{
				text-align: center;
				position: absolute;
				top: 80px;
				left: 300px;
				/* opacity:0.2; */
				color: darkgoldenrod;
				font-family: 楷体;
				font-size: 100px;
			}
			
		</style>
		<script>
			//焦点移开时
			function uid(username) {
				let user=$(username).val();
				let check=$(".checkbox").find("input:checked").val();
				//alert(check);
				$.ajax({
							url:"loginIdentity",
							type:"post",
							data:{
								user:user,
								identity:check
							},
							success:function (userJson) {
								//alert(userJson.username);
								for (let i = 0; i <userJson.length; i++) {
									if (userJson[i].username==user&userJson[i].identity==check){
										alert("身份验证正确")
										return
									}
									else {
										alert("请输入正确的身份")
										return
									}

								}

							},
							dataType:"json"
				}
				)
			}
		</script>

	</head>
	<body>

		<div class="">
		  <h1 >基于JSP图书管理系统</h1>
		</div>
		<div id="image">
			<img src="<%=basePath%>img/index.jpg" class="img-responsive login" alt="Responsive image" width: 100% \9>
		</div>
		<div id="login">
			<div id="content" class="container">
				<form style="color: wheat;" method="post" action="<%=basePath%>login">
					<div class="form-group">
						<label for="exampleInputEmail1">用户名：</label>
						<input class="form-control" id="exampleInputEmail1" placeholder="username" name="username" onblur="uid(this)">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">密码：</label>
						<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
					</div>
					<!-- <div class="form-group">
					<label for="exampleInputFile">File input</label>
					<input type="file" id="exampleInputFile">
					<p class="help-block">Example block-level help text here.</p>
				</div> -->
					<div class="checkbox">
						<label style="color: wheat;">
							<input type="radio" name="user" value="1" > 管理员
							<input type="radio" name="user" value="2" checked> 学生
						</label>
					</div>
					<button type="submit" class="btn btn-default" style="width: 300px;">登录</button>
<%--					el表达式使密码错误时使用--%>
					<p style="color: red;font-size: 18px">${requestScope.error}</p>
					
				</form>
			</div>

		</div>
<%--		<%@include file="/jsp/foot.jsp"%>--%>
	</body>
</html>
