<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="/WEB-INF/jsp/common/common.jsp"%>
<title>服务器繁忙</title>
<link rel="stylesheet" href="res/css/error-css/common.css"/>
<link rel="stylesheet" href="res/css/error-css/500.css">
</head>
<body>
<div class="auto">
	<div class="container">
		<div class="settings">
			<i class="icon" ></i>
			<h4>系统繁忙</h4>
			<p>非常抱歉服务器繁忙，请您稍后重试</p>
			<p>错误:${message}</p>
			<div>
				<a href="javascript:window.history.back();" title="返回上一步" id="reload-btn">返回上一步</a>
			</div>
		</div>
	</div>
</div>


</body>



</html>
