<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:if test="${sessionScope.blogUser==null}">
	<div class="dropdown pull-right">
		<button type="button" class="btn btn-default"
			onclick="window.location.href='${pageContext.request.contextPath}/login'">
			登录</button>
		<button type="button" class="btn btn-default"
			onclick="window.location.href='${pageContext.request.contextPath}/register'">
			注册</button>
		<button type="button" class="btn btn-default"
			onclick="window.location.href='${pageContext.request.contextPath}/index?page=1'">
			主页</button>
	</div>
</c:if>
<c:if test="${sessionScope.blogUser!=null}">
	<div class="dropdown pull-right">
		<button type="button" class="btn btn-default"
			onclick="window.location.href='${pageContext.request.contextPath}/index?page=1'">
			<span class="glyphicon glyphicon-home text-muted"></span>
		</button>
		<button type="button" class="btn btn-default"
			onclick="window.location.href='${pageContext.request.contextPath}/blogEdit?userId=${blogUser.userId}&&userName=${blogUser.userName}&&headPath=${blogUser.headPath}'">
			<span class="glyphicon glyphicon-pencil text-muted"></span>
		</button>
		<button type="button" class="btn btn-default dropdown-toggle"
			id="dropdownMenu" data-toggle="dropdown">
			<span class="glyphicon glyphicon-align-justify"></span>
		</button>
		<div class="dropdown-menu dropdown-menu-right" role="menu"
			aria-labelledby="dropdownMenu">
			<!--<li role="presentation"><a role="menuitem" tabindex="-1" href="#">HOME</a></li>-->
			<div class="media media-middle" style="margin: 15px;">
				<a class="media-left" href="#"> <img
					style="width: 50px; height: 50px；border: 1px solid #000000"
					src="http://localhost:8090/uploadimgs/${blogUser.headPath}" alt="" />

				</a>
				<div class="media-body">
					<h4 class="media-heading">用户名</h4>
					<span class="media-object">${blogUser.userName}</span>
				</div>
			</div>
			<div style="margin: 15px;">
				<a
					href="${pageContext.request.contextPath}/user/personalHome?username=${blogUser.userName}"
					class="pull-left text-muted">个人信息</a> <span class="pull-right"><a
					href="${pageContext.request.contextPath}/user/handleLogout"
					class="glyphicon glyphicon-log-out text-muted"></a></span>
			</div>
		</div>
	</div>
</c:if>