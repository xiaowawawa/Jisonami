<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="org.jisonami.entity.Blog" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改文章</title>
<link href="/Jisonami/Resources/css/blog/edit.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="blogheader_templet.jsp"></jsp:include>
	
	<div class="content">
		<jsp:include page="blogmenu_templet.jsp"></jsp:include>
		
		<div id="blogcontent">
			<a href="/Jisonami/blog/blogForward.do">返回博客列表</a><br/>
			<form action="edit.do" method="post">
				<input name="blogId" type="hidden" value="<%=((Blog)request.getAttribute("blog")).getId() %>"/>
				标题：<input name="title" type="text" value="<%=((Blog)request.getAttribute("blog")).getTitle() %>" /><br/><br/>
				正文：<textarea name="content" rows="20" cols="90">
					<%=((Blog)request.getAttribute("blog")).getContent() %>
				</textarea><br/>
				<input type="submit" value="发布"/>
			</form>
		</div>
	</div>
	
<jsp:include page="../copyright_templet.jsp"></jsp:include>
</body>
</html>