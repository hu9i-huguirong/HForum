<%--
  Created by IntelliJ IDEA.
  User: 胡桂榕
  Date: 2017/12/21
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>栏目排序</title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <link href="res/admin/my/css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="res/admin/plugins/layui-v2.2.45/css/layui.css"  media="all">
    <script type="text/javascript" src="res/admin/my/js/script.js"></script>

</head>
<body style="margin: 15px;">
<fieldset class="layui-elem-field" >
    <legend>已选中</legend>
    <div class="layui-field-box layui-form box" style="background: #FFFFFF">
       <%-- <h2 class="title"><a href="javascript:;" class="order">随机排序</a></h2>--%>
        <ul></ul>
    </div>
</fieldset>

<fieldset class="layui-elem-field" >
    <legend>未选中</legend>
    <div class="layui-field-box layui-form box" style="background: #FFFFFF">
<%--        <h2 class="title"><a href="javascript:;" class="order">随机排序</a></h2>--%>
        <ul></ul>
    </div>
</fieldset>

<a href="javascript:;" id ="save-postions" class="layui-btn layui-btn-normal" style="float: right;margin-bottom: 10px;">
    <i class="layui-icon">&#xe622;</i> 保存</a>

</body>
</html>
