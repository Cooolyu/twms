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
<title>主页</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/validate/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/validate/localization/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/floor/floor-list.js"></script>
<style type="text/css">
.input_size{
	width: 150px;
	height: 25px;
}
.but_size{
	width: 80px;
	height: 25px;
	padding: 0;
}
</style>
</head>
<body background="${pageContext.request.contextPath}/image/body-bg.png">

<div class="container" style="width: 100%;height: 100%;">
	<form id="listForm" action="floor/list" method="post">
		<input type="hidden" name="statr" value="${start}" />
		<input type="hidden" id="building_id" name="buildingId" value="${buildingId}">
	</form>
	<div style="margin-top: 15px;">
		<form id="saveForm" class="form-inline" action="floor/save" method="post" enctype="multipart/form-data" target="saveFrame">
			<div class="form-group">
				<label>楼栋名称：</label>
				<select id="buildingId" name="buildingId" class="input_size required" onchange="buildingChange()" >
					<c:forEach items="${buildings}" var="building">
						<c:choose>
							<c:when test="${building.id == buildingId}">
								<option value="${building.id}" selected="selected">${building.name}</option>
							</c:when>
							<c:otherwise>
								<option value="${building.id}">${building.name}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label>楼层名称：</label>
					<input type="hidden" id="floorId" name="id"/>
					<input type="text" id="floorName" name="name" class="input_size required"/>
			</div>
			<div class="form-group">
				<label>楼层图上传：</label>
			</div>
			<div class="form-group">
					<input type="file" id="floorPath" name="file" class="input_size required"/>
			</div>
			<div class="form-group">
				<button type="button" id="floorSave" class="btn btn-primary but_size" onclick="save()">添加</button>
			</div>
		</form>
		<iframe style="width:0; height:0; margin-top:-10px;" name="saveFrame" src="about:blank"></iframe>
	</div>
	<table class="table" style="border-top: solid #ccc 1px;margin-top: 10px; padding-top: 10px;">
		<thead>
			<tr>
				<th>序号</th>
				<th>名称</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.items}" var="item" varStatus="stat">
				<tr>
					<td>${stat.count }</td>
					<td>${item.name}</td>
					<td>
						<button class="btn btn-primary" onclick="edit('${item.id}','${item.name}','${item.buildingId}')">修改</button>
						<button class="btn btn-warning" onclick="del('${item.id}')">删除</button> 
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