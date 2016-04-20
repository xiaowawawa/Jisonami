<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/Resources/jsp/common/taglibs.jsp" %>
<%@ page import="org.jisonami.entity.Blog" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>预览文章</title>
	<link href="${_ctxPath }/Resources/css/blog/publish.css" type="text/css" rel="stylesheet" />
</head>
<body>
<jsp:include page="blogheader_templet.jsp"></jsp:include>
	
	<div class="content">
		<jsp:include page="blogmenu_templet.jsp"></jsp:include>
		
		<div id="blogcontent">
			<a href="${_ctxPath }/blog/blogForward.do">返回博客列表</a><br/><br/>
			<input name="blogId" type="hidden" value="<%=((Blog)request.getAttribute("blog")).getId() %>"/>
			博客标题：<%=((Blog)request.getAttribute("blog")).getTitle() %>
			<br/><br/>
			<%
					Blog blog = (Blog)request.getAttribute("blog");
					SimpleDateFormat formator = new SimpleDateFormat("yyyy-MM-dd");
					String publishTime = null;
					if(blog.getPublishTime() != null){
						publishTime = formator.format(blog.getPublishTime());
					}
					out.println(publishTime);
			%>
			<br/><br/>
			博客类型：<%=request.getAttribute("blogTypes") %>
			<br/><br/>
			<%=((Blog)request.getAttribute("blog")).getContent() %>
		</div>
	</div>
	
<jsp:include page="/Resources/jsp/common/copyright_templet.jsp"></jsp:include>
</body>
</html>