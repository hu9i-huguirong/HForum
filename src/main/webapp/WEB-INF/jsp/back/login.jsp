<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <style type="text/css">
        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }

        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        .form button {
            font-family: "Microsoft YaHei", "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #2577E3;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            -webkit-transition: all 0.3 ease;
            transition: all 0.3 ease;
            cursor: pointer;
        }

        .form button:hover, .form button:active, .form button:focus {
            background: #0A56BB;
        }

        .form .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
        }

        .form .message a {
            color: #4CAF50;
            text-decoration: none;
        }

        .form .register-form {
            display: none;
        }

        .container {
            position: relative;
            z-index: 1;
            margin: 0 auto;
        }

        .container:before, .container:after {
            content: "";
            display: block;
            clear: both;
        }

        .container .info {
            margin: 50px auto;
            text-align: center;
        }

        .container .info h1 {
            margin: 0 0 15px;
            padding: 0;
            font-size: 36px;
            font-weight: 300;
            color: #1a1a1a;
        }

        .container .info span {
            color: #4d4d4d;
            font-size: 12px;
        }

        .container .info span a {
            color: #000000;
            text-decoration: none;
        }

        .container .info span .fa {
            color: #EF3B3A;
        }

        .shake_effect {
            -webkit-animation-name: shake;
            animation-name: shake;
            -webkit-animation-duration: 1s;
            animation-duration: 1s;
        }

        @-webkit-keyframes shake {
            from, to {
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            10%, 30%, 50%, 70%, 90% {
                -webkit-transform: translate3d(-10px, 0, 0);
                transform: translate3d(-10px, 0, 0);
            }

            20%, 40%, 60%, 80% {
                -webkit-transform: translate3d(10px, 0, 0);
                transform: translate3d(10px, 0, 0);
            }
        }

        @keyframes shake {
            from, to {
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            10%, 30%, 50%, 70%, 90% {
                -webkit-transform: translate3d(-10px, 0, 0);
                transform: translate3d(-10px, 0, 0);
            }

            20%, 40%, 60%, 80% {
                -webkit-transform: translate3d(10px, 0, 0);
                transform: translate3d(10px, 0, 0);
            }
        }
    </style>

    <link rel="stylesheet" type="text/css" href="res/admin/login/css/login.css"/>

    <link type="text/css" rel="stylesheet" href="res/admin/login/css/input/normalize.css"/>
    <link type="text/css" rel="stylesheet" href="res/admin/login/css/input/font-awesome.min.css"/>
    <link type="text/css" rel="stylesheet" href="res/admin/login/css/input/demo.css"/>
    <link type="text/css" rel="stylesheet" href="res/admin/login/css/input/component.css"/>
    <link rel="stylesheet" type="text/css" href="res/admin/login/css/input/input.css"/>
    <title>Insert title here</title>
</head>
<body>
<div class="wrapper" id="div_Mobile">
    <div class="banner1"></div>
    <div class="banner2"></div>
    <div class="main">
        <div class="banner1"></div>
        <div class="banner2"></div>
        <div class="title_logo"></div>
        <div class="version">
            <a href="/" target="_blank">前台首页</a>
            <a href="javascript:;" target="_blank">问题反馈</a>
            <a href="javascript:;" target="_blank">联系管理员</a>
        </div>
        <div class="logo_des"><i>HForum</i></div>
        <div class="htmleaf-container" style="padding-top: 150px;">
            <div id="wrapper" class="login-page">
                <div id="login_form" class="form">
                    <form class="login-form" action="user/login" method="post">
                        <input type="hidden"  name="userType" value="admin"/>
		<span class="input input--jiro" style="margin-top: 0;">
				<input class="input__field input__field--jiro" type="text" id="input-10" name="userName"
                       style="color: #FFFFFF"/>
				<label class="input__label input__label--jiro" for="input-10">
					<span class="input__label-content input__label-content--jiro" style="color:#267AE4;">邮箱/手机号码</span>
				</label>
			</span>
                        <span class="input input--jiro">
				<input class="input__field input__field--jiro" type="password" id="input-11" name="userPwd"
                       style="color: #FFFFFF"/>
				<label class="input__label input__label--jiro" for="input-11">
					<span class="input__label-content input__label-content--jiro" style="color:#267AE4 ">密码</span>
				</label>
			</span>
                        <button id="login">登　录</button>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value=""/>
                                <i class="input-helper">
                                    记住我
                                </i>
                            </label>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript" src="res/admin/login/js/classie.js"></script>
<script src="res/js/dialog/jquery.hDialog.min.js"></script>
<script type="text/javascript" src="res/admin/login/js/login.js"></script>

</body>
</html>