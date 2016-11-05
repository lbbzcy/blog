<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>404</title>
<meta http-equiv="refresh" content="60;url=http://localhost:8090/blog/index?page=1">
<!-- content="600，即600秒后返回主页，可根据需要修改或者删除这段代码 -->
<link href="<c:url value='/static/css/error.css'/>" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- 代码 开始 -->
<div id="container">
	<img class="png" src="<c:url value='/static/images/404.png'/>" /> 
	<img class="png msg" src="<c:url value='/static/images/404_msg.png'/>" />
	<p>
		<a href="http://localhost:8090/blog/index?page=1" target="_self">
			<img class="png" src="<c:url value='/static/images/404_to_index.png'/>" />
		</a><%-- 
		<a href="javascript:history.go(-1);">
			<img class="png" src="<c:url value='/static/images/404_to_index.png'/>" />
		</a> --%>
	</p>
</div>
<!--<div id="cloud" class="png"></div>-->
<!-- 代码 结束 -->
</body>
</html>