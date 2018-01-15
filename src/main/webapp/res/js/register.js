$(function () {
    //验证码
    var verify = $('#verify').pointsVerify({
        defaultNum: 6,	//默认的文字数量
        checkNum: 4,	//校对的文字数量
        vSpace: 5,	//间隔
        btnId: 'nextBtn',
        imgName: ['1.jpg', '2.jpg', '3.jpg', '4.jpg', '5.jpg', '6.jpg', '7.jpg', '8.jpg', '9.jpg', '10.jpg'],
        imgSize: {
            width: '600px',
            height: '200px',
        },
        barSize: {
            width: '600px',
            height: '40px',
        },
        ready: function () {
        },
        success: function () {
            // alert('验证成功，添加你自己的代码！');
            //......后续操作
        },
        error: function () {
            // alert('验证失败！');
        }
    });

    //表单模块
    layui.use(['form'], function () {
        var form = layui.form;
        //自定义验证规则
        form.verify({
            //校验密码
            pass: function (value) {
                //校验长度
                if (value.length < 6 || value.length > 20) {
                    return ' 密码长度不正确，仅限6~20个字符';
                }
                //非法字符
                var reg = /^[0-9a-zA-Z.。,!@#$%^&*]+$/;
                if (!reg.test(value)) {
                    return '密码不能包含非法字符';
                }
            },
            repass: function (value) {
                var val = $('#userPass').val();
                if (value != val) {
                    return '两次密码输入不一致';
                }
            },
            verify: function (value) {
                var msg = $(".verify-msg").html();
                if (msg.indexOf("验证成功") == -1) {
                    return '请进行验证';
                }
            }
        });
        //监听提交
        form.on('submit(next)', function (data) {
            $("#user-email-span").html(data.field.email);
            //切换步骤
            $('.processorBox li').removeClass('current').eq(1).addClass('current');
            $('.step').slideUp(300).eq(1).slideDown(500);
            return false;
        });

    });

    //邮箱输入提示
    var em = [];
    $.each($("dd"), function () {
        em[em.length] = $(this).html();
    });
    $("dd").click(function () {
        $('#user-email').val($(this).html());
        $("dl").hide();
    });
    $('#user-email').keyup(function () {
        var val = $(this).val();
        if (val != null && val.trim() != "") {
            var i = val.indexOf("@");
            $("dl").show();
            if (i != -1) {
                var suffix = val.substring(i, val.length);
                var prefix = val.substring(0, i);
                $.each($("dd"), function (index) {
                    if (em[index] == suffix) {
                        //相等说明刚好匹配上,也不需要显示提示信息了
                        $("dl").hide();
                    }
                    else if (em[index].indexOf(suffix) != -1) {
                        $(this).html(prefix + em[index]);
                        $(this).show();
                    }
                    else {
                        $(this).hide();
                    }
                });
            }
            else {
                $.each($("dd"), function (index) {
                    $(this).html(val + em[index]);
                });
            }

        }
        else {
            $("dl").hide();
        }
    });
    //密码强度
    $('#userPass').keyup(function () {
        //非法字符
        var reg = /^[0-9a-zA-Z.。,!@#$%^&*]+$/;
        var val = $(this).val();
        if (!reg.test(val) && val != null && val.trim() != "") {
            $("#pwd_tips").css("color", "#F00");
            $("#pwd_tips").html("检测到非法字符");
        }
        else {
            $("#pwd_tips").css("color", "#C1C2C3");
            $("#pwd_tips").html("请输入6-20位数字、字母或常用符号，<br/>字母区分大小写");
        }
        var strongRegex = /^(?=.{8,})(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)(?![a-zA-z\d]+$)(?![a-zA-z!@#$%^&*]+$)(?![\d!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$/;
        var mediumRegex = /^(?=.{7,})(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$/;
        var enoughRegex = /^(?=.{6,})(?:\d+|[a-zA-Z]+|[!@#$%^&*]+)/;
        if (false == enoughRegex.test(val)) {
            $('#level').removeClass('pw-weak');
            $('#level').removeClass('pw-medium');
            $('#level').removeClass('pw-strong');
            $('#level').addClass(' pw-defule');
            //密码小于六位的时候，密码强度图片都为灰色
        }
        else if (strongRegex.test(val)) {
            $('#level').removeClass('pw-weak');
            $('#level').removeClass('pw-medium');
            $('#level').removeClass('pw-strong');
            $('#level').addClass(' pw-strong');
            //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强
        }
        else if (mediumRegex.test(val)) {
            $('#level').removeClass('pw-weak');
            $('#level').removeClass('pw-medium');
            $('#level').removeClass('pw-strong');
            $('#level').addClass(' pw-medium');
            //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
        }
        else {
            $('#level').removeClass('pw-weak');
            $('#level').removeClass('pw-medium');
            $('#level').removeClass('pw-strong');
            $('#level').addClass('pw-weak');
            //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的
        }
        return true;

    });

    //重新填写
    $("#restartReg").click(function () {
        $('.processorBox li').removeClass('current').eq(0).addClass('current');
        $('.step').slideUp(300).eq(0).slideDown(500);
    });
    //登录邮箱
    $("#login-email").click(function () {
        var val = $('#user-email').val();
        var i = val.indexOf("@");
        var suffix = val.substring(i + 1, val.length);
        var address = "http://mail." + suffix;
        window.location.href = address;
    });
});