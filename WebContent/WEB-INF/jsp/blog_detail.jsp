<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>Detail</title>
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="<c:url value='/static/css/bootstrap.min.css'/>"
	rel="stylesheet">
<script src="<c:url value='/static/js/jquery-1.11.3.js'/>"></script>
<script src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
</head>
<body>
	<div class="container-fluid" style="padding: 0px; margin: 0px;">
		<div class="col-sm-12">
			<div class="col-sm-offset-8 col-sm-3">
				<c:import url="common/headnav.jsp" />
			</div>
		</div>

		<div class="col-sm-12 bg-success">
			<div style="height: 50px;"></div>
			<div class="col-sm-offset-1 col-sm-2">
				<div class="panel panel-default">
					<div class="panel-heading">博主信息</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-12">
								<div class="thumbnail">
									<!--<div style="width: 100px;height: 100px;border: 1px solid #EEEEEE">-->
									<img
										src="http://localhost:8090/uploadimgs/${blog.blogUser.headPath}"
										alt="...">
									<!--</div>-->
									<div class="caption text-center">
										${blog.blogUser.userName}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<!--内容详情-->
				<div class="panel panel-default">
					<div class="panel-body">
						<div>
							<div>
								<h3>${blog.blogTitle}</h3>
								<div class="text-right">
									<span><fmt:formatDate value="${blog.publishDate}"
											pattern="yyyy-MM-dd HH:mm:ss" /> &nbsp;&nbsp;</span> <span
										class="glyphicon glyphicon-eye-open">${blog.readCounts==null?0:blog.readCounts}人阅读&nbsp;</span>
									<span class="glyphicon glyphicon-comment">评论${blog.commentCounts==null?0:blog.commentCounts}人</span>
								</div>
							</div>
							<hr>
							<div>${blog.blogContent}</div>
						</div>
					</div>
				</div>
				<!--查看评论-->
				<div class="panel panel-default">
					<div class="panel-body">
						<div>
							<strong>查看评论</strong>
							<hr>
							<ul class="media-list">
								<c:if test="${comments!=null}">
									<c:forEach items="${comments}" var="c">
										<li class="media"><a class="media-left" href="#"> <img
												alt="64x64" style="width: 64px; height: 64px;"
												src="http://localhost:8090/uploadimgs/${c.blogUser.headPath}" data-holder-rendered="true">
										</a>
											<div class="media-body">
												<span class="pull-right text-muted">${c.blogUser.userName}&nbsp;<fmt:formatDate value="${c.commentDate}" pattern="yyyy-MM-dd HH:mm:ss"/> 发表</span>
												<h5 class="media-heading"></h5>
												<p>
													${c.commentContent}
												</p><!-- 
												<p>
													<span class="pull-right text-muted"><a href="#">回复</a></span>
												</p> -->
												<p><hr></p>
												
												
											</div></li>
										<li class="divider"></li>
									</c:forEach>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				<!--发表评论-->
				<div class="panel panel-default">
					<div class="panel-body">
						<div>
							<script>
								function checkIsLogin() {
									console.log($("#content"));
									if ($("#content").val() == "") {
										alert("请输入评论");
										return false;
									} else {
										$.ajax({
													type : "post",
													url : "${pageContext.request.contextPath}/blog/checkIsLogin",
													success : function(data) {
														if (data.result == "FAILURE") {
															//alert("您还没有登录，请先登录");
															window.location = "${pageContext.request.contextPath}/login";
														}
													}
												});
									}
								}
							</script>
							<strong>发表评论</strong>
							<hr>
							<form class="col-sm-12" role="form"
								action="${pageContext.request.contextPath}/blog/handleBlogComment"
								method="post">
								<input type="hidden" name="blogId" value="${blog.blogId}" />
								<div class="form-group col-sm-12">
									<label class="control-label col-sm-2">用户名:</label> <label
										class="control-label">${blogUser.userName}</label>
								</div>
								<div class="form-group col-sm-12">
									<label class="control-label col-sm-2">评论内容:</label> <span
										class="glyphicon glyphicon-file"></span>
								</div>
								<div class="form-group col-sm-12">
									<textarea id="content" name="commentContent"
										class="col-sm-offset-2 col-sm-10" rows="5"></textarea>
								</div>
								<div class="form-group col-sm-12">
									<button class="col-sm-offset-2 col-sm-1 btn btn-default"
										onclick="return checkIsLogin();">提交</button>
								</div>
							</form>
						</div>
					</div>
				</div>


			</div>

		</div>
	</div>
</body>
</html>