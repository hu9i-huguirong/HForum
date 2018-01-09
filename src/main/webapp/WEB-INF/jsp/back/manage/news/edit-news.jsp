<%--
  Created by IntelliJ IDEA.
  User: 胡桂榕
  Date: 2017/12/20
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <link rel="stylesheet" type="text/css" href="res/admin/plugins/loading/css/loading.css">
    <link rel="stylesheet" href="res/admin/plugins/layui-v2.2.45/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="res/admin/plugins/lightBox/style.css">
    <script type="text/javascript" charset="utf-8" src="res/admin/plugins/loading/js/loading.js"></script>
    <script type="text/javascript" charset="utf-8" src="res/admin/plugins/ueditor-1.4.3.3/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="res/admin/plugins/ueditor-1.4.3.3/ueditor.all.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="res/admin/plugins/ueditor-1.4.3.3/lang/zh-cn/zh-cn.js"></script>

</head>
<body style="margin: 15px;">
<c:if test="${editNewsVo==null}">
    <c:redirect url="/news/editNews/${param.newsId}"/>
</c:if>
<fieldset class="layui-elem-field layui-field-title">
    <legend>编辑新闻</legend>
</fieldset>
<form class="layui-form layui-form-pane" action="" id="edit-news-form">
    <c:forEach var="v" items="${editNewsVo.channels}">
        <li style="display: none"><input name="channelIds" type="checkbox" value="${v.channelId}"></li>
    </c:forEach>
    <input name="newsId" type="hidden" value="${editNewsVo.news.newsId}">
    <input name="newsRecordId" type="hidden" value="${editNewsVo.newsRecord.newsRecordId}">
    <div class="layui-form-item">
        <label class="layui-form-label"><span style="color:#F00">*</span>文章标题</label>
        <div class="layui-input-block">
            <input type="text" name="newsTitle" value="${editNewsVo.news.newsTitle}" autocomplete="off"
                   lay-verify="required" , placeholder="请输入文章标题"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"><span style="color:#F00">*</span>文章来源</label>
        <div class="layui-input-block">
            <input type="text" name="newsFrom" value="${editNewsVo.news.newsFrom}" autocomplete="off"
                   lay-verify="required" , placeholder="请输入文章来源"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 200px"><span style="color:#F00">*</span>分类栏目(最多可选3个)</label>
        <div class="layui-input-inline">
            <select name="channelId" id="channel-1" lay-filter="channel-1">
            </select>
        </div>
        <div class="layui-input-inline" style="display: none" id="channel-2-div">
            <select id="channel-2" lay-filter="channel-2">
            </select>
        </div>
        <div class="layui-input-inline" style="display: none" id="channel-3-div">
            <select id="channel-3" lay-filter="channel-3">
            </select>
        </div>
        <div class="layui-input-inline" id="add-channel-div">
            <a href="javascript:;" id="add-channel" class="layui-btn">
                <i class="layui-icon">&#xe654;</i></a>
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">允许评论</label>
        <div class="layui-input-block">
            <input type="checkbox" lay-text="开|关"
                   <c:if test="${editNewsVo.news.allowComment}">checked</c:if> name="allowComment" lay-skin="switch"
                   lay-filter="allowComment"
                   title="评论开关">
        </div>
    </div>
    <c:if test="${editNewsVo.images!=null && fn:length(editNewsVo.images)>0}">

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">&nbsp;&nbsp;&nbsp;文章封面</label>
            <div class="layui-input-block">
                <div class='layui-textarea' style=" padding:20px;align-content: center">
                    <c:forEach var="v" items="${editNewsVo.images}" varStatus="s">
                        <img class='js-lightBox' data-group='group-1' src="${v.imageContent}" width="150" height="100"/>
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:if>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label"><span style="color:#F00">*</span>文章内容</label>
        <div class="layui-input-block">
            <textarea id="editor" name="newsContent" class="layui-textarea" style="width:100%;height:100%;">
                ${editNewsVo.news.newsContent}
            </textarea>
        </div>
    </div>
    <div class="layui-form-item" style="float: right">
        <button class="layui-btn" lay-submit="" lay-filter="save"><i class="layui-icon">&#xe622;</i>保存草稿</button>
        <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="saveAndSubmit"><i class="layui-icon">&#x1005;</i>保存并提交审核
        </button>
    </div>
