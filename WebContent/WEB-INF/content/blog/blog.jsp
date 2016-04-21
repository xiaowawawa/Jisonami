<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/Resources/jsp/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>我的博客</title>
	<link href="${_ctxPath }/Resources/css/blog/blog.css" type="text/css" rel="stylesheet" />
	<script src="${_ctxPath }/Resources/js/blog/blog.js"></script>
</head>
<body>
	<jsp:include page="blogheader_templet.jsp"></jsp:include>
	
	<div class="content">
		<jsp:include page="blogmenu_templet.jsp"></jsp:include>
		
		<div id="blogcontent">
			<span id="blogtitlleheader" class="blod-font">标题</span>
			<span id="publishtimeheader" class="blod-font">发表时间</span>
			<span id="blogtypeheader" class="blod-font">分类</span>
			<span id="blogmanagerheader" class="blod-font">管理</span>
			<br/><br/>
			<c:forEach var="blog" items="${blogs }">
				<span id="blogtitlle">
				<a href='${_ctxPath }/blog/ViewForward.do?blogId=${blog.id}'>
					${blog.title }
				</a>
				</span>
				<span id="publishtime">
					<fmt:formatDate value="${blog.publishTime }" pattern="yyyy-MM-dd" />
				</span>
				<span id="blogtype">
					<!-- 读取数据库配置信息 -->
					<fmt:bundle basename="/org/jisonami/sql/DBConfig">
						<fmt:message key="driver" var="driver"></fmt:message>
						<fmt:message key="url" var="url"></fmt:message>
						<fmt:message key="user" var="user"></fmt:message>
						<fmt:message key="pass" var="pass"></fmt:message>
					</fmt:bundle>
					<!-- 设置数据源 -->
					<sql:setDataSource driver="${driver }" url="${url }" user="${user }" password="${pass }"/>
					<c:set var="blogType" value="${blog.blogType }" ></c:set>
					<c:set var="blogTypeIds" value="${fn:split(blogType, ',') }"></c:set>
					<c:set var="blogTypes" value=""></c:set>
					<c:forEach var="blogTypeId" items="${blogTypeIds }">
						<sql:query var="result">
							select * from t_blogtype t where t.id = ?
							<sql:param value="${blogTypeId }" />
						</sql:query>
						<c:choose>
							<c:when test="${blogTypes!='' }">
								,<br/>${result.rows[0].name }
							</c:when>
							<c:otherwise>
								${result.rows[0].name }
							</c:otherwise>
						</c:choose>
						<c:if test="${blogTypes!='' }" >
							<c:set var="blogTypes" value="${blogTypes },"></c:set>
						</c:if>
						<c:set var="blogTypes" value="${blogTypes }${result.rows[0].name }"></c:set>
					</c:forEach>
				</span>
				<span id="blogmanager">
					<a href='${_ctxPath }/blog/EditForward.do?blogId=${blog.id }'>编辑</a>&nbsp;
					<a href='${_ctxPath }/blog/delete.do?blogId=${blog.id }'>删除</a>&nbsp;
				</span>
				<br/><br/>
			</c:forEach>
		</div>
	</div>
	
	<jsp:include page="/Resources/jsp/common/copyright_templet.jsp"></jsp:include>
</body>
</html>