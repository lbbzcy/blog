<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width;initial-scale=1">
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.min.css'/>">
    <script src="<c:url value='/static/js/jquery-1.11.3.js'/>"></script>
    <script src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/static/ckeditor/ckeditor.js'/>"></script>
    <title>发表博客</title>
</head>
<body>
    <div class="container-fluid" style="padding: 0px;margin: 0px;">
        <div class="col-sm-12">
            <div class="col-sm-offset-2 col-sm-2">
                <!--<img src="" class="logo">-->
            </div>
            <div class="col-sm-offset-8 col-sm-2">
                <div class="dropdown pull-right">
                    <button type="button" class="btn btn-default" onclick="window.location.href='${pageContext.request.contextPath}/index?page=1'">
                        <span class="glyphicon glyphicon-home text-muted"></span>
                    </button>
                    <button type="button" class="btn btn-default dropdown-toggle" id="dropdownMenu" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-align-justify"></span>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu">
                        <!--<li role="presentation"><a role="menuitem" tabindex="-1" href="#">HOME</a></li>-->
                        <div class="media media-middle" style="margin: 15px;">
                            <a class="media-left" href="#">
                                <img style="width: 50px;height: 50px;border: 1px solid #000000;" src="http://localhost:8090/uploadimgs/${param.headPath}" alt="" />
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">用户名</h4>
                                <span class="media-object">${param.userName}</span>
                            </div>
                        </div>
                        <div style="margin: 15px;">
                            <a href="${pageContext.request.contextPath}/user/personalHome?username=${param.userName}" class="pull-left text-muted">个人信息</a>
                            <span class="pull-right"><a href="${pageContext.request.contextPath}/user/handleLogout" class="glyphicon glyphicon-log-out text-muted"></a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-offset-2 col-sm-8">
            <%-- <form role="form" method="post" action="${pageContext.request.contextPath}/blog/handleBlogEdit"> --%>
            	<%-- <input type="hidden" name="userId" value="${param.userId}" /> --%>
                <div class="form-group">
                    <label for="title">文章标题</label>
                    <input name="title" type="text" class="form-control" id="title" placeholder="标题">
                </div>
                <div class="form-group">
                    <label>文章内容</label>
                    <div>
                        <textarea name="content" id="edit" class="ckeditor"></textarea>
                    </div>
              </div>
                <script>
                    CKEDITOR.replace('edit',{
                        language:'zh-cn',
                        uiColor: '#CCEAEE',
                        height:300,
                    });
                    $(function(){
                    	$("#send").click(function (){
                    	var title = $("#title").val();
                    	var content = CKEDITOR.instances.edit.getData();
                    	if(title==""||content==""){
                    		alert("请填写完整");
                    		return false;
                    	}
                    	console.log(CKEDITOR.instances.edit.getData());
                    	$.ajax({
                    		type:"post",
                    		url:"${pageContext.request.contextPath}/blog/handleBlogEdit",
                    		data:{
                    			"title":title,
                    			"content":content,
                    			"userId":"${param.userId}"
                    		},
                    		success:function(data){
                    			if(data.result=="SUCCESS"){
                    				alert("发表成功");
                    				window.location="${pageContext.request.contextPath}/user/personalHome?username=${param.userName}";
                    			}else{
                    				alert("发表失败");
                    			}
                    		}
                    	});
                    });
                    });
                    	
                    	
                </script>
                <div class="form-group">
                    <input type="submit" class="btn btn-info pull-right" id="send" value="发布" />
                </div>
            <!-- </form> -->
        </div>
    </div>
</body>
</html>