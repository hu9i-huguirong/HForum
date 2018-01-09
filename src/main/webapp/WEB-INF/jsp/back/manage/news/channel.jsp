<%--
  Created by IntelliJ IDEA.
  User: 胡桂榕
  Date: 2017/12/18
  Time: 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>栏目管理</title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <%@include file="/WEB-INF/jsp/common/admin-header.jsp" %>
</head>
<body style="margin: 15px">
<div class="admin-main">
    <blockquote class="layui-elem-quote">
        <form class="layui-form" action="">
            <input type="text" id="select-channelName" name="channelName" value="${param.channelName}"
                   placeholder="请输入栏目名称"
                   class="layui-input"
                   style="width: 250px;float: left;margin-right: 10px;margin-left: 300px;">
            <a href="javascript:;" class="layui-btn" id="search">
                <i class="layui-icon">&#xe615;</i> 搜索</a>
        </form>
    </blockquote>

    <blockquote class="layui-elem-quote layui-quote-nm">
        <a href="javascript:;" id="add-channel" class="layui-btn">
            <i class="layui-icon">&#xe654;</i> 添加栏目
        </a>
        <a href="javascript:;" class="layui-btn" id="edit">
            <i class="layui-icon">&#xe857;</i> 排序
        </a>
        <a href="#" class="layui-btn" id="import">
            从Excel表导入数据 <i class="layui-icon">&#xe602;</i>
        </a>
        <a href="#" class="layui-btn">
            <i class="layui-icon">&#xe603;</i> 导出为Excel表
        </a>
        <a href="javascript:;" class="layui-btn layui-btn-danger">
            <i class="layui-icon">&#xe640;</i>批量删除
        </a>
    </blockquote>

    <fieldset class="layui-elem-field">
        <legend>栏目数据</legend>
        <div class="layui-field-box layui-form">
            <script type="text/html" id="selected">

                <input type="checkbox" name="{{d.channelId}}" value="{{d.selected}}" lay-skin="switch" lay-text="是|否"
                       lay-filter="selected"  {{ d.selected== true ? 'checked' : '' }}>
            </script>
            <script type="text/html" id="city">
              <%--  <input type="checkbox" name="{{d.channelId}}" value="{{d.city}}" lay-skin="switch" lay-text="是|否"
                       lay-filter="city" {{ d.city== true ? 'checked' : '' }}>--%>
              <p lay-filter="city">{{ d.city== true ? '是' : '否' }}</p>
            </script>
            <table class="layui-hide" id="channelTable" lay-filter="channelTable">
            </table>
        </div>

    </fieldset>
    <script type="text/html" id="toolbar">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon"
                                                                              style="font-size: 30px; color: #FFFFFF;">&#xe640;</i>
            删除</a>
    </script>
</div>
<script>
    layui.use('table', function () {
        var loading = layer.load(0, { shade: [0.3,'#FFFFFF']
        }); //0代表加载的风格，支持0-2
        var channelName = "${param.channelName}";
        //发送到服务端的参数
        var url = "channel/list";
        if (channelName && channelName.trim() != '') {
            url += "?channelName=" + channelName;
        }
        var table = layui.table
            , form = layui.form;
        table.render({
            elem: '#channelTable'
            , url: url,
            cols: [[
                {type: 'checkbox'},
                {type: 'numbers'},
                {field: 'channelName', align: 'center', title: '栏目名称', edit: 'text'}
                , {field: 'position', align: 'center', title: '排序', sort: true}
                , {field: 'selected', align: 'center', title: '是否选中', templet: '#selected', unresize: true}
                , {field: 'city', align: 'center', title: '是否为城市栏目', templet: '#city', unresize: true}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#toolbar'}
            ]]
            , page: {
                limit: 4,
                limits: [4, 8, 16]
            },
            done: function(res, curr, count){
                layer.close(loading);
            }
        });
        //监听选中操作
        form.on('switch(selected)', function (obj) {
            var selected = obj.elem.checked;
            var channelId = this.name;
            var url = "channel/edit";
            var data = {
                "selected": selected,
                "channelId": channelId
            }
            $.post(url, data, function (result) {
                if (result == 0) {
                    layer.msg("操作成功");
                } else {
                    layer.msg("操作失败");
                }

                window.location.reload();
            });
        });

        //监听城市操作
        form.on('switch(city)', function (obj) {
            var city = obj.elem.checked;
            var channelId = this.name;
            var url = "channel/edit";
            var data = {
                "city": city,
                "channelId": channelId
            }
            $.post(url, data, function (result) {
                if (result == 0) {
                    layer.msg("操作成功");
                } else {
                    layer.msg("操作失败");
                    window.location.reload();
                }
            });
        });
        //监听查询操作
        $('#search').on('click', function () {
            var c = $("#select-channelName").val();
            var url = "back/manage/news/channel";
            if (c && c.trim() != '') {
                url += "?channelName=" + c;
            }
            window.location.href = url;
        });
        //监听单元格编辑
        table.on('edit(channelTable)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            var url = "channel/edit";
            var mydata = {
                "channelName": value,
                "channelId": data.channelId
            }
            $.post(url, mydata, function (result) {
                if (result == 0) {
                    layer.msg("操作成功");
                } else {
                    layer.msg("操作失败");
                    window.location.reload();
                }
            });
        });

        $("#edit").click(function () {
            layer.open({
                type: 2,
                area: ['600px', '400px'],
                title: ['长按拖拽排序', 'font-size:18px;'],
                content: 'back/manage/news/edit-channel',
                success: function (layero, index) {

                }
            });
        });
        $("#add-channel").click(function () {
            layer.open({
                type: 2,
                area: ['460px', '280px'],
                title: ['添加栏目', 'font-size:18px;'],
                content: 'back/manage/news/add-channel',
                success: function (layero, index) {
                }
            });
        });


    });
</script>

</body>
</html>
