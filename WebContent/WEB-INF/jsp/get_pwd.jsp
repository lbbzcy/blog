<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>找回密码</title>
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width;initial-scale=1">
<link href="<c:url value='/static/css/bootstrap.min.css'/>" rel="stylesheet" />
<script src="<c:url value='/static/js/jquery-1.11.3.js'/>"></script>
<script>
	function checkType(){
		var $password = $("#inputNewPassword").val();
		if($password!=""){
			return true;
		}else{
			alert("请输入密码");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container-fluid"  style="padding: 0px; margin: 0px;">
		
		<div class="col-sm-12" 
			style="background-color: #E9E9E9; margin:0px auto; padding: 0px;">

			<!--修改密码-->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">请输入新密码</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/user/handleGetPwd" onsubmit="return checkType();" method="post">
						<div class="form-group">
							<label for="inputOldPassword" class="control-label col-sm-4">邮箱:</label>
							<div class="col-sm-4">
								<input name="email" type="text" class="form-control" value="${email}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="inputNewPassword" class="control-label col-sm-4">新密码:</label>
							<div class="col-sm-4">
								<input name="password" type="password" class="form-control" id="inputNewPassword"
									placeholder="请输入新密码,长度在6-20之间">
							</div>
						</div>
						<div class="form-group">
							<button type="submit"
								class="btn btn-primary control-label col-sm-offset-7">确定</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>