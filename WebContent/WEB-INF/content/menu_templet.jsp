<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link href="/Jisonami/Resources/css/common/menu_templet.css" type="text/css" rel="stylesheet" />
<div id="headermenu" class="headermenu">
	<span id="logo" class="logo">
		<img alt="Jisonami" src="/Jisonami/Resources/images/logo/Jisonami-Logo.png" />
	</span>
	<div id="menu">
	<div id="sitemenu">
		<a href="/Jisonami/index.jsp">首页</a>
		<a href="/Jisonami/index.jsp">博客</a>
		<a href="/Jisonami/index.jsp">论坛</a>
		<a href="/Jisonami/index.jsp">问答</a>
		<a href="/Jisonami/index.jsp">商城</a>
		<a href="/Jisonami/index.jsp">网盘</a>
		<a href="/Jisonami/index.jsp">搜索</a>
		<a href="/Jisonami/index.jsp">更多</a>
	</div>
	<div id="usermenu">
		<%
			Object username = request.getSession().getAttribute("username");
			if(username!=null){
				out.print("欢迎"+username+", ");
				out.println("<a href='/Jisonami/blog/blogForward.do'>我的博客</a>");
				out.println("<a href='/Jisonami/logout.do'>退出</a><br/>");
			} else {
				out.print("您还未登录！");
				out.println("<a href='/Jisonami/login.jsp'>登录</a>");
				out.println("<a href='/Jisonami/register.jsp'>注册</a><br/>");
			}
		%>
	</div>
	</div>
</div><br/>
