<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>个人信息修改</title>
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="<c:url value='/static/css/bootstrap.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/static/css/fileinput.css' />" media="all" rel="stylesheet" type="text/css" />
    <link href="<c:url value='/static/css/bootstrap-datetimepicker.min.css'/>" rel="stylesheet" />
    <script src="<c:url value='/static/js/jquery-1.11.3.js'/>"></script>
    <script src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/static/js/fileinput.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/static/js/bootstrap-datetimepicker.js'/>" charset="utf-8"></script>
    <script src="<c:url value='/static/js/zh.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/static/js/bootstrap-datetimepicker.zh-CN.js'/>"></script>
    <style>
    	p>span{
    		font-size:16px;
    	}
    </style>
    <script>
    	//对修改密码时输入的判断
    	function checkModiPwd(){
    		var $oldpassword = $("#inputOldPassword").val();
    		var $newpassword = $("#inputNewPassword").val();
    		var $repeatpassword = $("#inputRepeatPassword").val();
    		var regexpwd = /^.{6,20}$/;
    		if($oldpassword==""||$newpassword==""||$repeatpassword==""){
    			alert("请填写完整修改密码的相关信息");
    			return false;
    		}else if(!regexpwd.test($newpassword)){
    			alert("密码格式错误，长度在6-20之间");
    			return false;
    		}else if($repeatpassword!=$newpassword){
    			alert("两次输入的密码不一致");
    			return false;
    		}else{
    			return true;
    		}
    	}
    </script>
