<%--
  Created by IntelliJ IDEA.
  User: 胡桂榕
  Date: 2018/1/11
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>HForum-注册</title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <link type="text/css" rel="stylesheet" href="res/css/register/base.css"/>
    <link type="text/css" rel="stylesheet" href="res/css/register/layout.css"/>
    <link type="text/css" rel="stylesheet" href="res/css/register/loading.css">
    <link rel="stylesheet" href="res/admin/plugins/layui-v2.2.45/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="res/plugins/verify/css/verify.css">
    <link rel="stylesheet" type="text/css" href="res/css/register/pwd.css">
    <script src="res/js/jquery.SuperSlide.2.1.1.js"></script>
</head>
<body>
<div id="wrapper">
    <header id="header" >
        <div id="headBox">
            <div class="w960 oh">
                <a href="/" class="fl mt10" style="margin-top: 15px; "><img src="res/images/news-detail/index_ico1.png"/></a>
                <nav id="navs">
                    <a style="color: #FFFFFF;font-size: 22px">HForum&nbsp;<span style="font-size: 16px">●</span>&nbsp;注册</a>
                </nav>
            </div>
        </div>
    </header><!-- // header end -->
    <div class="container w960 mt20">
        <div id="processor">
            <ol class="processorBox oh">
                <li class="current">
                    <div class="step_inner fl">
                        <span class="icon_step">1</span>
                        <h4>填写基本信息</h4>
                    </div>
                </li>
                <li>
                    <div class="step_inner">
                        <span class="icon_step">2</span>
                        <h4>邮箱激活</h4>
                    </div>
                </li>
                <li>
                    <div class="step_inner fr">
                        <span class="icon_step">3</span>
                        <h4>完成注册</h4>
                    </div>
                </li>
            </ol>
            <div class="step_line"></div>
        </div>
        <div class="content">
            <ul style="width: 860px;height: 550px;margin-left: 150px ">
                <li id="step1" class="step hide">
                    <form id="form-register" class="layui-form layui-form-pane" action="">
                        <div class="layui-form-item">
                            <div class="layui-form-item" style="width: 250px;margin-left: 150px;">
                                <div class="layui-unselect layui-form-select layui-form-selected" >
                                    <dl style="display: none">
                                        <dd>@163.com</dd><%--class="layui-this"--%>
                                        <dd>@qq.com</dd>
                                        <dd>@sina.com</dd>
                                        <dd>@sohu.com</dd>
                                        <dd>@126.com</dd>
                                        <dd>@139.com</dd>
                                        <dd>@hotmail.com</dd>
                                        <dd>@gmail.com</dd>
                                    </dl>
                                </div>
                            </div>
                            <label class="layui-form-label" style="width: 150px"><span
                                    style="color:#F00">*</span>&nbsp;邮箱</label>
                            <input type="text" style="width:250px;float: left" id="user-email" name="email" lay-verify="required|email"
                                   placeholder="请输入您的常用邮箱"
                                   class="layui-input">
                            <p class="frm_tips" id="email_tips" style="width: 450px;float: right">您输入的邮箱将作为登录帐号</p>

                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label" style="width: 150px"><span
                                    style="color:#F00">*</span>&nbsp;密码</label>
                            <div class="layui-input-block">
                                <input style="width:250px;float: left" id="userPass" name="password"
                                       lay-verify="required|pass" type="password"
                                       placeholder="请输入密码"
                                       class="layui-input">
                                <p class="frm_tips" id="pwd_tips" style="width: 450px;float: right">
                                    请输入6-20位数字、字母或常用符号，<br/>字母区分大小写</p>
                            </div>
                            <div id="level" class="pw-strength" style="margin-left: 150px">
                                <div class="pw-bar"></div>
                                <div class="pw-bar-on"></div>
                                <div class="pw-txt">
                                    <span>弱</span>
                                    <span>中</span>
                                    <span>强</span>
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label" style="width: 150px"><span style="color:#F00">*</span>&nbsp;再次输入密码</label>
                            <div class="layui-input-block">
                                <input style="width:250px;" lay-verify="required|repass" type="password"
                                       placeholder="请再次输入密码"
                                       class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label" style="width:602px "><span style="color:#F00">*</span>&nbsp;验证码(若图片无法显示，请刷新或更换浏览器)</label>
                            <div class="layui-input-block">
                                <input type="hidden" lay-verify="verify">
                                <div id="verify">
                                </div>
                            </div>
                        </div>
                        <hr style="color: #D2D2D2;width:600px;float: left"/>
                        <div class="toolBar">
                            <a id="nextBtn" lay-filter="next" class="btn btn_primary" style="color: #FFFFFF"
                               lay-submit=""
                               href="javascript:;">下一步</a>
                        </div>
                    </form>

                </li>
                <li id="step2" class="step hide" style="margin-top: 100px">
                    <div>
                        <h2 style="font-size: 18px;font-family: '微软雅黑','黑体';font-weight: 300;display: inline;color: #4c6b73;line-height: 20px;">感谢注册，确认邮件已发送至您的注册邮箱 : <span id="user-email-span"></span></h2><br/><br/>
                        <h2 style="font-size: 18px;font-family: '微软雅黑','黑体';font-weight: 300;display: inline;color: #4c6b73;line-height: 20px;">请进入邮箱查看邮件，并激活HForum帐号。</h2>
                        <p><a id="login-email" class="btn btn_primary mt20" style="color: #FFFFFF" href="javascript:;">登录邮箱</a></p><br/>
                        <h2 style="font-size: 16px;font-family: '微软雅黑','黑体';font-weight: 300;display: inline;color: #4c6b73;line-height: 18px;"> 没有收到邮件？</h2><br/><br/>
                        <h2 style="font-size: 14px;font-family: '微软雅黑','黑体';font-weight: 300;display: inline;color: #4c6b73;line-height: 16px;">1. 请检查邮箱地址是否正确，您可以返回<a id="restartReg" href="javascript:;" class="c46">重新填写</a></h2><br/><br/>
                        <h2 style="font-size: 14px;font-family: '微软雅黑','黑体';font-weight: 300;display: inline;color: #4c6b73;line-height: 16px;">2. 若仍未收到确认，您可以尝试<a id="restartSend" href="javascript:;" class="c46">重新发送</a></h2>
                    </div><!-- // step2 end -->

                </li>
                <li id="step3" class="step hide">
                </li>
            </ul>
        </div>
    </div><!-- // container end -->
    <div id="loading" style="display: none">
        <svg class="filter" version="1.1">
            <defs>
                <filter id="gooeyness">
                    <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur" />
                    <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 20 -10" result="gooeyness" />
                    <feComposite in="SourceGraphic" in2="gooeyness" operator="atop" />
                </filter>
            </defs>
        </svg>
        <p style="color: white;font-size: 25px">请稍等</p>
        <div class="dots">
            <div class="dot mainDot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>
    </div>
    <footer id="footer" class="w960 oh">

    </footer><!-- // footer end -->
</div><!-- // wrapper end -->
<script type="text/javascript" src="res/plugins/verify/js/verify.js"></script>
<script src="res/admin/plugins/layui-v2.2.45/layui.js" charset="utf-8"></script>
<script src="res/js/register.js" charset="utf-8"></script>
</body>

</html>
