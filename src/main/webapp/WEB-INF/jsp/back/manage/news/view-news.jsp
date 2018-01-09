<%--
  Created by IntelliJ IDEA.
  User: 胡桂榕
  Date: 2018/1/2
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>校验新闻</title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <!--自动选择更好的浏览器-->
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="res/admin/plugins/layui-v2.2.45/css/layui.css" media="all">
    <link type="text/css" rel="stylesheet" href="res/admin/plugins/model/css/base.css">
    <link type="text/css" rel="stylesheet" href="res/admin/plugins/model/css/index.css">

</head>
<body>
<c:if test="${viewNewsVo==null}">
    <c:redirect url="/news/viewNews/${param.newsId}"/>
</c:if>
<div class="w1200 pt20 clearfix" style="margin-left: 150px">
    <div class="detail_left fl">
        <ul class="clearfix title">
            <li>
                <c:if test="${viewNewsVo.newsRecord.aduitResult==1}">校验新闻</c:if>
                <c:if test="${viewNewsVo.newsRecord.aduitResult == 2||viewNewsVo.newsRecord.aduitResult == 3||viewNewsVo.newsRecord.aduitResult == 4||viewNewsVo.newsRecord.aduitResult == 5}">
                查看新闻
                </c:if>
        </ul>
        <div class="artical">
            <h1><a href="javascript:;">${viewNewsVo.news.newsTitle}</a></h1>
            <div class="clearfix">
                <ul class="fl">
                    <li>来源：${viewNewsVo.news.newsFrom}&nbsp;&nbsp;编辑：${viewNewsVo.userName}&nbsp;&nbsp;
                        状态： <c:if test="${viewNewsVo.newsRecord.aduitResult==1}">审核中&nbsp;&nbsp;<fmt:formatDate
                                value="${viewNewsVo.newsRecord.forReviewTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>(时间为新闻送审时间)</c:if>
                        <c:if test="${viewNewsVo.newsRecord.aduitResult==2}">等待发布&nbsp;&nbsp;距离发布还有：<span id="release"
                            style="color: #2577E3"></span></c:if>
                        <c:if test="${viewNewsVo.newsRecord.aduitResult==3}">已发布&nbsp;&nbsp;距离下架还有：<span id="release"
                            style="color: #2577E3"></span></c:if>
                        <c:if test="${viewNewsVo.newsRecord.aduitResult==4}">已下架</c:if>
                        <c:if test="${viewNewsVo.newsRecord.aduitResult==5}">审核失败</c:if>
                    </li>
                </ul>
            </div>
            <div class="abstract">
                摘要：${viewNewsVo.news.newsTitle}
            </div>
            ${viewNewsVo.news.newsContent}
            <div class="clearfix bottom pt40">
                <div class="fl"><span>分类:</span>
                    <c:forEach var="v" items="${viewNewsVo.channels}">
                        <a href="javascript:;">${v.channelName}</a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<c:if test="${viewNewsVo.newsRecord.aduitResult==1}">
    <shiro:hasRole name="audit">
        <div class="layui-form-item" style="float: right;margin-right: 50px">
            <button class="layui-btn layui-btn-danger"><i class="layui-icon">&#x1007;</i>不通过审核</button>
            <button class="layui-btn layui-btn-normal" id="issue"><i class="layui-icon">&#xe609;</i>发布
            </button>
        </div>
    </shiro:hasRole>
</c:if>
<c:if test="${viewNewsVo.newsRecord.aduitResult == 2}">
    <shiro:hasRole name="admin">
        <div class="layui-form-item" style="float: right;margin-right: 50px">
            <button class="layui-btn"><i class="layui-icon">&#x1006;</i>停止发布</button>
            </button>
        </div>
    </shiro:hasRole>
</c:if>
<c:if test="${viewNewsVo.newsRecord.aduitResult == 3}">
    <shiro:hasRole name="admin">
        <div class="layui-form-item" style="float: right;margin-right: 50px">
            <button class="layui-btn layui-btn-primary"><i class="layui-icon">&#xe601;</i>立即下架</button>
        </div>
    </shiro:hasRole>
</c:if>
<c:if test="${viewNewsVo.newsRecord.aduitResult == 4}">
    <shiro:hasRole name="admin">
        <div class="layui-form-item" style="float: right;margin-right: 50px">
            <button class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe62f;</i>重新上架</button>
        </div>
    </shiro:hasRole>
</c:if>
<c:if test="${viewNewsVo.newsRecord.aduitResult == 5}">
    <shiro:hasRole name="editor">
        <div class="layui-form-item" style="float: right;margin-right: 50px">
            <button class="layui-btn"><i class="layui-icon">&#xe642;</i>让我重新编辑</button>
            <button class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe6b2;</i>申请重新审核</button>
        </div>
    </shiro:hasRole>
</c:if>
<script src="res/admin/plugins/layui-v2.2.45/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use(['util', 'laydate', 'layer'], function () {
        var util = layui.util
            , laydate = layui.laydate
            , layer = layui.layer;
        //倒计时
        var thisTimer, setCountdown = function (y, M, d, H, m, s) {
            var endTime = new Date(y, M || 0, d || 1, H || 0, m || 0, s || 0) //结束日期
                , serverTime = new Date().getTime() + parseInt(parent.dateDiff); //服务器时间
            clearTimeout(thisTimer);
            util.countdown(endTime, serverTime, function (date, serverTime, timer) {
                var str = date[0] + '天' + date[1] + '时' + date[2] + '分' + date[3] + '秒';
                lay('#release').html(str);
                thisTimer = timer;
            });
        };
        if ("${viewNewsVo.newsRecord.aduitResult==2}") {
            var d = new Date("${viewNewsVo.news.releaseTime}");
        }
        if ("${viewNewsVo.newsRecord.aduitResult==3}") {
            var d = new Date("${viewNewsVo.newsRecord.soldoutTime}");
        }
        setCountdown(d.getFullYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(), d.getSeconds());
    });

    $("#issue").click(function () {
        parent.layer.open({
            type: 2,
            area: ['1000px', '470px'],
            skin: 'layui-layer-rim', //加上边框
            title: ['请选择发布和下架时间(系统会自动为您发布和下架)', 'font-size:16px;'],
            content: ['back/manage/news/news-issue?newsId=${viewNewsVo.news.newsId}', 'no'],//no表示禁用滚动条
            success: function (layero, index) {

            },
            end: function () { //层销毁后触发的回调
                $.ajax({
                    type: "POST",
                    url: "news/getNewsStauts?newsId=${viewNewsVo.news.newsId}",
                    async: false,
                    success: function (result) {
                        if (result == 2 || result == 3) {
                            window.location.href = "back/manage/success";
                        }
                    }
                });
            }

        });
    });
</script>
</body>

</html>
