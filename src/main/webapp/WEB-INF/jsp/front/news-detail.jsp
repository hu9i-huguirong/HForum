<%--
  Created by IntelliJ IDEA.
  User: 胡桂榕
  Date: 2018/1/8
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/jsp/common/common.jsp" %>
    <c:if test="${detailNewsVo==null}">
        <c:redirect url="/news/detail/${param.newsId}"/>
    </c:if>
    <title>${detailNewsVo.news.newsTitle}</title>
    <link type="text/css" rel="stylesheet" href="res/css/slides-playing/base.css">
    <link type="text/css" rel="stylesheet" href="res/css/detail.css">
    <link rel="stylesheet" href="res/admin/plugins/layui-v2.2.45/css/layui.css" media="all">
    <style type="text/css">
        .doc-wrapper {
            width: 970px;
            padding: 0 10px;
            margin: 0 auto;
            text-align: left;
        }
    </style>
    <link rel="stylesheet" href="res/plugins/chanyan/css/pinlun.css"/>
    <script src="res/admin/plugins/layui-v2.2.45/layui.js" charset="utf-8"></script>
</head>
<body style="overflow-x:hidden"><%-- 去横向滚动条 --%>
<!--top-->
<div class="top_wrap">
    <div class="clearfix top w1200">
        <div class="fl top_left" ><a href="/" target="_blank" title="HForum" style="color: #FFFFFF">&nbsp;&nbsp;&nbsp;首页</a></div>
        <ul class="fr clearfix top_right">
            <li class="register"><a href="javascript:;" style="color: #FFFFFF">注册</a></li>
            <li class="login"><a href="javascript:;" style="color: #FFFFFF">登陆</a></li>
        </ul>
    </div>
