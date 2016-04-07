<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发表文章</title>
</head>
<body>
	<form action="publish.do" method="post">
		标题：<input type="text" /><br/><br/>
		正文：<textarea rows="20" cols="100"></textarea><br/>
		<input type="submit" value="发布"/>
	</form>
</body>
</html>