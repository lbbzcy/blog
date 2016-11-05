<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head lang="zh-cn">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="<c:url value='/static/css/bootstrap.min.css'/>" rel="stylesheet">
    <script src="<c:url value='/static/js/jquery-1.11.3.js'/>"></script>
    <script src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
    <title>Index</title>
</head>
<body>
    <div class="container-fluid" style="margin: 0px;padding: 0px;">
        <div class="col-sm-12">
            <div class="col-sm-offset-7 col-sm-3">
				<c:import url="common/headnav.jsp" />
			</div>
        </div>
        <div class="col-sm-12 bg-success">
            <div style="height: 50px;"></div>
            <div class="col-sm-offset-2 col-sm-8">
                <ul class="list-unstyled">
                	<c:forEach items="${pageBean.list}" var="blogs">
	                    <li>
	                        <div class="panel panel-default">
	                            <div class="panel-body">
	                                <div class="media">
	                                    <a class="media-left" href="${pageContext.request.contextPath}/blog/blogDetail?blogId=${blogs.blogId}">
	                                        <img style="width: 100px;height: 100px; border: 1px solid #000000;" src="http://localhost:8090/uploadimgs/${blogs.blogUser.headPath}" alt="...">
	                                        <span class="text-muted">&nbsp;&nbsp;&nbsp;${blogs.blogUser.userName}</span>
	                                    </a>
	
	                                    <div class="media-body">
	                                        <!--<div style="border: 1px solid #EEEEEE;height: 100px;width: 0px;"></div>-->
	                                        <div class="clearfix">
	                                            <a href="${pageContext.request.contextPath}/blog/blogDetail?blogId=${blogs.blogId}" class="text-muted">${blogs.blogTitle}</a>
	                                            <div class="text-right" style="padding: 10px;">
	                                                <span class="text-muted"><fmt:formatDate value="${blogs.publishDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
	                                                <span class="glyphicon glyphicon-eye-open text-muted">${blogs.readCounts==null?0:blogs.readCounts}</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </li>
                    </c:forEach>
                </ul>
                <!--分页-->
                <div class="text-center">
                    <nav>
                        <ul class="pagination">
	                        <c:if test="${pageBean.page!=1}">
	                            <li>
		        	        		<a href="${pageContext.request.contextPath}/index?page=${pageBean.page-1}">上一页</a>
	       	        			</li>
	       	        		</c:if>
       	        			<c:forEach var="i" begin="1" end="${pageBean.totalPage}">
		        	        	<li <c:if test="${i==pageBean.page}">class="active"</c:if>><a href="${pageContext.request.contextPath}/index?page=${i}">${i}</a></li>	
		        	        </c:forEach>
                            
                           	<c:if test="${pageBean.page!=pageBean.totalPage}">
       	        				<li>
       	        					<a href="${pageContext.request.contextPath}/index?page=${pageBean.page+1}">下一页</a>
       	        				</li>
       	        			</c:if>
                        </ul>
                    </nav>
                </div>
            </div>

        </div>


    </div>
</body>
</html>