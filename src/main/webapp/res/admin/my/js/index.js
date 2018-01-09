if (!window.dateDiff) {
    $.get('util/getTimeDiff',
        {clientNowMs: new Date().getTime()},
        function (dateDiff) {
            window.dateDiff = dateDiff;
            //将时间差存在全局变量中，方便在其他模块中调用
        })
}

$(function () {
    var userId = $("#userId").html();
    connect();

    function connect() {
        $.ajax({
            url: "comet/open",
            cache: false,
            dataType: "text",
            success: function (data) {
                connect();
                data = JSON.parse(data);
                if (data.code == 7) {
                    if (userId == data.userId) {
                        layer.alert(data.msg, {
                            title: '系统消息',
                            icon: 5,
                            closeBtn: 0, //不显示关闭按钮
                            yes: function () {
                                window.location.href = data.url;
                            }
                        });
                    }
                }
            }
        });
    }

    $("#logout").click(function () {
        layer.confirm('确定退出系统吗？', {icon: 3, title: '提示', scrollbar: false, offset: ['auto']}, function (index) {
            window.location.href = "user/logout?loginType=2";
            layer.close(index);
        });
    });
});
