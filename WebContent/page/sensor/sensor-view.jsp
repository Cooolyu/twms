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
<script type="text/javascript" src="${pageContext.request.contextPath}/page/sensor/sensor-view.js"></script>
</head>
<body background="${pageContext.request.contextPath}/image/body-bg.png">

<div class="container" style=" width: 100%;height: 100%;">
		<form id="view" action="sensor/view" method="post">
			<input type="hidden" id="floorId" name="floorId" value="${floorId }">
	<div class="col-md-11" style="height: 50px; padding-top: 8px;">
    	<div class="col-md-2 div-middle" style="height: 40px;">
	    	<select id="buildingId" name="buildingId" class="btn btn-default" onchange="buildingChange()" >
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
    	<div class="col-md-6 div-middle" style="height: 40px;">
    		<div class="btn-toolbar" role="toolbar">
				<div id="floor" class="btn-group" role="group">
					<c:forEach items="${floors}" var="item" varStatus="stat">
						<button class="btn ${item.id == floorId ? 'btn-info' : 'btn-default' }" onclick="changeFloor('${item.id}')">${item.name}</button>
					</c:forEach>
				</div>
			</div>
    	</div>
    	<div class="col-md-4 div-middle">
    		<div class="btn-group">
				<button type="button" class="btn btn-default" onclick="edit()">编辑模式</button>
				<button type="button" class="btn btn-default" onclick="save()">查看模式</button>
			</div>
    	</div>
    </div>
	</form>
	<div class="col-md-11">
		<form id="save" action="sensor/saveView" method="post" target="saveFrame">
			<c:forEach items="${sensors}" var="item" varStatus="stat">
				<div class="moveDiv" id="${item.name}${item.id}" style="width: 130px; height: 60px;position: absolute;">
				    <div class="moveBtn" style="width: 100%; height: 20px; cursor: move; background-color: #5BC0DE;" >${item.name}</div>
				    <div class="randomTem" style="width: 100%; height: 20px; background-color: #fff;" ></div>
				    <div class="randomHum" style="width: 100%; height: 20px; background-color: #fff;" ></div>
				    <input type="hidden" class="idVal" name="sensors[${stat.index}].id" value="${item.id}" />
				    <input type="hidden" class="leftVal" name="sensors[${stat.index}].leftVal" value="${item.leftVal}" />
				    <input type="hidden" class="topVal" name="sensors[${stat.index}].topVal" value="${item.topVal}" />
				</div>
			</c:forEach>
		</form>
		<iframe style="width:0; height:0; margin-top:-10px;" name="saveFrame" src="about:blank"></iframe>
        <img alt="" src="${pageContext.request.contextPath}/image/${floorPath}" width="100%" height="600px;">
    </div>
    <div id="center-mask" class="col-md-11" style="height: 600px;display: none;position: relative; top:-600px;left: 100px;">
    </div>
</div>
</body>
</html>