</div>
<!--/top-->
<div class="column_market w1200 pt20 clearfix" style="margin-bottom: 80px;margin-left: 220px;">
    <!--left-->
    <div class="detail_left fl">
       <span class="layui-breadcrumb" lay-separator=">">
                    <a href="/">首页</a>
                    <a href="">国际新闻</a>
                    <a href="">亚太地区</a>
                    <a><cite>正文</cite></a>
       </span>
        <div class="artical">
            <h1><a href="javascript:;">${detailNewsVo.news.newsTitle}</a></h1>
            <div class="clearfix">
                <ul class="fl origin">
                    <li><a href="javascript:;">来源：${detailNewsVo.news.newsFrom}</a></li>　
                    <li><a href="javascript:;">编辑：${detailNewsVo.userName}&nbsp;&nbsp;<fmt:formatDate value="${detailNewsVo.news.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></a></li>　
                </ul>
                <div class="fr view"><img src="res/images/news-detail/detail_ico2.png">1582</div>
            </div>
            <div class="abstract">
                摘要：${detailNewsVo.news.newsTitle}。
            </div>
            ${detailNewsVo.news.newsContent}
            <div class="clearfix bottom pt40">
                <div class="fl"><span>分类:</span>
                    <c:forEach var="v" items="${detailNewsVo.channels}">
                        <a href="javascript:;">${v.channelName}</a>
                    </c:forEach>
                </div>
                <div class="fr share"><span>分享到: </span>
                    <img src="res/images/news-detail/qq.png" title="QQ"
                         style="width: 30px;height: 30px;margin-right: 10px;cursor:pointer">
                    <img src="res/images/news-detail/qzone.png" title="QQ空间"
                         style="width: 32px;height: 32px;margin-right: 10px;cursor:pointer">
                    <img src="res/images/news-detail/wechat.png" title="微信"
                         style="width: 30px;height: 30px;margin-right: 10px;cursor:pointer">
                    <img src="res/images/news-detail/wechat_friend.png" title="微信朋友圈"
                         style="width: 30px;height: 30px;margin-right: 10px;cursor:pointer">
                    <img src="res/images/news-detail/weibo.png" title="微博"
                         style="width: 30px;height: 30px;cursor:pointer">
                </div>
            </div>
        </div>
        <div class="doc-wrapper">
            <!--普通版-->
            <div id="SOHUCS" sid="demo">
                <div id="SOHU_MAIN">
                    <div node-type="cy-collection-btn" class="cy-collection-btn">
                        <i></i><span>收藏文章</span>
                    </div>
                    <div class="module-cmt-header">
                        <div class="cy-hidden">
                            <button id="jump-to-kz"></button>
                        </div>
                        <div class="clear-g section-title-w">
                            <div class="title-user-w">
                                <div node-type="user" class="clear-g user-wrap-w">
                                    <span node-type="user-name" class="wrap-name-w"></span>
                                </div>
                            </div>
                        </div>
                        <div class="section-cbox-w">
                            <div class="cbox-block-w clear-g">
                                <div node-type="block-head-w" class="block-head-w">
                                    <div node-type="avatar" class="head-img-w">
                                        <a href="javascript:void(0);"> <img node-type="user-head"
                                                                            src="res/plugins/chanyan/demo_files/pic42_null.gif"
                                                                            width="42" height="42"
                                                                            alt="">
                                            <div node-type="head-img-ie-mask" class="head-img-ie-mask"></div>
                                        </a>
                                        <div node-type="notice-node" style="display: none"
                                             class="cy-avatar-notice-node"></div>
                                    </div>
                                    <div node-type="header-login" class="header-login">登录</div>
                                    <div class="cy-to-shequ-head">
                                        <span>我的社区</span>
                                    </div>
                                    <div node-type="cy-hot-words" class="cy-hot-words"></div>
                                </div>
                                <div node-type="login-select" class="block-post-w">
                                    <!-- 放置cbox初始状态 -->
                                    <div class="module-cmt-box">
                                        <!-- 展开状态 -->
                                        <div class="post-wrap-w">
                                            <div class="post-wrap-border-l"></div>
                                            <div class="post-wrap-border-r"></div>
                                            <div node-type="post-wrap-main" class="post-wrap-main">
                                                <div class="post-wrap-border-t">
                                                    <div node-type="post-wrap-border-t-l"
                                                         class="post-wrap-border-t-l"></div>
                                                    <div node-type="post-wrap-border-t-r"
                                                         class="post-wrap-border-t-r"></div>
                                                </div>
                                                <div class="wrap-area-w">
                                                    <div class="area-textarea-w">
													<textarea node-type="textarea" name="" placeholder="来说两句吧..."
                                                              class="textarea-fw textarea-bf"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clear-g wrap-action-w">
                                                <div class="action-function-w">
                                                    <ul class="clear-g">
                                                        <li node-type="function-face" class="function-face-w">
                                                            <a class="effect-w" href="javascript:void(0)"> <i
                                                                    class="face-b"></i>
                                                            </a>
                                                        </li>
                                                        <li node-type="function-uploading"
                                                            class="function-uploading-w"><a class="effect-w"
                                                                                            href="javascript:void(0)"
                                                                                            title="上传图片"> <i
                                                                class="uploading-b"></i>
                                                        </a>
                                                            <div class="uploading-file-w">
                                                                <a href="javascript:void(0);" name="" class="file-fw"></a>
                                                            </div>
                                                            <form style="display: none;">
                                                                <input name="file" type="file"
                                                                       accept="image/jpg,image/jpeg,image/png">
                                                            </form>
                                                        </li>
                                                    </ul>
                                                    <!-- 表情 -->
                                                    <div node-type="face-box" class="face-wrapper-dw">
                                                        <div node-type="face-cont" class="wrapper-cont-dw">
                                                            <ul class="clear-g">
                                                                <li><span title="流汗" data_path="base" data-ubb="/流汗"
                                                                          class="face-item face_01"></span></li>
                                                                <li><span title="钱" data_path="base" data-ubb="/钱"
                                                                          class="face-item face_02"></span></li>
                                                                <li><span title="发怒" data_path="base" data-ubb="/发怒"
                                                                          class="face-item face_03"></span></li>
                                                                <li><span title="浮云" data_path="base" data-ubb="/浮云"
                                                                          class="face-item face_04"></span></li>
                                                                <li><span title="给力" data_path="base" data-ubb="/给力"
                                                                          class="face-item face_05"></span></li>
                                                                <li><span title="大哭" data_path="base" data-ubb="/大哭"
                                                                          class="face-item face_06"></span></li>
                                                                <li><span title="憨笑" data_path="base" data-ubb="/憨笑"
                                                                          class="face-item face_07"></span></li>
                                                                <li><span title="色" data_path="base" data-ubb="/色"
                                                                          class="face-item face_08"></span></li>
                                                            </ul>
                                                            <ul class="clear-g">
                                                                <li><span title="奋斗" data_path="base" data-ubb="/奋斗"
                                                                          class="face-item face_09"></span></li>
                                                                <li><span title="鼓掌" data_path="base" data-ubb="/鼓掌"
                                                                          class="face-item face_10"></span></li>
                                                                <li><span title="鄙视" data_path="base" data-ubb="/鄙视"
                                                                          class="face-item face_11"></span></li>
                                                                <li><span title="可爱" data_path="base" data-ubb="/可爱"
                                                                          class="face-item face_12"></span></li>
                                                                <li><span title="闭嘴" data_path="base" data-ubb="/闭嘴"
                                                                          class="face-item face_13"></span></li>
                                                                <li><span title="疑问" data_path="base" data-ubb="/疑问"
                                                                          class="face-item face_14"></span></li>
                                                                <li><span title="抓狂" data_path="base" data-ubb="/抓狂"
                                                                          class="face-item face_15"></span></li>
                                                                <li><span title="惊讶" data_path="base" data-ubb="/惊讶"
                                                                          class="face-item face_16"></span></li>
                                                            </ul>
                                                            <ul class="clear-g">
                                                                <li><span title="可怜" data_path="base" data-ubb="/可怜"
                                                                          class="face-item face_17"></span></li>
                                                                <li><span title="弱" data_path="base" data-ubb="/弱"
                                                                          class="face-item face_18"></span></li>
                                                                <li><span title="强" data_path="base" data-ubb="/强"
                                                                          class="face-item face_19"></span></li>
                                                                <li><span title="握手" data_path="base" data-ubb="/握手"
                                                                          class="face-item face_20"></span></li>
                                                                <li><span title="拳头" data_path="base" data-ubb="/拳头"
                                                                          class="face-item face_21"></span></li>
                                                                <li><span title="酒" data_path="base" data-ubb="/酒"
                                                                          class="face-item face_22"></span></li>
                                                                <li><span title="玫瑰" data_path="base" data-ubb="/玫瑰"
                                                                          class="face-item face_23"></span></li>
                                                                <li><span title="打酱油" data_path="base"
                                                                          data-ubb="/打酱油" class="face-item face_24"></span></li>
                                                            </ul>
                                                        </div>
                                                        <div node-type="user-face-cont"
                                                             class="wrapper-user-face-dw nano">
                                                            <div class="nano-content">
                                                                <ul class="clear-g">
                                                                    <li class="upload-face-btn"></li>
                                                                    <li class="manage-face-btn"></li>
                                                                    <li class="cancel-face-btn"></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div node-type="face-tab" class="action-face-tab-dw">
                                                            <ul class="clear-g">
                                                                <li node-type="official-face"
                                                                    class="official-face-btn active"></li>
                                                                <li node-type="user-face" class="user-face-btn"
                                                                    style="display: none;"></li>
                                                            </ul>
                                                        </div>
                                                        <div node-type="confirm-box" class="cy-confirm-box">
                                                            <div class="cy-confirm-text">
                                                                <span>表情删除后不可恢复，是否删除</span>
                                                            </div>
                                                            <div class="cy-confirm-btn-row">
                                                                <div class="cy-confirm-btn-cancel">取消</div>
                                                                <div class="cy-confirm-btn-confirm">确定</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--  上传图片 -->
                                                    <!--  uploading-efw -->
                                                    <div node-type="uploading-wrapper"
                                                         class="uploading-wrapper-dw uploading-efw ">
                                                        <div class="uploading-wrapper-dw-t"></div>
                                                        <div class="uploading-wrapper-dw-b"></div>
                                                        <div node-type="image-uploading" class="wrapper-loading-dw">
                                                            <div class="loading-word-dw">
                                                                <span class="word-icon-dw"></span>图片正在上传，请稍后...
                                                            </div>
                                                            <div class="loading-btn-dw">
                                                                <a href="javascript:void(0)">取消上传</a>
                                                            </div>
                                                        </div>
                                                        <div node-type="image-uploaded" class="wrapper-image-dw">
                                                            <div class="image-close-dw">
                                                                <a href="javascript:void(0)"></a>
                                                            </div>
                                                            <div class="image-pic-dw">
                                                                <img node-type="image-pic" alt="" src="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clear-g action-issue-w">
                                                    <div class="issue-btn-w">
                                                        <a href="javascript:void(0)">
                                                            <button node-type="issue" class="btn-fw"></button>
                                                        </a>
                                                    </div>
                                                    <!--
                <div class="issue-icon-w" node-type="share-icons">
                    </div>
                -->
                                                </div>
                                                <div class="cbox-prompt-w" node-type="error-tips">
                                                    <span node-type="prompt-empty" class="prompt-empty-w">评论内容为空！</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 放置cbox发布状态 -->
                                    <!-- 提示条 -->
                                    <!-- 零评论提示条 -->
                                    <div class="list-comment-empty-w"></div>
                                    <!-- 提示连接到快站社区 -->
                                    <!-- <div class="list-comment-kuaizhan-w">
                        <div node-type="kuaizhan-prompt" class="kuaizhan-prompt-w">
                            <span class="prompt-text-w">点击查看更多精彩内容</span>
                        </div>
                    </div> -->
                                    <!--关闭评论-->
                                    <div class="list-close-comment-w"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 评论列表  S -->
                    <div node-type="module-cmt-list"
                         class="module-cmt-list section-list-w">

                        <div class="cmt-list-type">
                            <ul class="clear-g type-lists">
                                <li class="type-list active">评论</li>
                                <!-- <li class="type-list">热门</li> -->
                            </ul>
                            <div class="cmt-list-border"></div>
                            <div class="cmt-list-number">
							<span class="comment-number"><span class="cy-number">2144</span>人参与,<span
                                    class="cy-number">971</span>条评论</span>
                            </div>
                        </div>

                        <!-- 热门评论 -->
                        <div class="list-block-gw list-hot-w">
                            <div class="block-title-gw">
                                <ul class="clear-g">
                                    <li>
                                        <div class="title-name-gw">
                                            <div class="title-name-gw-tag"></div>
                                            热门评论
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div node-type="hot-list">
                                <div node-type="cmt-item" data-id="1016701352"
                                     data-user-id="400744116" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="幻野">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/400744116_1462441172189_c55"
                                                        width="42"
                                                        height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div node-type="prop-wrap" class="prop-wrap"
                                             style="height: 90px;"></div>
                                        <div class="msg-wrap-gw" style="margin-top: -90px;">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2016年5月5日 17:39</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">幻野</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>北京市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">骗章拿钱啦啦</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg">6</em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1004459624"
                                     data-user-id="207629200" data-platform-id="6"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="袁梦溪">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/207629200_1419233786729_c55"
                                                        width="42"
                                                        height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div node-type="prop-wrap" class="prop-wrap"
                                             style="height: 90px;"></div>
                                        <div class="msg-wrap-gw" style="margin-top: -90px;">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2016年4月7日 14:22</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">袁梦溪</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-1-gw"> <i>肆肆肆肆肆肆肆肆</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>北京市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">111111</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg">108</em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1401893107"
                                     data-user-id="257456253" data-platform-id="11"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="科少">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/257456253_1434724650922_c55"
                                                        width="42"
                                                        height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div node-type="prop-wrap" class="prop-wrap"
                                             style="height: 90px;"></div>
                                        <div class="msg-wrap-gw" style="margin-top: -90px;">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2017年7月7日 23:44</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">科少</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-4-gw"> <i>nil</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>四川省乐山市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">...........</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg">3</em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1065586683"
                                     data-user-id="109236671" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="贱荡八方">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/fac494264beff70ed91fedf32783552b_ss_1450342611920_jpg"
                                                        width="42" height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div node-type="prop-wrap" class="prop-wrap"
                                             style="height: 90px;"></div>
                                        <div class="msg-wrap-gw" style="margin-top: -90px;">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2016年6月22日 23:27</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">贱荡八方</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>福建省宁德市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">我也要章！！！！</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg">3</em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="986636688"
                                     data-user-id="40109243" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="顶新国际">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/fac494264beff70ed91fedf32783552b_default_1452840781780_jpg"
                                                        width="42" height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div node-type="prop-wrap" class="prop-wrap"
                                             style="height: 90px;"></div>
                                        <div class="msg-wrap-gw" style="margin-top: -90px;">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2016年3月9日 11:09</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">顶新国际</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-4-gw"> <i>nil</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>北京市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">分享图片</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg">11</em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 最新评论 -->
                        <div class="list-block-gw list-newest-w">
                            <div node-type="cmt-list-title" class="block-title-gw">
                                <ul class="clear-g">
                                    <li>
                                        <div class="title-name-gw title-name-bg">
                                            <div class="title-name-gw-tag"></div>
                                            最新评论
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div node-type="cmt-list" id="cy-cmt-list">
                                <div node-type="cmt-item" data-id="1531262305"
                                     data-user-id="204662586" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="中国好姨妈">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/clip_picture_1490109991482"
                                                        width="42"
                                                        height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">23分钟前</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">中国好姨妈</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-4-gw"> <i>nil</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>山东省</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">....<br></span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1531236679"
                                     data-user-id="849214311" data-platform-id="15"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="曾经的回忆">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/fac494264beff70ed91fedf32783552b_default_1449556154841_jpg"
                                                        width="42" height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">今日16:09</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">曾经的回忆</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>北京市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">打了赏，也按要求关注了，注册机在哪儿？总经有个说法吧？</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1531223509"
                                     data-user-id="11620021" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="是第三代看空间看看">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/qpAUV5f_jps" width="42" height="42"
                                                        alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">今日14:34</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">是第三代看空间看看</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>广东省佛山市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">来说两句吧...111</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1531217610"
                                     data-user-id="1136992892" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="放手">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/11111.gif" width="42" height="42"
                                                        alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">今日13:37</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">放手</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>甘肃省天水市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">机械之血怎么没有啊，成龙演的</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1531085726"
                                     data-user-id="940227563" data-platform-id="15"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="花雨黯">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/fac494264beff70ed91fedf32783552b_default_1449556036996_jpg"
                                                        width="42" height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2018年1月7日 17:15</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">花雨黯</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>江苏省扬州市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
												<span class="wrap-word-gw">Come on!<span title="玫瑰"
                                                                                         class="face-item face_23"></span></span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1530922797"
                                     data-user-id="940092689" data-platform-id="15"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="撕裂一席微凉">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/fac494264beff70ed91fedf32783552b_default_1449556145749_jpg"
                                                        width="42" height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2018年1月6日 23:39</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">撕裂一席微凉</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>广东省广州市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">ff</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1530922600"
                                     data-user-id="940092689" data-platform-id="15"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="撕裂一席微凉">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/fac494264beff70ed91fedf32783552b_default_1449556145749_jpg"
                                                        width="42" height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2018年1月6日 23:39</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">撕裂一席微凉</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>广东省广州市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">fff</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1530881523"
                                     data-user-id="939999877" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="Arcovery">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/939999877_1515232303419_c55"
                                                        width="42"
                                                        height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2018年1月6日 19:23</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">Arcovery</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">我也要章！！！！</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1530599239"
                                     data-user-id="849987652" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="蓝色的夏天">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/clip_picture_1514995863224"
                                                        width="42"
                                                        height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2018年1月5日 11:41</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">蓝色的夏天</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-4-gw"> <i>nil</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>贵州省遵义市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">分享图片</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->
                                            <!-- 图片展示  Begin -->
                                            <!--   wrap-picture-hide-e  -->
                                            <div node-type="image-view"
                                                 class="wrap-picture-show-gw wrap-picture-hide-e ">
                                                <div class="picture-box-gw picture-box-bg">
                                                    <div class="box-action-gw">
                                                        <ul class="clear-g">
                                                            <li node-type="fold" class="action-area-gw action-hide-gw"><a
                                                                    href="javascript:;"><i class="area-icon-gw"></i>收起</a></li>
                                                            <li><i class="gap-gw gap-bg"></i></li>
                                                            <li class="action-area-gw action-look-gw"><a
                                                                    href="res/plugins/chanyan/demo_files/qFPaw6g_png"
                                                                    target="_blank"><i
                                                                    class="area-icon-gw"></i>查看原图</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="box-area-gw">
                                                        <div class="area-image-gw area-image-e">
                                                            <img node-type="image"
                                                                 src="res/plugins/chanyan/demo_files/qFPaw6g_png">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 图片展示  End -->
                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1530413815"
                                     data-user-id="849987652" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="蓝色的夏天">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/clip_picture_1514995863224"
                                                        width="42"
                                                        height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2018年1月4日 0:03</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">蓝色的夏天</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-4-gw"> <i>nil</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>贵州省遵义市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">分享图片</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->
                                            <!-- 图片展示  Begin -->
                                            <!--   wrap-picture-hide-e  -->
                                            <div node-type="image-view"
                                                 class="wrap-picture-show-gw wrap-picture-hide-e ">
                                                <div class="picture-box-gw picture-box-bg">
                                                    <div class="box-action-gw">
                                                        <ul class="clear-g">
                                                            <li node-type="fold" class="action-area-gw action-hide-gw"><a
                                                                    href="javascript:;"><i class="area-icon-gw"></i>收起</a></li>
                                                            <li><i class="gap-gw gap-bg"></i></li>
                                                            <li class="action-area-gw action-look-gw"><a
                                                                    href="res/plugins/chanyan/demo_files/qFGukV5_jpg"
                                                                    target="_blank"><i
                                                                    class="area-icon-gw"></i>查看原图</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="box-area-gw">
                                                        <div class="area-image-gw area-image-e">
                                                            <img node-type="image"
                                                                 src="res/plugins/chanyan/demo_files/qFGukV5_jpg">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 图片展示  End -->
                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1530359149"
                                     data-user-id="937978473" data-platform-id="15"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="灰烟飞">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/fac494264beff70ed91fedf32783552b_default_1449556211403_jpg"
                                                        width="42" height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2018年1月3日 17:17</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">灰烟飞</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>福建省泉州市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">123</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1530301502"
                                     data-user-id="937766384" data-platform-id="15"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="花雨黯">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/fac494264beff70ed91fedf32783552b_default_1449556192010_jpg"
                                                        width="42" height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2018年1月3日 11:02</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">花雨黯</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>河北省秦皇岛市</i>网友]
											</span>
                                            </div>


                                            <!-- 盖楼 Begin -->
                                            <div class="wrap-build-gw">
                                                <div node-type="cmt-item floor-item" data-id="1530301566"
                                                     data-user-id="937766384" data-platform-id="15"
                                                     class="build-floor-gw">
                                                    <div node-type="child-floor"></div>
                                                    <div node-type="floor-content" class="build-msg-gw">
                                                        <div class="wrap-user-gw">
                                                            <span class="user-time-gw user-floor-gw">1</span> <span
                                                                node-type="nickname" class="user-name-gw"><a
                                                                href="javascript:void(0)">花雨黯</a></span> <span
                                                                class="user-address-gw">[<i>河北省秦皇岛市</i>网友]
														</span>
                                                        </div>

                                                        <div>
                                                            <div class="wrap-issue-gw">
                                                                <p class="issue-wrap-gw">
                                                                    <span class="wrap-word-gw">这也行？ </span>
                                                                </p>
                                                                <div class="cy-see-more">
                                                                    <span></span><i></i>
                                                                </div>
                                                            </div>
                                                            <!-- 图片展示 -->

                                                            <div node-type="action-bar btns-bar"
                                                                 class="clear-g wrap-action-gw">
                                                                <div class="action-click-gw">
                                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                                 class="click-report-gw"><a
                                                                        href="javascript:void(0)"><i
                                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                                        class="gap-gw"></i><span node-type="reply"
                                                                                                 class="click-reply-gw"> <a
                                                                        href="javascript:void(0)">回复</a>
																</span> <i class="gap-gw"></i> <span node-type="support"
                                                                                                     class="click-ding-gw"> <a
                                                                        href="javascript:;"><i
                                                                        class="icon-gw icon-ding-bg"></i><em
                                                                        class="icon-name-bg">1</em></a>
																</span>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 盖楼 End -->

                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">我的天<br></span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1530301566"
                                     data-user-id="937766384" data-platform-id="15"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="花雨黯">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/fac494264beff70ed91fedf32783552b_default_1449556192010_jpg"
                                                        width="42" height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2018年1月3日 11:02</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">花雨黯</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>河北省秦皇岛市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">这也行？<br></span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg">1</em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1529204742"
                                     data-user-id="929094997" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="拘尸法王">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/clip_picture_1514376270250"
                                                        width="42"
                                                        height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div node-type="prop-wrap" class="prop-wrap"
                                             style="height: 249px;">
                                        </div>
                                        <div class="msg-wrap-gw" style="margin-top: -249px;">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2017年12月27日 20:12</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">拘尸法王</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-1-gw"> <i>肆肆肆肆肆肆肆肆</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>广西壮族自治区梧州市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">携女神前来亮相！</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->
                                            <!-- 图片展示  Begin -->
                                            <!--   wrap-picture-hide-e  -->
                                            <div node-type="image-view"
                                                 class="wrap-picture-show-gw wrap-picture-hide-e ">
                                                <div class="picture-box-gw picture-box-bg">
                                                    <div class="box-action-gw">
                                                        <ul class="clear-g">
                                                            <li node-type="fold" class="action-area-gw action-hide-gw"><a
                                                                    href="javascript:;"><i class="area-icon-gw"></i>收起</a></li>
                                                            <li><i class="gap-gw gap-bg"></i></li>
                                                            <li class="action-area-gw action-look-gw"><a
                                                                    href="res/plugins/chanyan/demo_files/qF0CetP_jpg"
                                                                    target="_blank"><i
                                                                    class="area-icon-gw"></i>查看原图</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="box-area-gw">
                                                        <div class="area-image-gw area-image-e">
                                                            <img node-type="image"
                                                                 src="res/plugins/chanyan/demo_files/qF0CetP_jpg">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 图片展示  End -->
                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1528364252"
                                     data-user-id="84172460" data-platform-id="11"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="室内装修爱好者">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/4c9baf491c8f4de69273683602623bef.jpeg"
                                                        width="42" height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div node-type="prop-wrap" class="prop-wrap"
                                             style="height: 90px;">
                                        </div>
                                        <div class="msg-wrap-gw" style="margin-top: -90px;">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2017年12月19日 16:28</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">室内装修爱好者</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>湖南省长沙市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">回避</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1527701100"
                                     data-user-id="1055513024" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="ECARGO">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/11111.gif" width="42" height="42"
                                                        alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div node-type="prop-wrap" class="prop-wrap"
                                             style="height: 147px;">
                                        </div>
                                        <div class="msg-wrap-gw" style="margin-top: -147px;">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2017年12月13日 10:57</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">ECARGO</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>上海市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
												<span class="wrap-word-gw"><span title="钱"
                                                                                 class="face-item face_02"></span></span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->
                                            <!-- 图片展示  Begin -->
                                            <!--   wrap-picture-hide-e  -->
                                            <div node-type="image-view"
                                                 class="wrap-picture-show-gw wrap-picture-hide-e ">
                                                <div class="picture-box-gw picture-box-bg">
                                                    <div class="box-action-gw">
                                                        <ul class="clear-g">
                                                            <li node-type="fold" class="action-area-gw action-hide-gw"><a
                                                                    href="javascript:;"><i class="area-icon-gw"></i>收起</a></li>
                                                            <li><i class="gap-gw gap-bg"></i></li>
                                                            <li class="action-area-gw action-look-gw"><a
                                                                    href="res/plugins/chanyan/demo_files/qDEvqcH_jpg"
                                                                    target="_blank"><i
                                                                    class="area-icon-gw"></i>查看原图</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="box-area-gw">
                                                        <div class="area-image-gw area-image-e">
                                                            <img node-type="image"
                                                                 src="res/plugins/chanyan/demo_files/qDEvqcH_jpg">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 图片展示  End -->
                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1527701146"
                                     data-user-id="1055513024" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="ECARGO">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/11111.gif" width="42" height="42"
                                                        alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2017年12月13日 10:57</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">ECARGO</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>上海市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">77777777777777777777777</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1527701027"
                                     data-user-id="1055513024" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="ECARGO">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/11111.gif" width="42" height="42"
                                                        alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2017年12月13日 10:56</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">ECARGO</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>上海市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">77777777777777777777</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1527450741"
                                     data-user-id="926891316" data-platform-id="3"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="橴S单纯">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/926891316_1513061074520_c55"
                                                        width="42"
                                                        height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div class="msg-wrap-gw">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2017年12月12日 14:46</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">橴S单纯</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-2-gw"> <i>
											</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">连中18期了</span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->
                                            <!-- 图片展示  Begin -->
                                            <!--   wrap-picture-hide-e  -->
                                            <div node-type="image-view"
                                                 class="wrap-picture-show-gw wrap-picture-hide-e ">
                                                <div class="picture-box-gw picture-box-bg">
                                                    <div class="box-action-gw">
                                                        <ul class="clear-g">
                                                            <li node-type="fold" class="action-area-gw action-hide-gw"><a
                                                                    href="javascript:;"><i class="area-icon-gw"></i>收起</a></li>
                                                            <li><i class="gap-gw gap-bg"></i></li>
                                                            <li class="action-area-gw action-look-gw"><a
                                                                    href="res/plugins/chanyan/demo_files/qDzAmlx_jpg"
                                                                    target="_blank"><i
                                                                    class="area-icon-gw"></i>查看原图</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="box-area-gw">
                                                        <div class="area-image-gw area-image-e">
                                                            <img node-type="image"
                                                                 src="res/plugins/chanyan/demo_files/qDzAmlx_jpg">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 图片展示  End -->
                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div node-type="cmt-item" data-id="1527430161"
                                     data-user-id="1164054197" data-platform-id="11"
                                     class="clear-g block-cont-gw">
                                    <div class="cont-head-gw">
                                        <div class="head-img-gw">
                                            <a node-type="photo" href="javascript:;" title="郑在发声">
                                                <div class="img-corner"></div>
                                                <img
                                                        src="res/plugins/chanyan/demo_files/clip_picture_1504310722394"
                                                        width="42"
                                                        height="42" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="cont-msg-gw">
                                        <div node-type="prop-wrap" class="prop-wrap"
                                             style="height: 90px;">
                                        </div>
                                        <div class="msg-wrap-gw" style="margin-top: -90px;">
                                            <div class="wrap-user-gw global-clear-spacing">
                                                <span class="user-time-gw">2017年12月12日 11:14</span> <span
                                                    node-type="nickname" class="user-name-gw"><a
                                                    href="javascript:void(0)">郑在发声</a></span>
                                                <!-- 管理员、铭牌图标 -->
                                                <span class="user-level-gw user-1-4-gw user-4-gw"> <i>nil</i>
											</span>
                                                <!-- 管理员、铭牌图标 END -->

                                                <span class="user-address-gw">[<i>云南省昆明市</i>网友]
											</span>
                                            </div>


                                            <div class="wrap-issue-gw">
                                                <p class="issue-wrap-gw">
                                                    <span class="wrap-word-gw">啥意思<br></span>
                                                </p>
                                                <div class="cy-see-more">
                                                    <span></span><i></i>
                                                </div>
                                            </div>
                                            <!-- 图片展示 -->

                                            <div node-type="btns-bar" class="clear-g wrap-action-gw">
                                                <div node-type="action-click-gw"
                                                     class="action-click-gw global-clear-spacing">
                                                    <i class="gap-gw"></i> <span node-type="report"
                                                                                 class="click-report-gw"><a
                                                        href="javascript:void(0)"><i
                                                        class="icon-gw icon-flag"></i><em>举报</em></a></span><i
                                                        class="gap-gw"></i><span
                                                        node-type="reply" class="click-reply-gw"><a
                                                        href="javascript:void(0)">回复</a></span> <i class="gap-gw"></i> <span
                                                        node-type="support" class="click-ding-gw"> <a
                                                        href="javascript:;"><i class="icon-gw icon-ding-bg"></i><em
                                                        class="icon-name-bg"></em></a>
												</span> <i class="gap-gw"></i><span node-type="prop"
                                                                                    class="click-prop-gw"><span
                                                        class="prop-span"><a
                                                        href="javascript:void(0)"></a></span></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 评论列表  E -->
                    <div class="module-cmt-footer">
                        <!-- 评论关闭 -->
                        <div class="list-comment-close-w">
                            <div class="close-wrap-w close-wrap-b">该评论已关闭!</div>
                        </div>
                        <!-- 翻页 -->
                        <div class="section-page-w">
                            <div node-type="cmt-more" class="cmt-more-wrap-gw">
                                查看更多<span class="more-arrow-ico"></span>
                            </div>
                        </div>


                    </div>
                    <div class="module-cmt-float-bar">
                        <div class="module-cmt-float-bar-body" style="bottom: 0;">
                            <div class="close-w">
                                <a node-type="close" href="javascript:void(0)">关闭</a>
                            </div>
                           <%-- <div class="float-bar-logo"></div>--%>
                            <div class="wrap-cont-w">
                                <!-- 评论 Begin -->
                                <div class="cont-minwidth-w">
                                    <div class="cont-form-w">
                                        <!-- 圆角 -->
                                        <div class="hidden-corner"></div>
                                        <!-- 圆角end -->
                                        <!-- 登录 Begin -->
                                        <div class="fb-login-wrap-w" style="display: none">
										<span node-type="fb-user-name" class="user-info"> <img
                                                src="">
										</span>
                                        </div>
                                        <div class="fb-logout-wrap-w" style="">
                                            <span node-type="float-bar-login" class="logout-img"></span>
                                        </div>
                                        <!-- 登录 end -->
                                        <div node-type="post-form" class="form-text-w">
                                            <a class="button-w" href="javascript:void(0)">按钮</a> <input
                                                type="text" value=""  class="text-w" data-default="">
                                            <span class="text-null">内容不能为空！</span>
                                        </div>
                                    </div>
                                    <div class="cont-comment-w">
                                        <span class="comment-text-w" style="display: none">立刻说两句吧！</span>
                                        <a class="comment-link-w" href="javascript:void(0)"
                                           style="display: block">查看<span class="comment-link-num"><span
                                                class="comment-link-numtext">971</span></span>条评论
                                        </a>
                                    </div>
                                </div>
                                <!-- 评论 End -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix information">
            <dl class="fl left">
                <dt class="clearfix"><a href="javascript:;" class="fl">相关资讯</a><a href="javascript:;" class="fr">更多></a>
                </dt>
                <dd class="clearfix"><a href="javascript:;" class="fl"><span>•</span>2017家装建材市场迎来新变革电商或成为行业主角</a><span
                        class="fr">[02-22]</span></dd>
                <dd class="clearfix"><a href="javascript:;" class="fl"><span>•</span>气动工具成为五金行业的中坚力量价气动工具成为气动</a><span
                        class="fr">[02-22]</span></dd>
                <dd class="clearfix"><a href="javascript:;" class="fl"><span>•</span>2017家装建材市场迎来新变革电商或成为行业主角</a><span
                        class="fr">[02-22]</span></dd>
                <dd class="clearfix"><a href="javascript:;" class="fl"><span>•</span>气动工具成为五金行业的中坚力量价气动工具成为气动</a><span
                        class="fr">[02-22]</span></dd>
            </dl>
            <dl class="fr">
                <dt class="clearfix"><a href="javascript:;" class="fl">最新资讯</a><a href="javascript:;" class="fr">更多></a>
                </dt>
                <dd class="clearfix"><a href="javascript:;" class="fl"><span>•</span>2017家装建材市场迎来新变革电商或成为行业主角</a><span
                        class="fr">[02-22]</span></dd>
                <dd class="clearfix"><a href="javascript:;" class="fl"><span>•</span>气动工具成为五金行业的中坚力量价气动工具成为气动</a><span
                        class="fr">[02-22]</span></dd>
                <dd class="clearfix"><a href="javascript:;" class="fl"><span>•</span>2017家装建材市场迎来新变革电商或成为行业主角</a><span
                        class="fr">[02-22]</span></dd>
                <dd class="clearfix"><a href="javascript:;" class="fl"><span>•</span>气动工具成为五金行业的中坚力量价气动工具成为气动</a><span
                        class="fr">[02-22]</span></dd>
            </dl>
        </div>
    </div>
    <!--/left-->

</div>
<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<script src="res/js/dialog/jquery.hDialog.min.js"></script>
<script type="text/javascript">
    $.goTop();
</script>
</body>

</html>
