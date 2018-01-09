<%--
  Created by IntelliJ IDEA.
  User: 胡桂榕
  Date: 2017/12/31
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>


</head>
<body>
<p>aaaaaaaaaaaaaaaaaa</p>
<a id="test" href="javascript:;">注销</a>
<script type="text/javascript">
    $("#test").click(function () {
        window.location.href = "/user/logout?loginType= 1";
    });
</script>
</body>
</html>
