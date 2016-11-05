<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!doctype html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>500服务器内部错误~</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/main.css'/>">
<!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body>
<div id="wrapper"><a class="logo" href="/"></a>
  <div id="main">
    <header id="header">
      <h1><span class="icon">!</span>500<span class="sub">SERVER ERROR</span></h1>
    </header>
    <div id="content">
      <h2>抱歉,服务器开小差了~~~</h2>
      <p>当您看到这个页面,表示服务器开小差了,这个错误是由服务器引起的,请您尝试<a class="button right" href="#" onClick="history.go(-1);return true;">返回前一页</a>继续浏览其他内容！</p>
      <div class="utilities">
        <a class="button right" href="#" onClick="history.go(-1);return true;">返回...</a><a class="button right" href="http://localhost:8090/blog/index?page=1">返回首页</a>
        <div class="clear"></div>
      </div>
    </div>
    
  </div>
</div>
</html>