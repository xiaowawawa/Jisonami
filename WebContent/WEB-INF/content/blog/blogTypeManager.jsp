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
	<link href="/Jisonami/Resources/css/blog/blogTypeManager.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="blogheader_templet.jsp"></jsp:include>
	
	<div class="content">
		<jsp:include page="blogmenu_templet.jsp"></jsp:include>
		
		<div id="blogcontent">
			<h2>博客分类管理</h2><br/>
			<form action="" method="post">
				添加博客分类:<input name="blogType" type="text" />
				<input type="submit" value="提交" />
			</form><br/>
			<span id="blogTypeNameHeader" class="blod-font">名称</span>
			<span id="articleNumberHeader" class="blod-font">文章数量</span>
			<span id="blogTypeManagerHeader" class="blod-font">管理</span>
			<br/>
			
		</div>
	</div>
	
	<jsp:include page="../copyright_templet.jsp"></jsp:include>
</body>
</html>