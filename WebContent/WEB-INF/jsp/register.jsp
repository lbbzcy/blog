<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head lang="zh-cn">
    <meta charset="UTF-8">
    <title>注册</title>
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="<c:url value='/static/css/bootstrap.min.css' />" rel="stylesheet">
    <style type="text/css">
    	.interval{
    		height:20px;
    		margin:2px 50px;
   		}
    	.error{
    		color:red;
    		line-height:20px;
    	}
    	.success{
    		color:green;
    		line-height:20px;
    	}
    </style>
    <script src="<c:url value='/static/js/jquery-1.11.3.js'/>"></script>
    <script src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
    <script type="text/javascript">
    	 /* $(function(){
    		$("#sign").click(function(){
    			if(checkType()){
    				$.ajax({
    					type:"post",
    					url:"${pageContext.request.contextPath}/user/register",
    					data:{
    						"username":$("#inputUserName").val(),
    						"email":$("#inputEmail").val(),
    						"password":$("#inputPassword").val()
    					},
    					success:function(data){
    						window.location = "${pageContext.request.contextPath}/user/login";
    					}
    				});
    			}
    		});
    	});   */
    	/* 对用户输入的信息进行检验 */
		/* 对用户名进行检验 长度3-20 数字、字母、下载线*/
		/* QQ:[1-9]([0-9]{5,11}) */
    	function checkUserName(){
			var result = true;
    		var username = $("#inputUserName").val();
    		var regexusername = /^[A-Za-z0-9_\-\u4e00-\u9fa5]{3,20}$/;
    		if(!regexusername.test(username)){
    			$("#checkusername").html("用户名格式错误，长度在3-20之间，英文、字母、下划线");
    			result = false;
    		}else{
   				$.ajax({
   					async: false,
       				type:"post",
       				url:"${pageContext.request.contextPath}/user/checkUser",
       				data:{
       					"username":$("#inputUserName").val(),
       				},
       				dataType:"json",
       				success:function(data){
       					if(data.result=="SUCCESS"){
       						$("#checkusername").html("<span class='glyphicon glyphicon-ok success'></span>");
       						result = true;
       					}else{
       						$("#checkusername").html(data.result);
       						result = false;
       					}
       				}
       			});
    		}
    		return result;
    	}
    	/* 对邮箱格式进行检验 */
    	function checkEmail(){
    		var result = true;
    		var email = $("#inputEmail").val();
    		var regexemail = /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/;
    		if(!regexemail.test(email)){
    			$("#checkemail").html("邮箱格式错误，请输入正确 的邮箱");
    			result = false;
    		}else{
    			$.ajax({
   					async: false,
       				type:"post",
       				url:"${pageContext.request.contextPath}/user/checkEmail",
       				data:{
       					"email":$("#inputEmail").val()
       				},
       				dataType:"json",
       				success:function(data){
       					if(data.result=="SUCCESS"){
       						$("#checkemail").html("<span class='glyphicon glyphicon-ok success'></span>");
       						result = true;
       					}else{
       						$("#checkemail").html(data.result);
       						result = false;
       					}
       				}
       			});
    		}
    		return result;
    	}
    	/* 对密码进行验证,长度为6-20 */
    	function checkPassword(){
    		var password = $("#inputPassword").val();
    		var regexpwd = /^.{6,20}$/;
    		if(!regexpwd.test(password)){
    			$("#checkpassword").html("密码格式错误，长度在6-20之间");
    			return false;
    		}
    		$("#checkpassword").html("<span class='glyphicon glyphicon-ok success'></span>");
    		return true;
    	}
    	function checkRePwd(){
    		var password = $("#inputPassword").val();
    		var password1 = $("#inputPassword1").val();
    		var regexpwd = /^.{6,20}$/;
    		if(!regexpwd.test(password1)||password!=password1){
    			$("#checkrepetpwd").html("两次输入的密码不一致");
    			return false;
    		}
    		$("#checkrepetpwd").html("<span class='glyphicon glyphicon-ok success'></span>");
    		return true;
    	}
    	/* 验证用户输入是否合法 */
    	function checkType(){
			if(checkUserName()&&checkEmail()&&checkPassword()&&checkRePwd()){
				return true;
			}else{
				return false;
			}
    	}
    </script>
</head>
<body class="bg-success">
<div class="container-fluid">
    <div class="col-sm-12" >
        <div class="col-sm-4">
            <!--<img src="images/" >-->
        </div>
        <nav class="navbar col-sm-offset-6 col-sm-4">
            <ul class="nav navbar-nav navbar-right">
                <li><a href='<c:url value= "login" />'><span class="text-primary">登录</span></a></li>
                <li><a href='<c:url value="#" />'><span class="text-primary">注册</span></a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown">
                         	菜单 <span class="glyphicon glyphicon-align-justify"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href='<c:url value="/index?page=1" />'>主页</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
    <div style="height: 150px;"></div>
    <form method="post" action="${pageContext.request.contextPath}/user/handleRegister" onsubmit="return checkType();">
	    <div class="col-sm-offset-3 col-sm-6">
	        <div class="input-group">
	            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
	            <input name="username" type="text" class="form-control" id="inputUserName" placeholder="请输入用户名" onblur="checkUserName();">
	        </div>
	        <div class="interval">
	        	<span class="error" id="checkusername"></span>
	        </div>
	        <div class="input-group">
	            <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
	            <input name="email" type="email" class="form-control" id="inputEmail" placeholder="请输入邮箱" onblur="checkEmail();">
	        </div>
	        <div class="interval">
	        	<span class="error" id="checkemail"></span>
	        </div>
	        <div class="input-group">
	            <span class="input-group-addon"><span class="glyphicon glyphicon-eye-open"></span></span>
	            <input name="password" type="password" class="form-control" id="inputPassword" placeholder="请输入密码" onblur="checkPassword();">
	        </div>
	        <div class="interval">
	        	<span class="error" id="checkpassword"></span>
	        </div>
	        <div class="input-group">
	            <span class="input-group-addon"><span class="glyphicon glyphicon-eye-open"></span></span>
	            <input type="password" class="form-control" id="inputPassword1" placeholder="请再次输入密码" onblur="checkRePwd();">
	        </div>
	        <div class="interval">
	        	<span class="error" id="checkrepetpwd"></span>
	        </div>
	    </div>
	    <div class="col-sm-offset-4 col-sm-4">
	        <input type="submit" class="btn btn-primary btn-block" id="sign" value="注册" />
	    </div>
    </form>
</div>
</body>
</html>