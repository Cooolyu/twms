<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>登录</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/adminia.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/adminia-responsive.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/validate/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/validate/localization/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/user/login.js"></script>
</head>
<body>
	<!-- 导航栏开始 -->
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container" style="margin-left: 5%">
			<!-- <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 				
			</a> -->
			<a class="brand" href="javascript:void(0)">国科基于IBMS的机房温湿度监测系统软件V1.0</a>
			<div class="nav-collapse">
				<ul class="nav pull-right">
					<li class="">
						<!-- <a href="javascript:;"><i class="icon-chevron-left"></i></a> -->
					</li>
				</ul>
			</div> <!-- /nav-collapse -->
		</div> <!-- /container -->
	</div> <!-- /navbar-inner -->
</div> <!-- /navbar -->
<!-- 导航栏结束 -->
<!-- 登录模块开始 -->
<div id="login-container">
	<div id="login-header">
		<h3>登录</h3>
	</div> <!-- /login-header -->
	<div id="login-content" class="clearfix">
	<form action="user/login" method="post">
		<input type="hidden" id="flag" value="${flag}"/>
		<fieldset>
			<div class="control-group">
				<label class="control-label" for="username">用户名</label>
				<div class="controls">
					<input type="text" id="name" name="name" class="required" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="password">密码</label>
				<div class="controls">
					<input type="password" id="password" name="password" class="required"/>
				</div>
			</div>
		</fieldset>
		<div class="pull-right">
			<button type="submit" class="btn btn-warning btn-large">登录</button>
		</div>
	</form>
</div>
<!-- 登录模块结束 -->
<div id="login-extra">
	<p>版权所有&copy;苏州国科综合数据中心有限公司&nbsp;2015&nbsp;网址：<a href="http://www.sisdc.com.cn">www.sisdc.com.cn</a></p>
</div>
</div>
	
	
</body>
</html>