</head>
<body>
    <div class="container-fluid" style="padding: 0px;margin: 0px;">
        <div class="col-sm-12">
            <div class="col-sm-offset-2 col-sm-2">
                <!--<img src="" class="logo">-->
            </div>
            <div class="col-sm-offset-4 col-sm-2">
                <div class="dropdown pull-right">
                    <button type="button" class="btn btn-default" onclick="window.location.href='${pageContext.request.contextPath}/index?page=1'">
                          <span class="glyphicon glyphicon-home text-muted"></span>
                    </button>
                    <button type="button" class="btn btn-default" onclick="window.location.href='${pageContext.request.contextPath}/blogEdit?userId=${blogUser.userId}&&userName=${blogUser.userName}&&headPath=${blogUser.headPath}'">
                        <span class="glyphicon glyphicon-pencil text-muted"></span>
                    </button>
                    <button type="button" class="btn btn-default dropdown-toggle" id="dropdownMenu" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-align-justify"></span>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu">
                        <!--<li role="presentation"><a role="menuitem" tabindex="-1" href="#">HOME</a></li>-->
                        <div class="media media-middle" style="margin: 15px;">
                            <a class="media-left" href="#">
                                <img style="width: 50px;height: 50px;border: 1px solid #000000;" src="http://localhost:8090/uploadimgs/${blogUser.headPath}" alt="" />
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">用户名</h4>
                                <span class="media-object">${blogUser.userName}</span>
                            </div>
                        </div>
                        <div style="margin: 15px;">
                            <a href="#" class="pull-left text-muted">个人信息</a>
                            <span class="pull-right"><a href="${pageContext.request.contextPath}/user/handleLogout" class="glyphicon glyphicon-log-out text-muted"></a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-12" style="background-color: #E9E9E9;margin: 0px;padding: 0px;">

            <div class="col-sm-offset-2 col-sm-8">
                <div style="height: 20px;"></div>
                <!--个人资料-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">个人资料</h3>
                    </div>
                    <div class="panel-body">
                        <div class="media">
                            <a href="#" class="pull-right" data-toggle="modal" data-target="#modifyInfo">
                                <span class="glyphicon glyphicon-edit"></span>
                            </a>
                            <div class="modal fade" id="modifyInfo" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">
                                                <span>&times;</span>
                                            </button>
                                            <h4 class="modal-title">修改信息</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal" role="form" action="" method="post">
                                                <div class="form-group">
                                                    <label for="inputUserName" class="control-label col-sm-2">用户名</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="inputUserName" value="${blogUser.userName}" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputNickName" class="control-label col-sm-2">昵称:</label>
                                                    <div class="col-sm-4">
                                                        <input name="nickName" type="text" class="form-control" id="inputNickName" value="${blogUser.nickName}">
                                                    </div>
                                                    <label class="control-label col-sm-2">性别:</label>
                                                    <div class="col-sm-4">
                                                        <div class="radio-inline">
                                                            <label>
                                                                <input type="radio" name="gender" id="sex1" value="M" <c:if test="${blogUser.gender=='M'}">checked</c:if>>
                                                                 	男
                                                            </label>
                                                        </div>
                                                        <div class="radio-inline">
                                                            <label>
                                                                <input type="radio" name="gender" id="sex2" value="F" <c:if test="${blogUser.gender=='F'}">checked</c:if>>
                                                                	女
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputBirthday" class="control-label col-sm-2">生日:</label>
                                                    <div class="col-sm-8 input-group date form_datetime" data-date-format="yyyy-mm-dd" data-date="">
                                                        <input name="birthday" id="inputBirthday" class="form-control" type="text" readonly value="<fmt:formatDate value='${blogUser.birthday}' pattern="yyyy-MM-dd"/>" size="16">
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                                    </div>
                                                </div>
                                                <script type="text/javascript">
                                                    $(".form_datetime").datetimepicker({
                                                        /*format: "yyyy-MM-dd",
                                                         minView:"month",
                                                         language:"zh-CN",
                                                         showMeridian: true,
                                                         autoclose: true,
                                                         todayBtn: true*/
                                                        format: "yyyy-mm-dd",
                                                        language: 'zh-CN',
                                                        weekStart: 1,
                                                        todayBtn: 1,
                                                        autoclose: 1,
                                                        todayHighlight: 1,
                                                        startView: 2,
                                                        minView: 2,
                                                        forceParse: 0
                                                    });
                                                </script>
                                                <div class="form-group">
                                                    <label for="inputQQ" class="control-label col-sm-2">QQ:</label>
                                                    <div class="col-sm-4">
                                                        <input name="qq" type="text" class="form-control" id="inputQQ" value="${blogUser.qq}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-2">爱好:</label>
                                                    <div class="col-sm-8">
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="hobby" value="1" <c:forEach items="${blogUser.hobbyList}" var="hobbies"><c:if test="${hobbies.hobbyId==1}">checked</c:if></c:forEach>>看书
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="hobby" value="2" <c:forEach items="${blogUser.hobbyList}" var="hobbies"><c:if test="${hobbies.hobbyId==2}">checked</c:if></c:forEach>>跑步
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="hobby" value="3" <c:forEach items="${blogUser.hobbyList}" var="hobbies"><c:if test="${hobbies.hobbyId==3}">checked</c:if></c:forEach>>篮球
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="hobby" value="4" <c:forEach items="${blogUser.hobbyList}" var="hobbies"><c:if test="${hobbies.hobbyId==4}">checked</c:if></c:forEach>>足球
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="hobby" value="5" <c:forEach items="${blogUser.hobbyList}" var="hobbies"><c:if test="${hobbies.hobbyId==5}">checked</c:if></c:forEach>>摄影
                                                        </label>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                            <button type="button" class="btn btn-primary" id="modiUserInfo">确定</button>
                                        </div>
                                        <script>
                                        	$(function(){
                                        		$('#modifyInfo').on('hidden.bs.modal', function() {
													$("#inputNickName").val("${blogUser.nickName}");
													$("#inputBirthday").val("<fmt:formatDate value='${blogUser.birthday}' pattern="yyyy-MM-dd"/>");
													$("#inputQQ").val("${blogUser.qq}");
													console.log("${blogUser.gender}");
													if("${blogUser.gender}"=="M"){
														$("#sex1").prop("checked","checked");
														$("#sex2").prop("checked","");
														console.log($("#sex1").prop("checked"));
													}else if("${blogUser.gender}"=="F"){
														$("#sex1").prop("checked","");
														$("#sex2").prop("checked","checked");
													}else{
														$("#sex1").prop("checked","");
														$("#sex2").prop("checked","");
													}
													for(var i=0;i<5;i++){
														$("input[type=checkbox][name=hobby]").get(i).checked=false;
													}
													<c:forEach items="${blogUser.hobbyList}" var="hobbies">
														var i = parseInt("${hobbies.hobbyId}") - 1;
														console.log(i);
														$("input[type=checkbox][name=hobby]").get(i).checked=true;
													</c:forEach>
												});
                                        		$("#modiUserInfo").click(function (){
                                        			var nickName = $("#inputNickName").val();
                                        			var gender = $("input:radio[name=gender]:checked").val();
                                        			var birthday = $("#inputBirthday").val();
                                        			var qq = $("#inputQQ").val();
                                        			var hobbies = "";
                                        			$("input:checkbox[name=hobby]:checked").each(function (i){
                                        				if(0==i){
                                        					hobbies = $(this).val();
                                        				}else{
                                        					hobbies += (","+$(this).val());
                                        				}
                                        				
                                        			});
                                        			if(nickName==""||gender==""||birthday==""||qq==""||hobbies==""){
                                        				alert("请填写完整信息");
                                        				return false;
                                        			}
                                        			/* 对用户输入的信息进行检验 */
													/* 对用户名进行检验 长度3-20 数字、字母、下载线、中文*/
													/* QQ:[1-9]([0-9]{5,11}) */
													var regexnickname = /^[A-Za-z0-9_\-\u4e00-\u9fa5]{3,20}$/;
													var regexqq = /^[1-9]([0-9]{5,11})$/;
													if(!regexnickname.test(nickName)){
														alert("昵称格式错误,长度3-20 数字、字母、下载线或中文");
														return false;
													}
													if(!regexqq.test(qq)){
														alert("qq输入错误，请输入正确的qq");
														return false;
													}
													$.ajax({
														type:"post",
														url:"${pageContext.request.contextPath}/user/handleModiInfo",
														data:{
															"userId":"${blogUser.userId}",
															"nickName":nickName,
															"gender":gender,
															"birthday":birthday,
															"qq":qq,
															"hobbies":hobbies
														},
														success:function(data){
															if(data.result=="SUCCESS"){
																alert("修改成功");
																window.location="${pageContext.request.contextPath}/user/personalHome?username=${blogUser.userName}";
															}else{
																alert("修改失败");
															}
														}
													});
                                        			console.log(nickName+","+gender+","+birthday+","+qq+","+hobbies);
                                        		});
                                        	});
                                        </script>
                                    </div>
                                </div>
                            </div>
                            <div class="media-left">
                                <!--<img />-->
                                <img src="http://localhost:8090/uploadimgs/${blogUser.headPath}"  data-toggle="modal" data-target="#headImg" style="height:150px;width: 150px;border: 1px solid #2aabd2;" />
                                <!--修改头像-->
                                <div class="modal" id="headImg" role="dialog" tabindex="-1">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                        <form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/user/uploadImg;">
                                        	<input name="userId" type="hidden" value="${blogUser.userId}"/>
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                                <h4 class="modal-title">修改头像</h4>
                                            </div>
                                            <div class="modal-body">
                                                    <div class="form-group">
                                                        <input name="file" id="file" type="file" class="file">
                                                        <p>温馨提示:只允许上传.jpg .gif .png后缀的图片</p>
                                                        <p style="color:green;">(请务必上传真实证件照或图片 否则不允许通过)</p>
                                                    </div>
                                               
                                            </div>
                                            <!-- <script>
                                                $("#file").fileinput({
                                                    uploadUrl: '#', // you must set a valid URL here else you will get an error
                                                    allowedFileExtensions : ['jpg', 'png','gif'],
                                                    overwriteInitial: true,
                                                    maxFileSize: 1000,
//                                                    maxFilesNum: 10,
                                                    language:'zh',
                                                    //allowedFileTypes: ['image', 'video', 'flash'],
                                                    slugCallback: function(filename) {
                                                        return filename.replace('(', '_').replace(']', '_');
                                                    }
                                                });
                                            </script> -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                                <input type="submit" class="btn btn-primary" value="确定" onclick="return uploadImages();">
                                            </div>
                                            <script>
                                            	function uploadImages(){
                                            		var str =$("#file").val();
                                            		if(str.length!=0){
                                            			var reg = ".*\\.(jpg|png|gif|bmp|JPG|PNG|GIF|BMP)";
                                            			var r = str.match(reg);
                                            			if(r==null){
                                            				alert("对不起,您的图片格式不正确,请重新上传");
                                            				return false;
                                            			}else{
                                            				if(window.ActiveXObject){
                                            					var image = new Image();
                                            					image.dysrc = str;
                                            					if(image.fileSize>5243000){
                                            						alert("上传的图片大小不能超过5M,请重新上传");
                                            						return false;
                                            					}
                                            				}else{
                                            					var size = document.getElementById("file").files[0].size;
                                            					if(size>5243000){
                                            						alert("上传的图片大小不能超过5M,请重新上传");
                                            						return false;
                                            					}
                                            				}
                                            			}
                                            		}else{
                                            			alert("请先上传图片");
                                            			return false;
                                            		}
                                            	}
                                            </script>
                                             </form>
                                        </div>
                                    </div>
                                </div>
                                <div style="padding: 5px;">
                                	<script type="text/javascript">
                                		$(function (){
                                			var modiImgPwd = "${param.modiImgPwd}";
                                			var modiPwdmsg = "${param.modiPwdmsg}";
                                			console.log(modiImgPwd);
                                			if(modiImgPwd!=""){
                                				alert(modiImgPwd);
                                			}
                                			if(modiPwdmsg!=""){
                                				alert(modiPwdmsg);
                                			}
                                		});
                                	</script>
                                    <a href="#" class="pull-left text-muted">
                                        	关注<span class="badge">3</span>
                                    </a>
                                    <a href="#" class="pull-right text-muted">
                                        	粉丝<span class="badge">0</span>
                                    </a>
                                </div>
                            </div>
                            <div class="media-body" style="padding: 20px;">
                                <div>
                                    <p class="col-sm-12"><span>${blogUser.userName}</span></p>
                                    <p class="col-sm-12">
                                        <span class="col-sm-4">昵称:${blogUser.nickName}</span>
                                        <span class="col-sm-3">性别:
	                                        <c:if test="${blogUser.gender=='M'}">
	                                        	男
	                                        </c:if>
	                                        <c:if test="${blogUser.gender=='F'}">
	                                        	女
	                                        </c:if>
                                        </span>
                                        <span class="col-sm-5">生日:<fmt:formatDate value="${blogUser.birthday}" pattern="yyyy年MM月dd日"/></span>
                                     </p>
                                     <p class="col-sm-12">
                                        <span class="col-sm-4">QQ:${blogUser.qq}</span>
                                        <span class="col-sm-6">邮箱:${blogUser.email}</span>
                                    </p>
                                    <p class="col-sm-12">
                                    	<span class="col-sm-12">爱好:<c:forEach var="hobbies" items="${blogUser.hobbyList}">${hobbies.hobbyName}&nbsp;&nbsp;</c:forEach></span>
                                    </p>
                                </div>
                                <hr>
                                <div></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--修改密码-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">修改密码</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath}/user/handleModifyPwd" onsubmit="return checkModiPwd();">
                        	<input name="userId" type="hidden" value="${blogUser.userId}"/>
                            <div class="form-group">
                                <label for="inputOldPassword" class="control-label col-sm-2">原密码:</label>
                                <div class="col-sm-4">
                                    <input name="oldPassword" type="password" class="form-control" id="inputOldPassword" placeholder="原密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputNewPassword" class="control-label col-sm-2">新密码:</label>
                                <div class="col-sm-4">
                                    <input name="newPassword" type="password" class="form-control" id="inputNewPassword" placeholder="新密码">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="inputRepeatPassword" class="control-label col-sm-2">重复密码:</label>
                                <div class="col-sm-4">
                                    <input type="password" class="form-control col-sm-8" id="inputRepeatPassword" placeholder="重复密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-primary control-label col-sm-offset-5" value="修改" />
                            </div>
                        </form>
                    </div>
                </div>
                <!--我的博客-->
                <div class="panel panel-default">
                    <ul class="nav nav-tabs nav-justified" role="tablist" id="myTab">
                        <li role="presentation" class="active"><a href="#myPublish">我的发布</a></li>
                        <li role="presentation"><a href="#myComment">我的评论</a></li>
                    </ul>
                    <div class="panel-body">
                        <!--<ul class="list-group">
                            <li class="list-group-item">
                                <span class="pull-right">2016-09-25 09:10</span>
                                发布了博客<a>博客标题</a>
                            </li>
                            <li class="list-group-item">aa</li>
                            <li class="list-group-item">aa</li>
                        </ul>-->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="myPublish">
                                <ul class="list-group">
                                	<c:forEach var="blogs" items="${blogUser.blogList}">
                                		<li class="list-group-item">
                                        <span class="pull-right"><fmt:formatDate value="${blogs.publishDate}" pattern="yyyy-MM-dd HH:mm"/></span>
                                        		我发布了博客<a href="${pageContext.request.contextPath}/blog/blogDetail?blogId=${blogs.blogId}">${blogs.blogTitle}</a>
                                    </li>
                                	</c:forEach>
                                </ul>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="myComment">
                                <ul class="list-group">
                                	<c:forEach items="${blogs}" var="blog">
                                    <li class="list-group-item">
                                        <span class="pull-right">
                                        	<fmt:formatDate value="${blog.commentDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </span>
                                        	我评论了博客<a href="${pageContext.request.contextPath}/blog/blogDetail?blogId=${blog.blog.blogId}">${blog.blog.blogTitle}</a><br>
                                    </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <script>
                            /*$(function () {
                               $('#myTab a[href="#myComment"]').tab('show')
                            });*/
                            $('#myTab a').click(function (e) {
                                e.preventDefault();
                                $(this).tab('show');
                            })
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>