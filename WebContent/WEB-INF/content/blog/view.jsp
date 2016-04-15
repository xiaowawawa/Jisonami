<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="org.jisonami.entity.Blog" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>预览文章</title>
	<link href="/Jisonami/Resources/css/blog/publish.css" type="text/css" rel="stylesheet" />
</head>
<body>
<jsp:include page="blogheader_templet.jsp"></jsp:include>
	
	<div class="content">
		<jsp:include page="blogmenu_templet.jsp"></jsp:include>
		
		<div id="blogcontent">
			<a href="/Jisonami/blog/blogForward.do">返回博客列表</a><br/>
			<input name="blogId" type="hidden" value="<%=((Blog)request.getAttribute("blog")).getId() %>"/>
			博客标题：<%=((Blog)request.getAttribute("blog")).getTitle() %>
			<br/>
			<%=((Blog)request.getAttribute("blog")).getContent() %>
		</div>
	</div>
	
<jsp:include page="../copyright_templet.jsp"></jsp:include>
</body>
</html>