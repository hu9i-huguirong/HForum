<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="/WEB-INF/jsp/common/common.jsp"%>
<title>请求失败</title>
<link rel="stylesheet" href="res/css/error-css/common.css"/>
<link rel="stylesheet" href="res/css/error-css/405.css">
</head>
<body>
<div class="auto">
	<div class="container">
		<div class="settings">
			<i class="icon" ></i>
			<h4>请求失败</h4>
			<p>您刚刚提交的请求失败，建议您检查一下再试</p>
			<div>
				<a href="javascript:window.history.back();" title="返回上一步" id="reload-btn">返回上一步</a>
			</div>
		</div>
	</div>
</div>


</body>



</html>
