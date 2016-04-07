<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆页面</title>
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
	<form action="login.do" method="post">
		用户名：<input name="username" type="text" /><br/>
		密&nbsp;&nbsp;码：<input name="password" type="text" /><br/>
		<input type="submit" value="登陆" />
		<a href="register.jsp">注册</a>
	</form>
</body>
</html>