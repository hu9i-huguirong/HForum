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
    <title>新闻管理</title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <link rel="stylesheet" href="res/admin/plugins/layui-v2.2.45/css/layui.css" media="all">
    <link rel="stylesheet" href="res/admin/my/css/span.css" media="all">
</head>
<body style="margin: 15px">
<div class="admin-main">
    <blockquote class="layui-elem-quote">
        <form class="layui-form" action="">
            <div class="layui-input-inline">
                <input type="text" id="select-newsTitle" name="newsTitle" value=""
                       placeholder="请输入新闻标题"
                       class="layui-input"
                       style="width: 280px;float: left;margin-right: 10px;margin-left: 120px;">
            </div>
            <div class="layui-input-inline">
                <select id="select-channel" lay-filter="channel">
                </select>
            </div>
            <shiro:hasRole name="editor">
                <div class="layui-input-inline">
                    <select id="select-aduitResult" lay-filter="aduitResult">
                        <option value="">-- 请选择新闻状态 --</option>
                        <option value='0'>编辑中</option>
                        <option value='1'>审核中</option>
                        <option value='2'>待发布</option>
                        <option value='3'>已发布</option>
                        <option value='4'>已下架</option>
                        <option value='5'>审核失败</option>
                    </select>
                </div>
            </shiro:hasRole>
            <a href="javascript:;" class="layui-btn" data-type="reload" style="margin-left: 10px">
                <i class="layui-icon">&#xe615;</i> 搜索</a>
        </form>
    </blockquote>

    <blockquote class="layui-elem-quote layui-quote-nm">
        <shiro:hasRole name="editor">
            <a href="javascript:;" id="add-news" class="layui-btn">
                <i class="layui-icon">&#xe654;</i> 添加新闻
            </a>
        </shiro:hasRole>
        <a href="#" class="layui-btn" id="import">
            从Excel表导入数据 <i class="layui-icon">&#xe602;</i>
        </a>
        <a href="#" class="layui-btn">
            <i class="layui-icon">&#xe603;</i> 导出为Excel表
        </a>
        <shiro:hasRole name="editor">
            <a href="javascript:;" class="layui-btn layui-btn-danger">
                <i class="layui-icon">&#xe640;</i>批量删除
            </a>
        </shiro:hasRole>
    </blockquote>

    <fieldset class="layui-elem-field">
        <legend>新闻数据</legend>
        <div class="layui-field-box layui-form">
            <script type="text/html" id="newsTitle">
                {{d.news.newsTitle}}
            </script>
            <script type="text/html" id="newsFrom">
                {{d.news.newsFrom}}
            </script>
            <script type="text/html" id="createTime">
                {{d.news.createTime}}
            </script>
            <script type="text/html" id="channelNames">
                {{# layui.each(d.channels,function(index,item) {  }}
                <span class="label label-success radius">{{ item.channelName }}</span>
                {{#  });  }}
            </script>

            <%--   <script type="text/html" id="allowComment">
                   {{#  if(d.news.allowComment) {  }}
                   <span class="label label-success radius" style="margin-top: 4px;">开</span>
                   {{# } else{ }}
                   <span class="label radius" style="margin-top: 4px;">关</span>
                   {{# } }}
               </script>--%>
            <script type="text/html" id="aduitResult">
                {{#  if(d.newsRecord.aduitResult == 0) {  }}
                <span class="label label-editing radius" style="margin-top: 4px;">编辑中</span>
                {{# } else if(d.newsRecord.aduitResult == 1) { }}
                <span class="label label-aduiting radius" style="margin-top: 4px;">审核中</span>
                {{# } else if(d.newsRecord.aduitResult == 2) { }}
                <span class="label label-releaseing radius" style="margin-top: 4px;">待发布</span>
                {{# } else if(d.newsRecord.aduitResult == 3) { }}
                <span class="label label-success radius" style="margin-top: 4px;">已发布</span>
                {{# } else if(d.newsRecord.aduitResult == 4) { }}
                <span class="label label-soldouted radius" style="margin-top: 4px;">已下架</span>
                {{# } else if(d.newsRecord.aduitResult == 5) { }}
                <span class="label label-failed radius" style="margin-top: 4px;">审核失败</span>

                {{# } }}
            </script>
            <script type="text/html" id="toolbar">
                {{#  if(d.newsRecord.aduitResult == 0) {  }}
                <a class="layui-btn layui-btn-xs" lay-event="edit">
                    <i class="layui-icon" style="color: #FFFFFF;">&#xe642;</i>
                    编辑</a>
                {{# } else if(d.newsRecord.aduitResult == 1) {  }}
                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="view">
                    <i class="layui-icon" style="color: #1E9FFF;">&#xe6b2;</i>
                    校验</a>
                {{# } else if(d.newsRecord.aduitResult == 2||d.newsRecord.aduitResult == 3||d.newsRecord.aduitResult == 4) {  }}
                        <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="view">
                        <i class="layui-icon" style="color: #FFFFFF;">&#xe60c;</i>
                             查看</a>
                {{# } else if(d.newsRecord.aduitResult == 5) {  }}
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="view">
                    <i class="layui-icon" style="color: #FFFFFF;">&#xe69c;</i>
                    查看</a>
                {{# } }}
                <shiro:hasRole name="editor">
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
                        <i class="layui-icon" style="color: #FFFFFF;">&#xe640;</i>
                        删除</a>
                </shiro:hasRole>
            </script>
            <table class="layui-hide" id="newsData" lay-filter="newsTable">
            </table>
        </div>

    </fieldset>

</div>
<script src="res/admin/plugins/layui-v2.2.45/layui.js" charset="utf-8"></script>
<script type="text/javascript">

</script>
<script>

    $.ajax({
        type: "POST",
        url: "channel/list",
        async: false,
        data: {paginate: false},
        success: function (result) {
            var options = "<option value=''>" + "-- 请选择栏目 --" + "</option>";
            $.each(result.data, function () {
                options += "<option  value=" + this.channelId + ">" + this.channelName + "</option>";
            });
            $("#select-channel").append(options);
        }
    });

    layui.use('table', function () {
        var loading = layer.load(0, {
            shade: [0.3, '#FFFFFF']
        }); //0代表加载的风格，支持0-2

        var table = layui.table
            , form = layui.form;

        var url = "news/list?userId=" + "<shiro:principal property='userId'/>"
        table.render({
            elem: '#newsData'
            , url: url,
            cols: [[
                {type: 'checkbox'},
                {type: 'numbers'},
                {
                    field: 'newsTitle', align: 'center', title: '新闻标题', templet: '#newsTitle', unresize: true
                }
                , {field: 'newsFrom', align: 'center', title: '来源', templet: '#newsFrom', unresize: true}
                , {
                    field: 'createTime',
                    align: 'center',
                    title: '创建时间',
                    sort: true,
                    templet: '#createTime',
                    unresize: true
                }
                , {field: 'channelNames', align: 'center', title: '新闻类别', templet: '#channelNames', unresize: true}
                // , {field: 'allowComment', align: 'center', title: '评论', templet: '#allowComment',width:90}
                , {field: 'aduitResult', align: 'center', title: '状态', templet: '#aduitResult', width: 90}
                , {
                    fixed: 'right', title: '操作', align: 'center', toolbar: '#toolbar'
                }
            ]]
            , id: "newsTable"
            , page: {
                limit: 4,
                limits: [4, 8, 16]
            }
            ,
            done: function (res, curr, count) {
                layer.close(loading);
            }
        });

        var $ = layui.$, active = {
            reload: function () {
                var newsTitle = $("#select-newsTitle").val();
                var channelId = $("#select-channel").val();
                var aduitResult = $("#select-aduitResult").val();

                //执行重载
                table.reload('newsTable', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        newsTitle: newsTitle,
                        channelId: channelId,
                        aduitResult: aduitResult
                    }
                });
            }
        };

        $('.layui-form .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //监听工具条
        table.on('tool(newsTable)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                var href = "back/manage/news/edit-news?newsId=" + data.news.newsId
                var newTabData = {
                    "title": data.news.newsTitle,
                    "icon": "&#xe642;",
                    "href": href
                }
                parent.tab.tabAdd(newTabData);
            }
            else if (obj.event === 'view') {
                var href = "back/manage/news/view-news?newsId=" + data.news.newsId;
                var newTabData = {
                    "title": data.news.newsTitle,
                    "icon": "&#xe6b2;",
                    "href": href
                }
                parent.tab.tabAdd(newTabData);

            }
        });
    });


    $("#add-news").click(function () {
        var data = {
            "title": "添加新闻",
            "icon": "&#xe61f;",
            "href": "back/manage/news/add-news"
        }
        parent.tab.tabAdd(data);
    });


</script>

</body>
</html>
