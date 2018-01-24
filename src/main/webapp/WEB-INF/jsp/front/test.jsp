<%--
  Created by IntelliJ IDEA.
  User: 胡桂榕
  Date: 2018/1/9
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <link rel="stylesheet" type="text/css" href="res/css/timedropper.css">
    <script src="res/js/timedropper.js"></script>
</head>
<body style="background-color: #F1F2F3">
<div style="margin-top: 200px;margin-left: 200px;">
    <i style="color: #2577E3;font-size: 70px;font-family: Helvetica Neue, Helvetica, PingFang SC, 微软雅黑, Tahoma, Arial, sans-serif; ">HForum</i>
</div>



<center><br><br><br>
    <input type="text" id="alarm" />
</center>
<script>$( "#alarm" ).timeDropper();</script>


</body>
</html>
