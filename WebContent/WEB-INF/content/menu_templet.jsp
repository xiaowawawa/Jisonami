<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link href="/Jisonami/Resources/css/common/menu_templet.css" type="text/css" rel="stylesheet" />
<div id="headermenu" class="headermenu">
	<span id="logo" class="logo">
		<img alt="Jisonami" src="/Jisonami/Resources/images/logo/Jisonami-Logo.png" />
	</span>
	<div id="menu">
	<div id="sitemenu">
		<a href="index.jsp">首页</a>
		<a href="index.jsp">博客</a>
		<a href="index.jsp">论坛</a>
		<a href="index.jsp">问答</a>
		<a href="index.jsp">商城</a>
		<a href="index.jsp">网盘</a>
		<a href="index.jsp">搜索</a>
		<a href="index.jsp">更多</a>
	</div>
	<div id="usermenu">
		欢迎<%out.print(request.getSession().getAttribute("username")+", "); %><a href="/Jisonami/logout.do">退出</a><br/>
	</div>
	</div>
</div><br/>
