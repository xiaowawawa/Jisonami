<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/Resources/jsp/common/taglibs.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="org.jisonami.entity.BlogType" %>
<%@ page import="org.jisonami.service.BlogTypeService" %>
<%@ page import="org.jisonami.service.BlogService" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<link href="${_ctxPath }/Resources/css/blog/blogmenu_templet.css" type="text/css" rel="stylesheet" />
<div id="blogmenu">
	<span class="blod-font">博客管理</span><br/>
	<a href="${_ctxPath }/blog/publishForward.do">发表文章</a><br/>
	<a href="${_ctxPath }/blog/blogtype/blogTypeManagerForward.do">分类管理</a><br/><br/>
	<span class="blod-font">文章管理</span><br/>
	<%
		String username = request.getSession().getAttribute("username").toString();
		BlogTypeService blogTypeService = new BlogTypeService();
		List<BlogType> blogTypes = null;
		try {
			blogTypes = blogTypeService.queryByAuthor(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		BlogService blogService = new BlogService();
		List<Integer> blogCounts = new ArrayList<Integer>();
		for (BlogType blogType : blogTypes) {
			try {
				int blogCount = blogService.blogCountByBlogType(blogType.getId());
				blogCounts.add(blogCount);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		int allBlogCount = blogService.queryByAuthor(username).size();
		out.print("<a href='${_ctxPath }/blog/blogForward.do'>全部博客");
		out.print("(" + allBlogCount + ")");
		out.println("</a><br/>");
	%>
	<%
		for(int i=0;i<blogTypes.size();i++){
			BlogType blogType = blogTypes.get(i);
			int blogCount = blogCounts.get(i);
	%>
	<span id="blogTypeName">
	<%
			String blogTypeId = blogType.getId();
			out.print("<a href='${_ctxPath }/blog/blogForward.do?blogTypeId=" + blogTypeId + "'>");
			out.print(blogType.getName());
			out.println("(" + blogCount + ")");
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
