<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.jisonami.entity.Blog" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.jisonami.service.BlogTypeService" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="org.jisonami.entity.BlogType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>博客首页</title>
	<link href="/Jisonami/Resources/css/blog/blogIndex.css" type="text/css" rel="stylesheet" />
	<script src="/Jisonami/Resources/js/blog/blogIndex.js"></script>
</head>
<body>
	<jsp:include page="../menu_templet.jsp"></jsp:include>
	<div class="content">
		<div id="blogmenu">
			全站分类
		</div>
		<div id="blogcontent">
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
			</span><br/>
			<%
				out.println(blog.getContent());
			%><br/>
			<span id="author">
			<%
				out.println(blog.getAuthor()+"&nbsp;&nbsp;&nbsp;&nbsp;");
			%>
			</span>
			<span id="publishtime">
			<%
					SimpleDateFormat formator = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String publishTime = null;
					if(blog.getPublishTime() != null){
						publishTime = formator.format(blog.getPublishTime());
					}
					out.println(publishTime);
			%>
			</span><br/><br/>
			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="../copyright_templet.jsp"></jsp:include>
</body>
</html>