<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
	<%@include file="/WEB-INF/jsp/common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="res/css/login/base.css" />
<link rel="stylesheet" type="text/css" href="res/css/login/app-all.css" />
<link rel="stylesheet" type="text/css" href="res/css/login/blue.css" />
    

</head>

<body style="overflow: hidden;"><!-- 去掉滚动条 -->
<center>
	<div class="sign-container" id="container" >
		<div class="loginbox-con loginbox-con-iframe" id="loginbox-con">
			<div class="loginbox" id="loginbox" data-point="dlk">
				
				<!--#43111-Web端登录-->
				<div class="scancode-login status-scan js-scancode-box">
					<!-- 右上角 -->
					<div class="scanicon-switch-box">
						<div class="scanicon-toLogin js-qrcode-switch"></div>
						<div class="scancode-tips">
							<span class="scancode-tip-icon scancode-tip-lock"></span> <span
								class="scancode-tip-words">密码登录在这里</span>
						</div>
					</div>
					<!--#43111-Web端扫码登录插件-->
					<!-- 扫码的结构 begin -->
					<div class="loginbox-scanwrap" >
						
						<div class="loginbox-hd js-loginbox-hd">
						<div class="loginbox-hd-tab">
							<ul>
								<li><a href="#" class="t-login current js-loginbox-tab">快速安全登录</a>
								</li>
							</ul>
						</div>
					</div>
						<div class="scancode-middle">
						<div class="loginbox-scanwrap">
									<div class="loginbox-scancontent">
											<div class="scan-qrcode" style="margin: 0 auto;">
												<div class="qrcode-img">
													<div class="qrcode-con js-qrcode-con"></div>
													<i class="hforum-icon"></i>
												</div>
												<div class="qrcode-mask" >
													<div class="qrcode-maskcon">
														<h2>二维码已失效</h2>
														<div>
															<a href="javascript:;"
																class="fresh-btn js-qrcode-refresh">点击刷新</a>
														</div>
													</div>
													<div class="qrcode-maskbg"></div>
												</div>
											</div>
										</div> 
										<div id="qrcodeCanvas" style="display: block;"></div>
										<div class="loginbox-scanmobile" >
											<div class="scanmobile-icon"></div>
											<div class="scanmobile-note">扫描成功，请在手机上确认登录</div>
											<div class="scanmobile-back">
												<a href="javascript:;" class="js-qrcode-back">返回扫描二维码</a>
											</div>
										</div>
									</div>
							<div class="scancode-tip clearfix">
								<div class="scan-tip-icon fl"></div>
								<div class="scan-note fr" style="margin-top: 10px;">
									<span class="note1">请使用</span> <a href="javascript:void(0);"
										class="note2" target="_blank">手机HForum</a><span class="note1">
										扫一扫登录</span>
								</div>
							</div>
						</div>
						<div class="scancode-footer" style="margin-top: 10px;">
							<div class="scancode-link clearfix">
								<a class="scancide-to fr" href="javascript:void(0);"
									data-type="reg">免费注册</a> <span class="link-border fr">|</span>
								<span class="scancide-to js-to-link js-need-param fr"
									data-type="login">密码登录</span>
							</div>
						</div>
					</div>
					<!-- 扫码的结构 end -->
					<!--#43111-Web端扫码登录插件-->
				</div>
				<!--#43111-Web端扫码登录插件-->
				<div class="loginNormal js-login-normal hide">
					<!-- 头部 -->
					<div class="loginbox-hd js-loginbox-hd">
						<div class="loginbox-hd-tab">
							<ul>
								<li><a href="#" class="t-login current js-loginbox-tab">登录HForum</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- 登录 -->
					<div class="loginbox-bd loginbox-login" data-type="login" >
						<div class="scanicon-switch-box">
							<div class="scanicon-qrcode js-qrcode-switch"></div>
							<div class="scancode-tips">
								<span class="scancode-tip-icon scancode-tip-shield"></span> <span
									class="scancode-tip-words">扫码登录更安全</span>
							</div>
						</div>
						<!--#43111-Web端登录-->
						<div class="loginbox-bd-container">
							<!--#40128-账号体系_手机号登录-登录子类型-END-->
							<form class="login-form login-by-phoneNum" action=""
								method="post" data-type="log">
								<input type="hidden" name="login_type" value="nickname">
								<!-- 手机号 -->
								<div class="loginbox-p login-by-phoneNum login-by-sms">
									<div class="clearfix loginbox-p-stype-item active">
										<div class="selectCountry-box js-selectCountry-box" ></div>
										<input type="text"
											class="fr ipt ipt-need-parent country-phonenum"
											name="phoneNum" placeholder="请输入有效手机号码" maxlength="11" value="" />
									</div>
								</div>
								<!-- 密码框 -->
								<div class="loginbox-p login-by-phoneNum login-by-nickname">
									<span class="ipt-span ipt2"></span> <input class="ipt"
										type="password" name="password" placeholder="输入密码"
										autocomplete="off" style="width:300px;height:35px;"> <input class="ipt showpw1 notsub"
										type="text" name="password" placeholder="输入密码"
										autocomplete="off" style="margin-top: -1px;"/> <span class="pw-span pw-hide pw-hide1"></span>
								</div>
								<div class="captcha-gt"></div>
								<!-- 短信验证 -->
								<div class="loginbox-p login-by-sms">
									<div class="clearfix">
										<div class="form-field">
											<div class="clearfix">
												<input type="text" class="ipt fl loginbox-phone-yzp"
													size="6" maxlength="6" id="yzphonenum" name="phoneCaptcha"
													data-i18n="Phone.inputVerifyNumber" placeholder="输入验证码">
												<input class="phone-send js-sendvoice fl" type="button"
													value="短信验证" data-i18n="Phone.speechVerify"
													data-sms-isoutside="0">
											</div>
										</div>
									</div>
									<p class="myuser-tip login-cheak-sms"></p>
								</div>
								<div class="login-sbt-con">
									<input class="loginbox-sbt btn-sub" type="submit" value="登录">
									<div class="loginbox-noact clearfix">
										<a href="javascript:void(0);" class="login-type-enter login-by-phoneNum" data-subtype="login-by-sms">手机快捷登录</a> 
										<a href="javascript:void(0);" class="login-type-enter login-by-sms" data-subtype="login-by-phoneNum">邮箱登录</a>
										<a class="anchor_line forget-pwd" href="javascript:void(0);" target="_blank">忘记密码?</a>
									</div>
								</div>
							</form>
							<p class="third-text">其他登录方式</p>
							<div class="third-list clearfix ">
								<a href="javascript:void(0);" target="_blank"
									class="fl third-icon third-icon-qq" title="QQ账号登录"></a> <a
									href="javascript:void(0);" target="_blank"
									class="fl third-icon third-icon-wx" title="微信账号登录"></a> <a
									href="javascript:void(0);" target="_blank"
									class="fl third-icon third-icon-wb third-icon-last"
									title="微博账号登录"></a>
							</div>

							<span class="login-box-toptxt">没有账号？<a
								href="javascript:void(0);" title="5秒马上注册"
								class="anchor_line js-switch-reg js-need-param">5秒注册&nbsp;&gt;</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div></center>
	<script type="text/javascript" src="res/js/login/shark-all.js"></script>
	<script type="text/javascript" src="res/js/login/jquery.js"></script>
	<script type="text/javascript" src="res/js/login/jquery.artDialog.js"></script>
    <script type="text/javascript" src="res/js/login/utf.js"></script>
	<script type="text/javascript" src="res/js/login/jquery.qrcode.js"></script>
	<script type="text/javascript">
	 $(document).ready(function() {
		         $(".js-qrcode-con").qrcode({
		              render : "canvas",    //设置渲染方式，有table和canvas，使用canvas方式渲染性能相对来说比较好
		              text : "扫了也没用,我又还没做安卓端~",    //扫描二维码后显示的内容,可以直接填一个网址，扫描二维码后自动跳向该链接
		              width : "156",               //二维码的宽度
		              height : "156",              //二维码的高度
		              background : "#ffffff",       //二维码的后景色
		              foreground : "#000000",        //二维码的前景色
		                        //二维码中间的图片
		          });
		      });		
	</script>
	<script type="text/javascript" src="res/js/login/app-login-all.js"></script>
</body>

</html>
