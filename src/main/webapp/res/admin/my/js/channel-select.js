$(function () {

    //生成下拉框数据
    var channelData = {};
    $.ajax({
        type: "POST",
        url: "channel/list",
        async: false,
        data: {paginate: false},
        success: function (result) {
            channelData = result.data;
            /**
             * ueditor二次加载(getEditor)渲染失败(加载失败)的原因解决方案
             * 在调用UE.getEditor(‘editor’)初始化UEditor时，
             * 先从放置编辑器的容器instances中获取，
             * 没有实例才实例化一个Editor，这就是引起问题的原因。
             * 在第一次跳转到编辑器界面时，正常的实例化了一个新的编辑器对象，
             * 并放入instances，调用editor.render(id)渲染编辑器的DOM；
             *第二次初始化时却仅从容器中取到实例：var editor = instances[id];
             * 直接返回了editor对象，而编辑器的DOM并没有渲染。
             *
             * 【解决方案】：
             * 1.再次使用时先删除之前的实例化对象，再进行再次实例化
             * UE.delEditor('editor');   //先删除之前实例的对象
             *UE.getEditor('editor');    //添加编辑器
             *
             * 2.使用之前的对象
             * UE.getEditor('editor');   //使用之前的对象
             */
            UE.getEditor('editor');//使用之前的对象

        }
    });

    function createOption(obj, disabledOptions, initText, selectOption) {
        var options = "<option value=''>" + initText + "</option>";
        $.each(channelData, function (i) {
            if (this.channelId == 1 || this.channelId == 2) {
                //去掉推荐和热点
                return true;
            }
            // $.inArray(ele.arr);判断数组是否包含某个元素 返回-1表示不包含 包含则返回元素下标
            var index = $.inArray(this.channelId, disabledOptions);
            if (index == -1) {
                if (selectOption != null && this.channelId == selectOption) {
                    options += "<option selected  value=" + this.channelId + ">" + this.channelName + "</option>";
                }
                else {
                    options += "<option  value=" + this.channelId + ">" + this.channelName + "</option>";
                }
            }
            else {
                options += "<option disabled value=" + this.channelId + ">" + this.channelName + "</option>";
            }

        });
        obj.html(options);
    }


    var cs = $("input[name='channelIds']");
    var chids = [];
    if (cs != null) {
        $.each(cs, function (index) {
            chids[index] = $(this).val();
        });
    }

    if (chids.length != 0) {
        createOption($("#channel-1"), [], '请选择分类一', chids[0]);
        if (cs.length > 1) {
            createOption($("#channel-2"), [parseInt(chids[0])], '请选择分类二', chids[1]);
            $("#channel-2-div").show();
        }
        if (cs.length > 2) {
            createOption($("#channel-3"), [parseInt(chids[0]), parseInt(chids[1])], '请选择分类三', chids[2]);
            $("#channel-3-div").show();
            $("#add-channel-div").hide();
        }
    }
    else {
        createOption($("#channel-1"), [], '请选择分类一', null);
    }


    $("#add-channel").click(function () {
        var c2 = $("#channel-2-div").css("display");
        var c3 = $("#channel-3-div").css("display");
        var v1 = $("#channel-1").val();
        var v2 = $("#channel-2").val();
        var form = layui.form;
        if (v1 == "") {
            parent.layer.open({
                icon: 2,
                title: '消息'
                , content: '请先选择分类一'
            });
        }
        else if (c2 == "none") {
            createOption($("#channel-2"), [parseInt(v1)], '请选择分类二', null);
            //重新渲染
            // form.render();
            form.render('select');
            // form.render('select', "channel-2");
            $("#channel-2-div").show();

        }
        else if (v2 == "") {
            parent.layer.open({
                icon: 2,
                title: '消息'
                , content: '请先选择分类二'
            });
        }
        else if (c3 == "none") {
            createOption($("#channel-3"), [parseInt(v1), parseInt(v2)], '请选择分类三', null);
            //重新渲染
            form.render('select');
            $("#channel-3-div").show();
            $("#add-channel-div").hide();
        }
    });
});


