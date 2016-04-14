<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.jisonami.entity.Blog" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>博客首页</title>
	<link href="Resources/css/blog/blogIndex.css" type="text/css" rel="stylesheet" />
	<script src="Resources/js/blog/blogIndex.js"></script>
</head>
<body>
	<div id="headermenu" class="headermenu">
		<span id="logo" class="logo">
			<img alt="Jisonami" src="Resources/images/logo/Jisonami-Logo.png" />
		</span>
		<div id="menu">
		<div id="sitemenu">
			<a href="index.jsp">首页</a>
			<a href="index.jsp">博客</a>
			<a href="index.jsp">论坛</a>
			<a href="index.jsp">问答</a>
			<a href="index.jsp">商城</a>
			<a href="index.jsp">网盘</a>
			<a href="index.jsp">搜索</a>
			<a href="index.jsp">更多</a>
		</div>
		<div id="usermenu">
			欢迎<%out.print(request.getSession().getAttribute("username")+", "); %><a href="/Jisonami/logout.do">退出</a><br/>
		</div>
		</div>
	</div><br/>
	<div class="header">
		<span id="myblog">我的博客</span>
	</div>
	
	<div class="content">
		<div id="blogmenu">
		<span class="blod-font">博客管理</span><br/>
		<a href="/Jisonami/blog/publishForward.do">发表文章</a><br/>
		<a href="blog/publishForward.do">分类管理</a><br/><br/>
		<span class="blod-font">文章管理</span><br/>
		<a href="blog/publishForward.do">全部博客</a><br/>
		<a href="blog/publishForward.do">草稿箱</a><br/>
		<a href="blog/publishForward.do">回收站</a><br/><br/>
		</div>
		
		<div id="blogcontent">
			<span id="blogtitlleheader" class="blod-font">标题</span>
			<span id="publishtimeheader" class="blod-font">发表时间</span>
			<span id="blogtypeheader" class="blod-font">分类</span>
			<span id="blogmanagerheader" class="blod-font">管理</span>
			<br/>
			<%
				List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");
			%>
			<%
				for(Blog blog: blogs){
			%>
			<span id="blogtitlle">
			<%
					out.println("<a href='/Jisonami/blog/EditForward.do'>");
					out.println(blog.getTitle());
					out.println("</a>");
			%>
			</span>
			<span id="publishtime">
			<%
					out.println(blog.getPublishTime());
			%>
			</span>
			<span id="blogtype">
			<%
					out.println(blog.getBlogType());
			%>
			</span>
			<span id="blogmanager">
			<%
					out.print("<a href='/Jisonami/blog/EditForward.do'>编辑</a>&nbsp;");
					out.print("<a href='/Jisonami/blog/EditForward.do'>删除</a>&nbsp;");
			%>
			</span>
			<%
					out.print("<br/>");
				}
			%>
		</div>
	</div>
	
	<div class="footer">
		<div class="copyright">
			<span>Copyright © 2016 By jisonami All Rights Reserved.</span>
		</div>
	</div>
</body>
</html>