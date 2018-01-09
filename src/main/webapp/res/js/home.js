$(function () {
    //栏目数据
    var aData1 = [];
    var aData2 = [];
    //副本
    var aData3 = [];
    var aData4 = [];

    // 轮播图
    // 专题切换//频道页banner轮播
    $(".focus").slide({
        titCell: ".tip li",
        mainCell: ".news_pic ul",
        effect: "left",
        autoPlay: true,
        delayTime: 200
    });
    // 专题文字切换
    $(".focus").slide({
        titCell: ".tip li",
        mainCell: ".ifocus_tx ul",
        effect: "left",
        autoPlay: true,
        delayTime: 200
    });
    // 搜索框
    $("input[name='keyword']").focus(function () {
        $("#hot_search").show();
    });
    $("input[name='keyword']").blur(function () {
        $("#hot_search").hide();
    });

    // 刷新
    $('.refreshfeed').click(function () {
        window.location.reload();
    });
    $(window).scroll(function () {// 滚动时触发函数
        var top = $(document).scrollTop();
        if (top == 0) {
            $('.go-top').hide();
        } else {
            $('.go-top').show();
        }
    });

    // 回到顶部
    $('.go-top').click(function () {
        $("body,html").animate({
            scrollTop: 0
        }, 800);
    });

    //栏目数据
    $.ajax({
        type: "POST",
        url: "channel/list",
        async: false,
        data: {paginate: false},
        success: function (result) {
            for (var i = 0; i < result.data.length; i++) {
                if (result.data[i].selected) {
                    aData1[aData1.length] = result.data[i];
                }
                else {
                    aData2[aData2.length] = result.data[i];
                }
            }
            aData3 = [].concat(aData1);
            aData4 = [].concat(aData2);
            createChannelElem(-1);
        }
    });

    function createChannelElem(index) {
        var ele = "<a class='logo' href='/'><img src='res/images/logo.png' title='HForum'><i style='font-size: 20px;color: #2577E3;padding-left:8px;'>HForum</i></a><ul>";

        if (index == -1) {
            $.each(aData1, function (i) {
                if (i == 0) {
                    ele += "<li id='" + this.channelId + "'><a class='wchannel-item active channel-selected'  href= 'javascript:;'><span>" + this.channelName + "</span></a></li>";
                }
                else {
                    ele += "<li id='" + this.channelId + "'><a class='wchannel-item channel-selected'  href='javascript:;'><span>" + this.channelName + "</span></a></li>"
                }
            });
        }
        else {
            $.each(aData1, function (i) {
                if (this.channelId == index) {
                    ele += "<li id='" + this.channelId + "'><a class='wchannel-item active channel-selected'  href= 'javascript:;'><span>" + this.channelName + "</span></a></li>";
                }
                else {
                    ele += "<li id='" + this.channelId + "'><a class='wchannel-item channel-selected'  href='javascript:;'><span>" + this.channelName + "</span></a></li>"
                }
            });
        }


        ele += "<li class='wchannel-more'><a  href='javascript:;' class='wchannel-item'><span>更多</span></a>"
        ele += "<div class='wchannel-more-layer'><ul class='more-channel-layer'>"


        $.each(aData2, function (i) {
            ele += "<li class='channel-more' id='" + this.channelId + "'><a class='y-left wchannel-item' href='javascript:;'><span>" + this.channelName + "</span></a></li>"
        });
        ele += "</ul></div></li></ul>";
        $(".wchannel").html(ele);

        bindClick();
    }

    function bindClick() {
        $(".channel-selected").click(function () {
            $("li .active").removeClass('active');
            $(this).addClass('active');
            var channelId = $(this).parent().attr("id");
            if (channelId != 1) {
                $("#J_carousel").hide();
            }
            else {
                $("#J_carousel").show();
            }
            createNewsEles(channelId);
        });

        $(".channel-more").click(function () {
            var channelId = $(this).attr("id");
            var channelName = $(this).find("span").html();
            var channel = {
                channelId: channelId,
                channelName: channelName
            };

            for (var i = 0; i < aData1.length; i++) {
                for (var j = 0; j < aData4.length; j++) {
                    if (aData1[i].channelId == aData4[j].channelId) {
                        aData2.splice(0, 0, aData1[i]);
                        aData1.splice(i, 1);
                        break;
                    }
                }
            }
            aData1.push(channel);
            for (var i = 0; i < aData2.length; i++) {
                if (aData2[i].channelId == channelId) {
                    aData2.splice(i, 1);
                    break;
                }
            }
            if (channelId != 1) {
                $("#J_carousel").hide();
            }
            else {
                $("#J_carousel").show();
            }
            createChannelElem(channelId);
            createNewsEles(channelId);
        });
    }

    createNewsEles(1);

    //新闻
    function createNewsEles(channelId) {
        var data = {paginate: false,front:true};
        if (channelId != 1 && channelId != 2) {
            data.channelId = channelId;
        }
        $.ajax({
            type: "POST",
            url: "news/list",
            async: false,
            data: data,
            success: function (result) {
                var news = "<ul>";
                $.each(result.data, function () {
                    var len = this.images.length;
                    var newsId = this.news.newsId;
                    if (len == 3) {
                        news += "<li class=\"item J_add\" >"
                    }
                    else {
                        news += "<li class=\"item\" >"
                    }

                    news += "<div class=\"item-inner y-box\">";
                    if (len == 0) {
                        news += "<div class=\"normal no-image \">";
                    }
                    else if (len == 1) {
                        news += "<div class=\"normal rbox \">";
                    }
                    else {
                        news += "<div class=\"normal\">";
                    }
                    news += "<div class=\"rbox-inner\">";
                    news += "<div class=\"title-box\"><a class=\"link title\" target=\"_blank\" href=\"news/detail/"+newsId+"\">" + this.news.newsTitle + "</a></div>";
                    if (len > 1) {
                        news += "<div class=\"img-list y-box\">";
                        $.each(this.images, function () {
                            news += "<a class=\"img-wrap\" target=\"_blank\" href=\"news/detail/"+newsId+"\"><img alt=\"\" src=\"" + this.imageContent + "\"></a>";
                        });
                        if (len == 3) {
                            news += "<a class=\"img-wrap\" target=\"_blank\" href=\"news/detail/"+newsId+"\"><span class=\"add-info\">查看详情&nbsp;<i class=\"y-icon icon-next-page\"></i></span></a>";
                        }
                        if (len >= 4) {
                            news += "<span class=\"img-num\">" + len + "图</span>";
                        }
                        news += "</div>";
                    }
                    news += "<div class=\"y-box footer\"><div class=\"y-left\">";
                    $.each(this.channels, function () {
                        news += "<a target=\"_blank\"  class=\"lbtn tag tag-bg-other\" href=\"javascript:;\">" + this.channelName + "</a>";
                    });
                    news += "<div class=\"y-left\"><a class=\"lbtn media-avatar\" target=\"_blank\" href=\"javascript:;\"><img alt=\"\" src=\"res/images/user_default.png\"></a> ";
                    news += "<a class=\"lbtn source\" target=\"_blank\" href=\"javascript:;\">&nbsp;" + this.news.newsFrom + "&nbsp;⋅</a><a class=\"lbtn comment\" target=\"_blank\" href=\"javascript:;\">&nbsp;0评论&nbsp;⋅</a>";
                    news += "</div><span class=\"lbtn\">&nbsp;刚刚</span></div><div class=\"y-right\"><span class=\"dislike\"> 不感兴趣 <i class=\"y-icon icon-dislikenewfeed\"></i></span></div></div></div></div>";

                    if (len == 1) {
                        news += " <div class=\"lbox\"><a class=\"img-wrap\" target=\"_blank\" href=\"article.html\">";
                        news += "<img alt=\"\" style='width: 158px;height: 102px;' src=\"" + this.images[0].imageContent + "\"></a></div>";
                    }
                    news += "</div></li>";
                });
                if (result.data.length > 0) {
                    news += "<li class=\"item \" ><div class=\"list-refresh-msg\"><span>刚刚看到这里</span> &nbsp;点击刷新&nbsp;<i class=\"y-icon icon-refreshfeed\"></i></div></li>";
                } else {
                    news += "<div style='position: fixed;'><fieldset class=\"layui-elem-field layui-field-title\"  style=\"margin-top: 270px;\";>";//
                    news += "<legend style='margin-left: 150px;margin-right: 150px;'>该分类还没有相关新闻,您可以<a href='javascript:;' style='color:#FF8400; '>申请投稿</a>哦</legend></fieldset></div>";
                }
                news += "</ul>";
                $(".wcommonFeed").html(news);
            }
        });

    }
});


