<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/sensorValue/sensorValue-list.js"></script>
</head>
<body background="${pageContext.request.contextPath}/image/body-bg.png">

<div class="container" style=" width: 100%;height: 100%;">
	<form id="listForm" action="sensorValue/list" method="post">
		<input type="hidden" id="start" name="start" value="${start}" />
	</form>
	<a href="sensorValue/exportExcel" class="btn btn-primary">导出</a>
	<table class="table">
		<thead>
			<tr>
				<th>序号</th>
				<th>设备名称</th>
				<th>报警时间</th>
				<th>楼层</th>
				<th>楼栋</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.items }" var="item" varStatus="stat">
				<tr>
					<td>${stat.count }</td>
					<td>${item.sensor.name }</td>
					<td><fmt:formatDate value="${item.createTime }" type="both" /></td>
					<td>${item.sensor.floor.name }</td>
					<td>${item.sensor.floor.building.name }</td>
					<td>${item.isHandle == 0 ? '未处理' : '已处理' }</td>
					<td>
						<c:if test="${item.isHandle == 0}">
							<button class="btn btn-primary" onclick="changeHandle('${item.id}')">处理</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination">
		<li><a href="javascript:void(0);" onclick="paging('0')">首页</a></li>
        <li><a href="javascript:void(0);" onclick="paging('${page.prePage<=1?0:page.start-page.limit }')">上一页</a></li>
        <li><a href="javascript:void(0);" onclick="paging('${page.nextPage==1 ? page.start : (page.nextPage-1)*page.limit }')">下一页</a></li>
        <li><a href="javascript:void(0);" onclick="paging('${page.totalPages>1 ? (page.totalPages-1)*page.limit : page.start }')">末页</a></li>  
        <li><a href="javascript:void(0);" style="color: black;cursor: default;">第${page.pageNumber }页</a></li>
        <li><a href="javascript:void(0);" style="color: black;cursor: default;">共${page.totalPages }页</a></li>
        <li><a href="javascript:void(0);" style="color: black;cursor: default;">共${page.total }条记录</a></li>
	</ul>
</div>
</body>
</html>