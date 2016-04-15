<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.jisonami.entity.Blog" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>博客首页</title>
	<link href="/Jisonami/Resources/css/blog/blogIndex.css" type="text/css" rel="stylesheet" />
	<script src="/Jisonami/Resources/js/blog/blogIndex.js"></script>
</head>
<body>
	<jsp:include page="blogheader_templet.jsp"></jsp:include>
	
	<div class="content">
		<jsp:include page="blogmenu_templet.jsp"></jsp:include>
		
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
					String blogId = blog.getId();
					out.println("<a href='/Jisonami/blog/ViewForward.do?blogId=" + blogId + "'>");
					out.println(blog.getTitle());
					out.println("</a>");
			%>
			</span>
			<span id="publishtime">
			<%
					SimpleDateFormat formator = new SimpleDateFormat("yyyy-MM-dd");
					String publishTime = null;
					if(blog.getPublishTime() != null){
						publishTime = formator.format(blog.getPublishTime());
					}
					out.println(publishTime);
			%>
			</span>
			<span id="blogtype">
			<%
					out.println(blog.getBlogType());
			%>
			</span>
			<span id="blogmanager">
			<%
					out.print("<a href='/Jisonami/blog/EditForward.do?blogId=" + blogId + "'>编辑</a>&nbsp;");
					out.print("<a href='/Jisonami/blog/delete.do?blogId=" + blogId + "'>删除</a>&nbsp;");
			%>
			</span>
			<%
					out.print("<br/>");
				}
			%>
		</div>
	</div>
	
	<jsp:include page="../copyright_templet.jsp"></jsp:include>
</body>
</html>