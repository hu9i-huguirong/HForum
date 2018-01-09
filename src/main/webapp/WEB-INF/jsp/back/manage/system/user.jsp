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
    <title>用户管理</title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <%@include file="/WEB-INF/jsp/common/back-common.jsp" %>
    <link rel="stylesheet" href="res/admin/plugins/beginner_admin/css/table.css"/>
</head>
<body>
<div class="admin-main">
    <blockquote class="layui-elem-quote">
        <form class="layui-form" action="">
            <input type="text" id="select-channelName" name="channelName" value="${param.channelName}" placeholder="昵称/邮箱/手机号"
                   class="layui-input"
                   style="width: 250px;float: left;margin-right: 10px;margin-left: 300px;">
            <a href="javascript:;" class="layui-btn" id="search">
                <i class="layui-icon">&#xe615;</i> 搜索</a>
        </form>
    </blockquote>

    <blockquote class="layui-elem-quote layui-quote-nm">
        <a href="javascript:;" class="layui-btn" id="add">
            <i class="layui-icon">&#xe654;</i> 添加用户
        </a>
        <a href="#" class="layui-btn">
            <i class="layui-icon">&#xe603;</i> 导出为Excel表
        </a>
        <a href="javascript:;" class="layui-btn layui-btn-danger">
            <i class="layui-icon">&#xe640;</i>批量删除
        </a>
        <a href="javascript:;" class="layui-btn" >
            <i class="layui-icon">&#x1002;</i>&nbsp;&nbsp;刷新</a>
    </blockquote>

    <fieldset class="layui-elem-field">
        <legend>用户数据</legend>
        <div class="layui-field-box layui-form">
            <table class="layui-table admin-table">
                <thead>
                <tr>
                    <th style="width: 30px;"><input type="checkbox" lay-filter="allselector" lay-skin="primary"></th>
                    <th>序号</th>
                    <th>用户昵称</th>
                    <th>用户头像</th>
                    <th>邮箱</th>
                    <th>手机号码</th>
                    <th>注册时间</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="content">
                </tbody>
            </table>
        </div>
    </fieldset>
    <div class="admin-table-page">
        <div id="paged" class="page">
        </div>
    </div>
