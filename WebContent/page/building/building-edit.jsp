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
<script type="text/javascript" src="${pageContext.request.contextPath}/page/building/building-edit.js"></script>
</head>
<body>

<div class="container" style="width: 100%;height: 100%; padding-top: 15px;">
	<form class="form-inline" action="building/save" method="post">
		<!-- <div class="form-group">
			<div class="col-md-offset-2 col-md-4">
				<h3>楼栋信息</h3>
			</div>
		</div> -->
		<div class="form-group">
			<label>楼栋名称：</label>
				<input type="hidden" name="id" value="${building.id }"/>
				<input type="text" name="name" class="form-control required" value="${building.name }"/>
		</div>
		<div class="form-group">
			<c:choose >
				<c:when test="${building.id == null }">
					<button type="submit" class="btn btn-primary">添加</button>
				</c:when>
				<c:otherwise>
					<button type="submit" class="btn btn-primary">更新</button>
				</c:otherwise>
			</c:choose>
		</div>
	</form>
</div>
</body>
</html>