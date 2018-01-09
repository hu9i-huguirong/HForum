<%--
  Created by IntelliJ IDEA.
  User: 胡桂榕
  Date: 2017/12/23
  Time: 0:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>添加栏目</title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <link rel="stylesheet" href="res/admin/plugins/layui-v2.2.45/css/layui.css" media="all">
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item" style="margin-top: 15px">
        <div class="layui-inline">
            <label class="layui-form-label">城市栏目</label>
            <div class="layui-input-inline">
                <select name="city" lay-filter="is-city" lay-verify="required">
                    <option value="true">是</option>
                    <option value="false" selected>否</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-inline" id="channelName-div" style="margin-bottom: 15px;">
        <label class="layui-form-label">栏目名称</label>
        <div class="layui-input-inline"><%--lay-verify="required"--%>
            <input id="channelName-id" name="channelName" autocomplete="off" placeholder="请输入栏目名称"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-inline" id="channelName-city-div" style="margin-bottom: 15px;display: none">
        <label class="layui-form-label">栏目名称</label>
        <div class="layui-input-inline">
            <select id="channelName-city-id" lay-search="">
                <option value="">-- 请选择 --&nbsp;&nbsp;(直接搜索)</option>
            </select>
        </div>
    </div>

    <div class="layui-inline">
        <label class="layui-form-label">是否选中</label>
        <div class="layui-input-inline">
            <select name="selected" lay-verify="required">
                <option value="">-- 请选择 --</option>
                <option value="true">是</option>
                <option value="false">否</option>
            </select>
        </div>
    </div>
    </div>
    </div>
    <div class="layui-form-item" style="margin-top: 15px">
        <div class="layui-input-block">
            <button id="add" class="layui-btn" lay-submit="" lay-filter="demo1">立即添加</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</form>
<script src="res/admin/plugins/layui-v2.2.45/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer;

        //监听提交
        form.on('submit(demo1)', function (data) {
            var channelName = data.field.channelName;
            if (!channelName || channelName.trim() == "") {
                layer.alert("栏目名称不能为空", {
                    title: '消息',
                    icon:2
                });
                return false;
            }
            var loading = layer.load(0, { shade: [0.1,'#fff'] //0.1透明度的白色背景
               }); //0代表加载的风格，支持0-2
            $("#add").attr("disabled", true);

            $.ajax({
                type: "POST",
                url: "channel/add",
                async: false,
                data: JSON.stringify(data.field),//@RequestBody接收的是一个json串,而不是json对象
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (result) {
                    layer.close(loading);
                    $("#add").attr("disabled", false);
                    if (result == 1) {
                        parent.layer.alert("添加栏目成功", {
                            skin:'layui-layer-molv',
                            title: '消息',
                            icon:1,
                            yes:function () {
                                //当你在iframe页面关闭自身时
                                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                                parent.layer.close(index); //再执行关闭
                                parent.location.reload();
                            }
                        });

                    }
                    else if (result == 2) {
                        layer.alert("栏目名称已存在", {
                            title: '消息',
                            icon:2
                        });
                    }
                    else {
                        layer.alert("添加失败", {
                            title: '消息',
                            icon:2
                        });
                    }
                }
            });

            return false;
        });
        form.on('select(is-city)', function (data) {
            // console.log(data.elem); //得到select原始DOM对象
            // console.log(data.value); //得到被选中的值
            // console.log(data.othis); //得到美化后的DOM对象
            if (data.value == "true") {
                $("#channelName-div").hide();
                $("#channelName-city-div").show();
                $("#channelName-id").attr("name", "");
                $("#channelName-city-id").attr("name", "channelName");
            }
            else {
                $("#channelName-div").show();
                $("#channelName-city-div").hide();
                $("#channelName-id").attr("name", "channelName");
                $("#channelName-city-id").attr("name", "");
            }
        });
    });
</script>
<script src="res/data/citys.js" charset="utf-8"></script>
<script type="text/javascript">
    $.each(cityObj, function (index) {
        var optionGroup = "<optgroup label=" + this.provinceName + ">";
        $.each(this.citys, function () {
            optionGroup += "<option value=" + this.citysName + ">" + this.citysName + "</option>";
        });
        optionGroup += "</optgroup>";
        $("#channelName-city-id").append(optionGroup);
    });
</script>
</body>
</html>