</div>
<!--模板-->
<script type="text/html" id="tpl">
    {{# layui.each(d.list, function(index, item){ }}
    <tr>
        <td><input type="checkbox" lay-skin="primary"></td>
        <td>{{ index+1 }}</td>
        <td>{{ item.userName }}</td>
       <%-- <td>{{ item.userHead }}</td>--%>
        <td><a href="res/admin/my/images/{{ item.userHead }}.jpg" target="_blank"><img height="40px;" width="40px;" src="res/admin/my/images/{{ item.userHead }}.jpg"></a></td>
        <td>{{ item.email }}</td>
        <td>{{ item.cellPhoneNumber }}</td>
        <td>{{ item.registerTime }}</td>
        <td>{{ item.userStatus }}</td>
        <td>
            <a href="javascript:;" data-name="{{ item.name }}" data-opt="edit" class="layui-btn layui-btn-mini"><i
                    class="layui-icon">&#xe642;</i>编辑</a>
         <%--   <a href="javascript:;" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini"><i
                    class="layui-icon">&#xe640;</i>删除</a>--%>
        </td>
    </tr>
    {{# }); }}
</script>
<script type="text/javascript" src="res/admin/plugins/layui/layui.js"></script>
<script>
    layui.config({
        base: 'res/admin/plugins/beginner_admin/js/'
    });

    layui.use(['paging', 'form'], function () {
        var $ = layui.jquery,
            paging = layui.paging(),
            layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
            layer = layui.layer, //获取当前窗口的layer对象
            form = layui.form();

        // var channelName = $("#select-channelName").val();
        <%--var channelName = "${param.channelName}";--%>
        <%--//发送到服务端的参数--%>
        <%--var  params = { };--%>
        <%--if(channelName && channelName.trim() != ''){--%>
            <%--params.channelName = channelName;--%>
        <%--}--%>

        paging.init({
            openWait: true,
            url: 'user/list.action', //地址
            elem: '#content', //内容容器
            params: {

            },
            type: 'GET',
            tempElem: '#tpl', //模块容器
            pageConfig: { //分页参数配置
                elem: '#paged', //分页容器
                paged: true,
                pageSize: 10, //分页大小
            },
            success: function () { //渲染成功的回调
                //  alert('渲染成功');
            },
            fail: function () { //获取数据失败的回调
            },
            complate: function () { //完成的回调
                //  alert('处理完成');
                //重新渲染复选框
                form.render('checkbox');
                form.on('checkbox(allselector)', function (data) {
                    var elem = data.elem;

                    $('#content').children('tr').each(function () {
                        var $that = $(this);
                        //全选或反选
                        $that.children('td').eq(0).children('input[type=checkbox]')[0].checked = elem.checked;
                        form.render('checkbox');
                    });
                });

                //绑定所有编辑按钮事件
                $('#content').children('tr').each(function () {
                    var $that = $(this);
                    $that.children('td:last-child').children('a[data-opt=edit]').on('click', function () {
                        layer.msg($(this).data('name'));
                    });

                });

            },
        });
        //获取所有选择的列
        $('#getSelected').on('click', function () {
            var names = '';
            $('#content').children('tr').each(function () {
                var $that = $(this);
                var $cbx = $that.children('td').eq(0).children('input[type=checkbox]')[0].checked;
                if ($cbx) {
                    var n = $that.children('td:last-child').children('a[data-opt=edit]').data('name');
                    names += n + ',';
                }
            });
            layer.msg('你选择的名称有：' + names);
        });

        $('#search').on('click', function () {
            // parent.layer.alert('你点击了搜索按钮')
            var c = $("#select-channelName").val();
            var url = "back-stage/manage/news/channel.jsp";
            if (c && c.trim() != '') {
                url += "?channelName="+c;
            }
            window.location.href = url;
        });

        var addBoxIndex = -1;
        $('#add').on('click', function () {
            if (addBoxIndex !== -1)
                return;
            //本表单通过ajax加载 --以模板的形式，当然你也可以直接写在页面上读取
            $.get('temp/edit-form.html', null, function (form) {
                addBoxIndex = layer.open({
                    type: 1,
                    title: '添加表单',
                    content: form,
                    btn: ['保存', '取消'],
                    shade: false,
                    offset: ['100px', '30%'],
                    area: ['600px', '400px'],
                    zIndex: 19950924,
                    maxmin: true,
                    yes: function (index) {
                        //触发表单的提交事件
                        $('form.layui-form').find('button[lay-filter=edit]').click();
                    },
                    full: function (elem) {
                        var win = window.top === window.self ? window : parent.window;
                        $(win).on('resize', function () {
                            var $this = $(this);
                            elem.width($this.width()).height($this.height()).css({
                                top: 0,
                                left: 0
                            });
                            elem.children('div.layui-layer-content').height($this.height() - 95);
                        });
                    },
                    success: function (layero, index) {
                        //弹出窗口成功后渲染表单
                        var form = layui.form();
                        form.render();
                        form.on('submit(edit)', function (data) {
                            console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                            console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                            //调用父窗口的layer对象
                            layerTips.open({
                                title: '这里面是表单的信息',
                                type: 1,
                                content: JSON.stringify(data.field),
                                area: ['500px', '300px'],
                                btn: ['关闭并刷新', '关闭'],
                                yes: function (index, layero) {
                                    layerTips.msg('你点击了关闭并刷新');
                                    layerTips.close(index);
                                    location.reload(); //刷新
                                }

                            });
                            //这里可以写ajax方法提交表单
                            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                        });
                        //console.log(layero, index);
                    },
                    end: function () {
                        addBoxIndex = -1;
                    }
                });
            });
        });

        $('#import').on('click', function () {
            var that = this;
            var index = layer.tips('只想提示地精准些', that, {tips: [1, 'white']});
            $('#layui-layer' + index).children('div.layui-layer-content').css('color', '#000000');
        });
    });
</script>
</body>
</html>
