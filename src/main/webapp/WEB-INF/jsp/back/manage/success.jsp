<%--
  Created by IntelliJ IDEA.
  User: 胡桂榕
  Date: 2017/12/29
  Time: 0:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>操作成功</title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <link rel="stylesheet" href="res/admin/plugins/layui-v2.2.45/css/layui.css" media="all">
</head>
<style type="text/css">
    body {
        text-align: center
    }

    .m-box {
        width: 200px;
        height: 200px;
        position: relative;
        margin: 80px auto;
        background: #00ED70;
        border-radius: 50%;
    }

    .m-duigou {
        width: 100px;
        height: 50px;
        position: absolute;
        left: 50%;
        top: 50%;
        margin: -40px 0 0 -50px;
        -webkit-transform: rotate(-45deg);
        transform: rotate(-45deg);
        overflow: hidden
    }

    .m-duigou:before, .m-duigou:after {
        content: "";
        position: absolute;
        background: #fff;
        border-radius: 2px
    }

    .m-duigou:before {
        width: 2px;
        height: 50px;
        left: 0;
        -webkit-animation: dgLeft 0.5s linear 0.5s 1 both;
        animation: dgLeft 0.5s linear 0.5s 1 both
    }

    .m-duigou:after {
        width: 100px;
        height: 2px;
        bottom: 0;
        -webkit-animation: dgRight 0.5s linear 1s 1 both;
        animation: dgRight 0.5s linear 1s 1 both
    }

    @-webkit-keyframes dgLeft {
        0% {
            top: -100%
        }
        100% {
            top: 0%
        }
    }

    @-webkit-keyframes dgLeft {
        0% {
            top: -100%
        }
        100% {
            top: 0%
        }
    }

    @-webkit-keyframes dgRight {
        0% {
            left: -100%
        }
        100% {
            left: 0%
        }
    }

    @-webkit-keyframes dgRight {
        0% {
            left: -100%
        }
        100% {
            left: 0%
        }
    }
</style>

<body>
<div class="layui-progress" lay-filter="success" style="margin-top: 15px;">
    <div class="layui-progress-bar" lay-percent="0%"></div>
</div>

<fieldset class="layui-elem-field layui-field-title" style="align-content: center;margin-top: 30px;">
    <legend>恭喜您提交成功</legend>
</fieldset>

<div class="m-box">
    <div class="m-duigou"></div>
</div>

<div>
    <p style="font-size: 18px;">系统将在 <span id="num" style="font-size: 24px;color:#FF8400; ">5</span>
        秒后自动跳转，若长时间未反应，请点击<a href="javascript:;" style="color: #01AAED">此处</a></span>。</p>
</div>


<script src="res/admin/plugins/layui-v2.2.45/layui.js" charset="utf-8"></script>
<script>
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
        //模拟loading
        var n = 0, timer = setInterval(function () {
            n = n + 1.35;
            if (n > 100) {
                n = 100;
                clearInterval(timer);
            }
            element.progress('success', n + '%');
        }, 50);
    });
</script>
<script>
    //倒计时跳转js代码
    var $_num = $("#num");
    var num = parseInt($_num.html());
    var numId = setInterval(function () {
        num--;
        if (num == 0) {
            clearInterval(numId);
            //跳转地址写在这里
           window.location.href = "/";
        }

        $_num.html(num);

    }, 1000);
</script>
</body>
</html>
