<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.jisonami.entity.BlogType" %>
<%@ page import="org.jisonami.service.BlogTypeService" %>
<%@ page import="java.sql.SQLException" %>
<link href="/Jisonami/Resources/css/blog/blogmenu_templet.css" type="text/css" rel="stylesheet" />
<div id="blogmenu">
	<span class="blod-font">博客管理</span><br/>
	<a href="/Jisonami/blog/publishForward.do">发表文章</a><br/>
	<a href="/Jisonami/blog/blogtype/blogTypeManagerForward.do">分类管理</a><br/><br/>
	<span class="blod-font">文章管理</span><br/>
	<a href="blog/publishForward.do">全部博客</a><br/>
	<%
		String username = request.getSession().getAttribute("username").toString();
		BlogTypeService blogTypeService = new BlogTypeService();
		List<BlogType> blogTypes = null;
		try {
			blogTypes = blogTypeService.queryByAuthor(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
	<%
		for(BlogType blogtype: blogTypes){
	%>
	<span id="blogTypeName">
	<%
			String blogTypeId = blogtype.getId();
			out.print("<a href='#'>");
			out.println(blogtype.getName());
			out.println("</a>");
	%>
	</span>
	<%
			out.print("<br/>");
		}
	%>
	<a href="blog/publishForward.do">草稿箱</a><br/>
	<a href="blog/publishForward.do">回收站</a><br/><br/>
</div>