</form>
<script src="res/admin/plugins/layui-v2.2.45/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    function doSubmit(data, aduitResult) {
        var c1 = $("#channel-1").val();
        if (c1 == "" || c1 == null) {
            parent.layer.alert("请至少为新闻选择一个分类", {
                title: '消息',
                icon: 2
            });
            return false;
        }
        if(aduitResult==0){
            $("body").loading({
                loadingWidth:220,
                title:'正在为您保存新闻',
                name:'submitLoading',
                titleColor:'#FFFFFF',
                discColor:'#FFFFFF',
                discription:'请稍候...',
                direction:'column',
                type:'origin',
                originBg:'#FFFFFF',
                originDivWidth:40,
                originDivHeight:40,
                originWidth:6,
                originHeight:6,
                smallLoading:false,
                loadingBg:'rgba(0,0,0,0.4)',
                loadingMaskBg:'rgba(66,66,66,0.2)'
            });
        }
        else{
            $('body').loading({
                loadingWidth:240,
                title:'正在提交审核...',
                name:'submitLoading',
                direction:'row',
                type:'origin',
                originBg:'#71EA71',
                originDivWidth:30,
                originDivHeight:30,
                originWidth:4,
                originHeight:4,
                smallLoading:false,
                titleColor:'#388E7A',
                loadingBg:'#312923',
                loadingMaskBg:'rgba(22,22,22,0.2)'
            });
        }

        setTimeout(function(){

            var newsPo = {
                news: {},
                newsRecord: {},
                channels: []
            };
            var channel = function (channelId) {
                this.channelId = channelId;
            }

            var c2 = $("#channel-2").val();
            var c3 = $("#channel-3").val();

            newsPo.channels[0] = new channel(c1);
            if (c2 != "" && c2 != null) {
                newsPo.channels[1] = new channel(c2);
                if (c3 != "" && c3 != null) {
                    newsPo.channels[2] = new channel(c3);
                }
            }

            if (data.field.allowComment == "on") {
                newsPo.news.allowComment = true;
            }
            else {
                newsPo.news.allowComment = false;
            }
            newsPo.news.newsId = data.field.newsId;
            newsPo.news.newsTitle = data.field.newsTitle;
            newsPo.news.newsFrom = data.field.newsFrom;
            newsPo.news.newsContent = data.field.newsContent;

            newsPo.newsRecord.aduitResult = aduitResult;//0编辑中 (草稿) 1审核中 2已发布 3已下架 4审核失败 5重新上架
            newsPo.newsRecord.newsRecordId =  data.field.newsRecordId;


            $.ajax({
                type: "POST",
                url: "news/edit",
                async: false,
                data: JSON.stringify(newsPo),//@RequestBody接收的是一个json串,而不是json对象
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (result) {
                    removeLoading('submitLoading');
                    if (result == 1) {
                        parent.layer.alert("保存成功", {
                            title: '系统提示',
                            icon: 1
                        });
                    } else if(result == 2){
                        window.location.href = "back/manage/success";
                    }
                    else{
                        parent.layer.alert("操作失败,请稍后重试", {
                            title: '系统提示',
                            icon: 2
                        });
                    }

                }
            });

        },3000);


    }
</script>
<script>
    function resetSelect() {
        $("#channel-2-div").hide();
        $("#channel-3-div").hide();
        $("#channel-2").val("");
        $("#channel-3").val("");
        $("#add-channel-div").show();
    }

    layui.use(['form'], function () {
        var form = layui.form
            , layer = layui.layer, element = layui.element;

        //监听指定开关
        form.on('switch(allowComment)', function (data) {
            if (this.checked) {
                layer.tips('评论已开启', data.othis)
            }
            else {
                layer.tips('评论已关闭', data.othis)
            }
        });

        //监听提交
        form.on('submit(save)', function (data) {
            doSubmit(data, 0);
            return false;
        });
        form.on('submit(saveAndSubmit)', function (data) {
            doSubmit(data, 1);
            return false;
        });

        form.on('select(channel-1)', function (data) {
            // console.log(data.elem); //得到select原始DOM对象
            // console.log(data.value); //得到被选中的值
            // console.log(data.othis); //得到美化后的DOM对象
            if (data.value == "") {
                resetSelect();
            } else if (data.value == $("#channel-2").val() || data.value == $("#channel-3").val()) {
                parent.layer.alert("您已重复选择分类", {
                    title: '警告',
                    icon: 0
                });
                resetSelect();
            }
        });
        form.on('select(channel-2)', function (data) {
            if (data.value == "") {
                $("#channel-3-div").hide();
                $("#channel-3").val("");
                $("#add-channel-div").show();
            }
            else if (data.value == $("#channel-3").val()) {
                parent.layer.alert("您已重复选择分类", {
                    title: '警告',
                    icon: 0
                });
                $("#channel-3-div").hide();
                $("#channel-3").val("");
                $("#add-channel-div").show();
            }
        });
    });
</script>
<script type="text/javascript" src="res/admin/my/js/channel-select.js"/>

<script type="text/javascript" src="res/js/jquery.min.js"></script>
<script type="text/javascript" src='res/admin/plugins/lightBox/lightBox.js'></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $.LightBox({speed: 500})
    });
</script>

</body>
</html>