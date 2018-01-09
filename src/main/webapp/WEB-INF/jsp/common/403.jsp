<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="/WEB-INF/jsp/common/common.jsp" %>
<title>没有权限</title>
<link rel="stylesheet" href="res/css/error-css/common.css"/>
<link rel="stylesheet" href="res/css/error-css/403.css">
</head>
<body>
<div class="auto">
	<div class="container">
		<div class="settings">
			<i class="icon" ></i>
			<h4>您未获授权，无法查看此网页。</h4>
			<p>Forbidden - 访问被拒绝</p>
			<div>
				<a href="javascript:window.history.back();" title="返回上一步" id="reload-btn">返回上一步</a>
			</div>
		</div>
	</div>
</div>


</body>



</html>
