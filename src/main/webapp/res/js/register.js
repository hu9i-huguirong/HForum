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
    layui.use(['form', 'layer'], function () {
        var w = $(document).width() / 2.5 + "px";
        var h = $(document).height() / 4 + "px";
        var c = $("#loading").html();
        var form = layui.form, layer = layui.layer;
        ;
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
            var id = layer.msg(c, {
                shade: 0.4,
                offset: [h, w],//同时定义top、left坐标
                area: ['400px', '150px'],
                scrollbar: false,
                time: false //取消自动关闭
            });

            var e = data.field.email;
            $("#user-email-span").html(e);
            //发送邮件
            $.post("user/register", $('#form-register').serialize(), function (result) {
                layer.close(id);//手动关闭

                if (result == 107) {
                    layer.alert("该帐号已经被注册过了", {
                        offset: [h, w],
                        title: '消息',
                        icon: 2
                    });
                }
                else if (result == 101) {
                    layer.alert("该帐号已经冻结", {
                        offset: [h, w],
                        title: '消息',
                        icon: 2
                    });
                }
                else if (result == 102) {
                    var r = layer.alert("注册成功", {
                        skin: 'layui-layer-molv',
                        offset: [h, w],
                        title: '消息',
                        icon: 1,
                        yes: function () {
                            //切换步骤
                            $('.processorBox li').removeClass('current').eq(1).addClass('current');
                            $('.step').slideUp(300).eq(1).slideDown(500);
                            layer.close(r);
                        }
                    });

                }
                else {
                    layer.alert("注册失败", {
                        title: '消息',
                        icon: 2
                    });
                }

            });
            return false;
        });

        //重新发送
        $("#restartSend").click(function () {
            var lo = layer.msg(c, {
                shade: 0.4,
                offset: [h, w],//同时定义top、left坐标
                area: ['400px', '150px'],
                scrollbar: false,
                time: false //取消自动关闭
            });
            var e = $("#user-email-span").html();
            $.post("user/resend", {"email": e}, function (result) {
                layer.close(lo);//手动关闭
                if (result == 106) {
                    layer.alert("发送成功", {
                        skin: 'layui-layer-molv',
                        offset: [h, w],
                        title: '消息',
                        icon: 1
                    });
                }
                else if (result == 100) {
                    layer.alert("用户不存在", {
                        offset: [h, w],
                        title: '消息',
                        yes: function () {
                            window.location.reload();
                        },
                        icon: 2
                    });
                }
                else if (result == 105) {
                    var l = layer.msg('该帐号已经激活,是否前往首页登录?', {
                            time: 20000, //20s后自动关闭
                            offset: [h, w],
                            scrollbar: false,
                            time: false,//取消自动关闭
                            btn: ['好的', '不用了']
                            , yes: function (index, layero) {
                                //按钮【按钮一】的回调
                                window.location.href = "/";
                            }
                            , btn2: function (index, layero) {
                                //按钮【按钮二】的回调
                                layer.close(l);
                            }
                        }
                    )
                }
            });
        });
        //重新填写
        $("#restartReg").click(function () {
            $('.processorBox li').removeClass('current').eq(0).addClass('current');
            $('.step').slideUp(300).eq(0).slideDown(500);
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


    //登录邮箱
    $("#login-email").click(function () {
        var val = $('#user-email').val();
        var i = val.indexOf("@");
        var suffix = val.substring(i + 1, val.length);
        var address = "http://mail." + suffix;
        window.location.href = address;
    });


});