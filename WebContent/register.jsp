<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新用户注册</title>
</head>
<body>
	<span style="color:red">
	<%
		Object error = request.getAttribute("error");
		if(error!=null) {
			out.println(error); 
		}
	%>
	</span>
	<form action="register.do" method="post">
		用户名：
		<input name="username" type="text" />
		<br /> 密码：
		<input name="password" type="text" />
		<br /> 确认密码：
		<input name="verifyPassword" type="text" />
		<br />
		<input name="register" type="submit" value="注册" />
		<a href="login.jsp">返回登陆</a>
	</form>
</body>
</html>