<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="org.jisonami.entity.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="org.jisonami.entity.BlogType" %>
<%@ page import="org.jisonami.service.BlogTypeService" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改文章</title>
	<link href="/Jisonami/Resources/css/blog/edit.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="/Jisonami/Resources/js/blog/edit.js"></script>
</head>
<body>
	<jsp:include page="blogheader_templet.jsp"></jsp:include>
	
	<div class="content">
		<jsp:include page="blogmenu_templet.jsp"></jsp:include>
		
		<div id="blogcontent">
			<a href="/Jisonami/blog/blogForward.do">返回博客列表</a><br/><br/>
			<form action="edit.do" method="post">
				<input name="blogId" type="hidden" value="<%=((Blog)request.getAttribute("blog")).getId() %>"/>
				标题：<input id="blogTitle" name="title" type="text" value="<%=((Blog)request.getAttribute("blog")).getTitle() %>" /><br/><br/>
				博客分类：<input id="blogTypes" name="blogTypes" type="text" value="<%=request.getAttribute("blogTypes") %>" /><br/>
				<input id="blogTypeIds" name="blogTypeIds" type="hidden" value="<%=request.getAttribute("blogTypeIds") %>" />
				<%
					String username = request.getSession().getAttribute("username").toString();
					BlogTypeService blogTypeService = new BlogTypeService();
					List<BlogType> blogTypes = null;
					try {
						blogTypes = blogTypeService.queryByAuthor(username);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					int blogTypesCount = blogTypes.size();
					pageContext.setAttribute("blogTypesCount", blogTypesCount);
					for(int i=0;i<blogTypesCount;i++){
						BlogType blogType = blogTypes.get(i);
						out.println("<input name='blogType' id='blogType" + i + "' blogTypeId='" + blogType.getId() +
								"' blogTypeName='" + blogType.getName() + "' type='checkbox' ");
						if(request.getAttribute("blogTypes")!=null){
							String blogTypeStrings = request.getAttribute("blogTypes").toString();
							if(blogTypeStrings.contains(blogType.getName())){
								out.println("checked='checked'");
							}
						}
						out.println("/>");
						out.println(blogType.getName());
						out.println("&nbsp;");
					}
				%>
				<br/><br/>
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