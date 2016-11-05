<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>登陆</title>
<link href='<c:url value="/static/css/bootstrap.min.css" />'
	rel="stylesheet">
<script src='<c:url value="/static/js/jquery-1.11.3.js" />'></script>
<script src='<c:url value="/static/js/bootstrap.min.js" />'></script>
<script>
	function checkType(){
		var $username = $("#inputUserName").val();
		var $password = $("#inputPassword").val();
		if($username==null||$username==""||$password==null||$password==""){
			alert("请输入用户名和密码");
			return false;
		}
		return true;
	}
	
	$(function() {
		$('#getPassword').on('hidden.bs.modal', function() {
			$('#inputEmail').val('');
		});

		$('#login').click(function() {
			if(checkType()){
				/* location.href = "personal_home.html"; */
				$.ajax({
					url:"${pageContext.request.contextPath}/user/handleLogin",
					type:"post",
					data:{
						"username":$("#inputUserName").val(),
						"password":$("#inputPassword").val()
						
					},
					success : function(data) {
						if(data.result=="FAILURE"){
							alert("用户名或密码出错");
						}else if(data.result=="SUCCESS"){
							window.location="${pageContext.request.contextPath}/index?page=1";
						}
					}
				});
			}
		});
		$("#confirm").click(function(){
			if($("#inputEmail").val()!=""){
				console.log($("#inputEmail").val());
				$.ajax({
					url:"${pageContext.request.contextPath}/user/getPassword",
					type:"post",
					data:{
						"email":$("#inputEmail").val()
					},
					success:function(data){
						if(data.result=="SUCCESS"){
							alert("身份验证已经发送到您的邮箱，请前往邮箱完成密码修改");
						}
					}
				});
			}else{
			console.log($("#inputEmail").val());
				alert("输入您注册 时填写的邮箱");
			}
		});
	});
</script>
</head>
<body class="bg-success">
	<div class="container-fluid">
		<div class="col-sm-12">
			<div class="col-sm-4">
				<!--<img src="images/" >-->
			</div>
			<nav class="navbar col-sm-offset-6 col-sm-4">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="text-primary">登录</span></a></li>
					<li><a href='<c:url value="register" />'><span
							class="text-primary">注册</span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown"> 菜单 <span
							class="glyphicon glyphicon-align-justify"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<c:url value='/index?page=1'/>">主页</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
		<div style="height: 150px;"></div>
		<div class="col-sm-offset-4 col-sm-4">
			<div class="input-group input-group-lg">
				<span class="input-group-addon"><span
					class="glyphicon glyphicon-user"></span></span> <input type="text"
					class="form-control" id="inputUserName" placeholder="用户名">
			</div>
			<div style="height: 20px;" class="has-error">
				
			</div>
			<div class="input-group input-group-lg ">
				<span class="input-group-addon"><span
					class="glyphicon glyphicon-eye-open"></span></span> <input type="password"
					class="form-control" id="inputPassword" placeholder="密码">
			</div>
			<div style="height: 10px;" class="has-error"></div>
			<a href="" class="text-muted pull-right" data-toggle="modal"
				data-target="#getPassword">忘记密码</a><br>
			<div class="modal fade" id="getPassword" tabindex="-1" role="dialog"
				aria-describedby="modalTitle" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span> <span class="sr-only">关闭</span>
							</button>
							<h4 class="modal-title" id="modalTitle">找回密码</h4>
						</div>
						<div class="modal-body">
							<div class="input-group col-sm-12">
								<input type="email" class="form-control" id="inputEmail"
									placeholder="输入您注册 时填写的邮箱">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary" id="confirm">确定</button>
						</div>
					</div>
				</div>

			</div>
			<div style="height: 10px;"></div>
			<button type="button" class="btn btn-primary btn-block btn-lg"
				id="login">登录</button>
		</div>
	</div>
</body>
</html>