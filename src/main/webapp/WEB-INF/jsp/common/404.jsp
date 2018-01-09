<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="/WEB-INF/jsp/common/common.jsp"%>
<title>您访问的页面不存在</title>
<link rel="stylesheet" href="res/css/error-css/common.css"/>
<link rel="stylesheet" href="res/css/error-css/404.css">
</head>
<body>
<div class="auto">
	<div class="container">
		<div class="settings">
			<i class="icon"></i>
			<h4>很抱歉！没有找到您要访问的页面！</h4>
			<p><span id="num">5</span> 秒后将自动跳转到首页</p>
			<div>
				<a href="/" title="返回首页">返回首页</a>
				<a href="javascript:;" title="上一步" id="reload-btn">上一步</a>
			</div>
		</div>
	</div>
</div>

 <script>
	//倒计时跳转到首页的js代码
	var $_num=$("#num");
	var num=parseInt($_num.html());
	var numId=setInterval(function(){
		num--;
		$_num.html(num);
		if(num===0){
			//跳转地址写在这里
			window.location.href="/";
		}
	},1000);
	//返回按钮单击事件
	var reloadPage = $("#reload-btn");
	reloadPage.click(function(e){
		window.history.back();
	});
</script> 

</body>



</html>
