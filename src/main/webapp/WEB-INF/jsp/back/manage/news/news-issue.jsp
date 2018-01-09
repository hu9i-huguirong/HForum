<%--
  Created by IntelliJ IDEA.
  User: 胡桂榕
  Date: 2017/12/24
  Time: 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <link rel="stylesheet" href="res/admin/plugins/layui-v2.2.45/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="res/admin/plugins/loading/css/loading.css">
    <link rel="stylesheet" href="res/admin/plugins/layui-v2.2.45/css/layui.css" media="all">
</head>
<body>
<form class="layui-form" action="">

    <div class="layui-form-item" style="margin-top: 40px">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 200px">请选择发布日期-下架日期</label>
            <div class="layui-input-inline">
                <input type="text" name="date1" lay-verify="required" class="layui-input" id="date1" readonly="">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 200px">请选择发布时间-下架时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date2" lay-verify="required" class="layui-input" id="date2" readonly="">
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="float: right;margin-right: 50px">
        <button class="layui-btn layui-btn-lg layui-btn-normal" lay-submit="" lay-filter="demo1" id="issue"><i
                class="layui-icon">&#xe609;</i>发布新闻
        </button>
    </div>

</form>
<script type="text/javascript" charset="utf-8" src="res/admin/plugins/loading/js/loading.js"></script>
<script src="res/admin/plugins/layui-v2.2.45/layui.js" charset="utf-8"></script>
<script type="text/javascript">

    layui.use(['form','laydate'], function () {
        var form = layui.form
            ,layer = layui.layer
            ,laydate = layui.laydate;
        laydate.render({
            elem: '#date1', //指定元素
            theme: 'molv'
            , range: true
            , calendar: true //开启公历节日
        });

        laydate.render({
            elem: '#date2' //指定元素
            , type: 'time'
            , range: true
            , theme: '#2577E3'
        });

         //监听提交
        form.on('submit(demo1)', function (data) {
            var date1 = data.field.date1;
            var date2 = data.field.date2;

            var releaseMs =  new Date(date1.substring(0,10)+" "+date2.substring(0,8)).getTime();
            var soldoutMs =  new Date(date1.substring(13,date1.length)+" "+date2.substring(11,date1.length)).getTime();

            var newsId = "${param.newsId}";
            var userId = "<shiro:principal property="userId"/>";
            if(newsId==null){
                layer.alert("当前没有可发布的新闻", {
                    title: '系统提示',
                    icon: 5
                });
                return false;
            }
            var data ={
                releaseMs:releaseMs,
                soldoutMs:soldoutMs,
                userId:userId,
                newsId:newsId
            }
            $('body').loading({
                loadingWidth:240,
                title:'正在发布新闻',
                name:'submitLoading',
                discription:'请稍候...',
                direction:'column',
                type:'origin',
                originBg:'#71EA71',
                originDivWidth:40,
                originDivHeight:40,
                originWidth:6,
                originHeight:6,
                smallLoading:false,
                loadingBg:'#389A81',
                loadingMaskBg:'rgba(123,122,222,0.2)'
            });

            setTimeout(function(){
                $.ajax({
                    type: "POST",
                    url: "news/release",
                    async: false,
                    data: data,
                    success: function (result) {
                        removeLoading('submitLoading');
                        if (result == 1) {
                            parent.layer.alert("发布成功", {
                                title: '系统提示',
                                icon: 1,
                                yes:function () {
                                    parent.layer.closeAll();
                                },
                                cancel: function(index, layero){//右上角关闭按钮触发的回调
                                    parent.layer.closeAll();
                                }
                            });
                        }
                        else if(result == 2){
                            parent.layer.alert("发布时间不能小于当前时间", {
                                title: '系统提示',
                                icon: 5
                            });
                        }
                        else {
                            parent.layer.alert("操作失败,请稍后重试", {
                                title: '系统提示',
                                icon: 2
                            });
                        }

                    }
                });

            },2000);

            return false;
        });

    });
</script>
</body>
</html>
