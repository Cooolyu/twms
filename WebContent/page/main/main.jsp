<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理页面</title>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/adminia.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/adminia-responsive.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/main/main.js"></script>
</head>
<body style="overflow: hidden">
<!-- 导航栏开始 -->
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
	<img alt="" src="${pageContext.request.contextPath}/image/LOGO1.png" width="40" style="float:left"/>
		<div class="container" style="margin-left: 0%">
			<a class="brand" href="javascript:void(0)">国科基于IBMS的机房温度分析系统</a>
		</div>
	</div>
</div>
<!-- 主体部分开始 -->
<div id="content">
	<div class="container">
		<div class="row" style="margin-right:0px">
			<!-- 左侧导航开始 -->
			<div class="span2">
				<div class="account-container">
					<div class="account-avatar">
						<img src="${pageContext.request.contextPath}/image/admin.jpg" alt="" class="thumbnail" />
					</div>
					<form action="">
					<div class="account-details">
						<span class="account-name">${LOGININFO.name}</span>
						<span class="account-role">接待员</span>
						<span class="account-actions">
							<!-- <a href="javascript:void(0)" onclick="goMenu('/admin/goPwdChange',this)">修改密码</a> | -->
							
							<a href="user/logOut">注销</a>
						</span>
					
					</div> <!-- /account-details -->
					</form>
				</div> <!-- /account-container -->
				<hr />
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					<li class="active">
						<a href="javascript:void(0)" onclick="goMenu('building/list',this)">
							<i class=""></i>
							楼栋控制
						</a>
					<li>
						<a href="javascript:void(0)" onclick="goMenu('floor/list',this)">
							<i class=""></i>
							楼层控制
						</a>
					<li>
						<a href="javascript:void(0)" onclick="goMenu('sensor/list',this)">
							<i class=""></i>
							设备编辑
						</a>
					<li>
						<a href="javascript:void(0)" onclick="goMenu('sensor/view',this)">
							<i class=""></i>
							设备控制
						</a>
					<li>
						<a href="javascript:void(0)" onclick="goMenu('sensorValue/list',this)">
							<i class=""></i>
							报警列表
						</a>
					<!-- <li>
						<a href="javascript:void(0)" onclick="goMenu('sensorValue/chart',this)">
							<i class=""></i>
							报警图表
						</a> -->
				</ul>	
				<hr />
				<div class="sidebar-extra">
				</div>
				<br />
			</div> <!-- /span3 -->
			<!-- 左侧导航结束 -->
			<!-- 右侧内容区域开始 -->
			<div class="span10">
				<iframe id="mainFrame" width="1000" height="500" src="building/list" frameborder="0" >
				</iframe>
			</div>
			<!-- 右侧内容区域结束 -->
		</div>
	</div>
</div>
<!-- 主体部分结束 -->
<!-- 页尾开始 -->
<div id="footer">
	<div class="container">				
		<hr />
		<p align="center">版权所有&copy;苏州国科综合数据中心有限公司&nbsp;2015&nbsp;网址：<a href="http://www.sisdc.com.cn">www.sisdc.com.cn</a></p>
	</div>
</div>
<!-- 页尾结束 -->
  </body>
</html>