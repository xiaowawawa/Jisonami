<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.jisonami.entity.Blog" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>博客首页</title>
</head>
<body>
	<%out.print(request.getSession().getAttribute("username")+", "); %><a href="/Jisonami/logout.do">退出</a><br/>
	博客管理<br/>
	<a href="/Jisonami/blog/publishForward.do">发表文章</a><br/>
	<a href="blog/publishForward.do">分类管理</a><br/><br/>
	文章管理<br/>
	<a href="blog/publishForward.do">全部博客</a><br/>
	<a href="blog/publishForward.do">草稿箱</a><br/>
	<a href="blog/publishForward.do">回收站</a><br/><br/>
	<%
		List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");
		for(Blog blog: blogs){
			out.println(blog.getTitle());
			out.print("<br/>");
			out.println(blog.getContent());
			out.print("<br/></br/>");
		}
	%>
</body>
</html>