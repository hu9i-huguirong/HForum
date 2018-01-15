<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/WEB-INF/jsp/common/common.jsp" %>
<link rel="stylesheet" href="res/css/layout.css">
<link rel="stylesheet" href="res/css/home.css">
<link type="text/css" rel="stylesheet" href="res/css/slides-playing/base.css">
<link type="text/css" rel="stylesheet" href="res/css/slides-playing/index.css">
 <link rel="stylesheet" href="res/admin/plugins/layui-v2.2.45/css/layui.css" media="all">
</head>
<body style="min-width: 1220px; overflow-x: hidden;">
<div class="y-wrap">
    <!-- 公共头部 position: fixed;-->
    <div id="header" style="position: fixed;z-index: 1000;">

    </div>
    <div id="toast">
    </div>
    <div class="y-box container" >
        <div class="y-left index-channel"  style="margin-top:50px;">
            <div  style="position: fixed;z-index: 1">
                <div class="wchannel" >
                </div>
            </div>
        </div>
        <div class="y-left index-content" style="margin-top: 50px;">
             <div id="J_carousel"  style="height: 300px; margin-bottom: 16px;" class="y-box carouselBox">
               <div class="fl column_center" style="display: block">
		<!--banner滚动-->
		<div class="focus" >
			<div class="news_pic">
				<ul>
					<li><a href="javascript:;" target="_blank"><img
							src="res/images/slides-playing/channel_img1.jpg"></a></li>
					<li><a href="javascript:;" target="_blank"><img
							src="res/images/slides-playing/channel_img2.jpg"></a></li>
					<li><a href="javascript:;" target="_blank"><img
							src="res/images/slides-playing/channel_img3.jpg"></a></li>
					<li><a href="javascript:;" target="_blank"><img
							src="res/images/slides-playing/channel_img4.png"></a></li>
				</ul>
			</div>
			<div class="ifocus_tx">
				<ul>
					<li><a href="javascript:;">追念国内高空挑战第一人</a></li>
					<li><a href="javascript:;">特朗普将承认耶路撒冷为以色列首都</a></li>
					<li><a href="javascript:;">2017年度体坛十大瞬间评选 ​ </a></li>
					<li><a href="javascript:;">国内五金行业或迎来新的春天</a></li>
				</ul>
			</div>
			<div class="tip">
				<ul>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="btn">
				<ul>
					<li class="prev" id="focus_btn_left"></li>
					<li class="next" id="focus_btn_right"></li>
				</ul>
			</div>
		</div>
		</div>           
            </div>
            <div>
                <div class="feedBox">
                    <div>
                        <div class="wcommonFeed">
                           </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="y-right index-modules" style="margin-top: 50px;">
            <div id="module-place">
            </div>
            <div class="module-inner" id="module-inner">
                <div riot-tag="wsearch" style="margin-bottom: 16px;">
                    <div name="searchBox" class="wsearch">
                        <form name="searchForm" action="" method="get" target="_blank">
                            <div name="inputbox" class="y-box input-group">
                                <input class="y-left input-text" name="keyword" autocomplete="off" ga_event="mh_search" type="text" placeholder="请输入关键字">
                                <div class="y-right btn-submit">
                                    <button type="submit" href="javascript:;"><i class="y-icon icon-search" ga_event="mh_search"></i></button>
                                </div>
                            </div>
                        </form>
                        <div class="layer" id="hot_search">
                            <ul ga_event="mh_search">
                                <li class="search-item"><a href="javascript:;"><i class="search-no search-no-1">1</i><span class="search-txt">死亡游戏潜入中国</span></a></li>
                                <li class="search-item"><a href="javascript:;"><i class="search-no search-no-2">2</i><span class="search-txt">孙燕姿晒结婚照</span></a></li>
                                <li class="search-item"><a href="javascript:;"><i class="search-no search-no-3">3</i><span class="search-txt">于月仙三姐妹合影</span></a></li>
                                <li class="search-item"><a href="javascript:;"><i class="search-no search-no-4">4</i><span class="search-txt">男子暴打女服务员</span></a></li>
                                <li class="search-item"><a href="javascript:;"><i class="search-no search-no-5">5</i><span class="search-txt">婴儿手握避孕环出生</span></a></li>
                                <li class="search-item"><a href="javascript:;"><i class="search-no search-no-6">6</i><span class="search-txt">广州捣毁假烟工厂</span></a></li>
                                <li class="search-item"><a href="javascript:;"><i class="search-no search-no-7">7</i><span class="search-txt">白百何穿拖鞋亮相</span></a></li>
                                <li class="search-item"><a href="javascript:;"><i class="search-no search-no-8">8</i><span class="search-txt">波音737告别中国</span></a></li>
                                <li class="search-item"><a href="javascript:;"><i class="search-no search-no-9">9</i><span class="search-txt">曹云金上节目爆料</span></a></li>
                                <li class="search-item"><a href="javascript:;"><i class="search-no search-no-10">10</i><span class="search-txt">男子街头卖妻救女</span></a></li>
                                <!--riot placeholder-->
                            </ul>
                        </div>
                    </div>
                </div>   
              
             <div style="height: 366px; overflow:hidden;">
                  <div id="m-hotNews">
                        <div riot-tag="hotNews" class="hotNews module" ga_event="click_hot_news">
                            <div class="module-head news-head">
                                实时热点
                            </div>
                            <ul class="news-content">
                                <li class="news-list"><a target="_blank" class="news-link" href="http://www.toutiao.com/group/6417977896175419650/">
                                <div class="module-pic news-pic">
                                    <img src="images/1f8400036de2eedb4b32">
                                </div>
                                <div class="news-inner">
                                    <p class="module-title">
                                        山东威海交通事故死亡人数增至12人
                                    </p>
                                </div>
                                </a></li>
                                <li class="news-list"><a target="_blank" class="news-link" href="http://www.toutiao.com/group/6418092409703367169/">
                                <div class="module-pic news-pic">
                                    <img src="images/1e24000070216836e6d1">
                                </div>
                                <div class="news-inner">
                                    <p class="module-title">
                                        国防部证实火箭军渤海试射导弹：达到预期效果
                                    </p>
                                </div>
                                </a></li>
                                <li class="news-list"><a target="_blank" class="news-link" href="http://www.toutiao.com/group/6417731641770246657/">
                                <div class="module-pic news-pic">
                                    <img src="images/1f88000184786b83db3c">
                                </div>
                                <div class="news-inner">
                                    <p class="module-title">
                                        锤子科技 2017 春季新品发布会
                                    </p>
                                </div>
                                </a></li>
                                <li class="news-list"><a target="_blank" class="news-link" href="http://www.toutiao.com/group/6418108081897652481/">
                                <div class="module-pic news-pic">
                                    <img src="images/1e26000096fb534bc03a">
                                </div>
                                <div class="news-inner">
                                    <p class="module-title">
                                        韩红方发声明斥责网络谣言 否认赴美国注册结婚
                                    </p>
                                </div>
                                </a></li>
                               <!--  riot placeholder -->
                            </ul>
                        </div>
                        <div id="imagindexhover" class="imagindexhover" ad-cursor="" name="home_right*bottom_1_zy" ad_name="h_300*250_zy_7" done="1" style="display: none;" show="">
                            <div class="pic-wrap">
                                <a class="wrap" href="http://www.lj299.com/kaihu/xhsh/?toutiao" target="_blank">
                                <img src="images/1aa3001dcaf3c30b4732" alt="">
                                </a>
                                <a class="wrap" href="http://www.lj299.com/kaihu/xhsh/?toutiao" target="_blank">
                                <h4>黄金白银，2017无悔的投资选择！</h4>
                                </a>
                                <div class="y-box">
                                    <a href="http://www.lj299.com/kaihu/xhsh/?toutiao" target="_blank" class="source">鹿佳贵金属</a>
                                    <a href="http://www.lj299.com/kaihu/xhsh/?toutiao" target="_blank" class="comment">⋅&nbsp;0评论</a>
                                    <a href="http://www.lj299.com/kaihu/xhsh/?toutiao" target="_blank" class="label">&nbsp;&nbsp;广告</a>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
                <div riot-tag="adTab">
                </div>
                <div riot-tag="whotvideo" class="whotvideo module" ga_event="click_video_recommend">
                    <div class="module-head video-head">
                        <a href="http://www.toutiao.com/video/" target="_blank">热门视频</a>
                    </div>
                    <ul class="video-list">
                        <li class="video-item"><a target="_blank" href="http://www.toutiao.com/group/6397545526313566466/">
                        <dl>
                            <dt class="module-pic"><img alt="" src="images/192b000aa043c4ec87e6"><i class="hot-tag video-tag"><span>03:28</span></i></dt>
                            <dd>
                            <div class="cell">
                                <h4>社会实验 三小伙街头轮番重现同一场景，使路人产生幻觉记忆</h4>
                                <p>
                                    <span>18.0万次播放&nbsp;</span><span>⋅&nbsp;213评论</span>
                                </p>
                            </div>
                            </dd>
                        </dl>
                        </a></li>
                        <li class="video-item"><a target="_blank" href="http://www.toutiao.com/group/6403587301171003905/">
                        <dl>
                            <dt class="module-pic"><img alt="" src="images/1a9800002ffbe7216344"><i class="hot-tag video-tag"><span>01:58</span></i></dt>
                            <dd>
                            <div class="cell">
                                <h4>常出现在高级餐厅的菜单上，谁都想不到制作过程如此简单成本还低</h4>
                                <p>
                                    <span>28.7万次播放&nbsp;</span><span>⋅&nbsp;2662评论</span>
                                </p>
                            </div>
                            </dd>
                        </dl>
                        </a></li>
                        <li class="video-item"><a target="_blank" href="http://www.toutiao.com/group/6399433492458995969/">
                        <dl>
                            <dt class="module-pic"><img alt="" src="images/19c10004b5ad3116ca80"><i class="hot-tag video-tag"><span>01:15</span></i></dt>
                            <dd>
                            <div class="cell">
                                <h4>超便宜的童话度假小木屋，一万多块一个还可以做成树屋放农场很好</h4>
                                <p>
                                    <span>4182次播放&nbsp;</span><span>⋅&nbsp;8评论</span>
                                </p>
                            </div>
                            </dd>
                        </dl>
                        </a></li>
                        <li class="video-item"><a target="_blank" href="http://www.toutiao.com/group/6392682083857744130/">
                        <dl>
                            <dt class="module-pic"><img alt="" src="images/18510006022dc4ba7f30"><i class="hot-tag video-tag"><span>02:05</span></i></dt>
                            <dd>
                            <div class="cell">
                                <h4>这是何等的天籁嗓音全，特别是最后一个飞吻让全场都沸腾起立欢呼</h4>
                                <p>
                                    <span>9.8万次播放&nbsp;</span><span>⋅&nbsp;194评论</span>
                                </p>
                            </div>
                            </dd>
                        </dl>
                        </a></li>
                        <li class="video-item"><a target="_blank" href="http://www.toutiao.com/group/6417637314482143745/">
                        <dl>
                            <dt class="module-pic"><img alt="" src="images/1f0500012629ef5cd605"><i class="hot-tag video-tag"><span>02:55</span></i></dt>
                            <dd>
                            <div class="cell">
                                <h4>这就是孩子为什么需要爸爸，尤其是女儿！</h4>
                                <p>
                                    <span>7.1万次播放&nbsp;</span><span>⋅&nbsp;173评论</span>
                                </p>
                            </div>
                            </dd>
                        </dl>
                        </a></li>
                        <li class="video-item"><a target="_blank" href="http://www.toutiao.com/group/6416972354919858690/">
                        <dl>
                            <dt class="module-pic"><img alt="" src="images/1dc600012149cc60c4e5"><i class="hot-tag video-tag"><span>03:54</span></i></dt>
                            <dd>
                            <div class="cell">
                                <h4>在大街上告诉路人自己是处，他们的反应太逗比了！</h4>
                                <p>
                                    <span>6343次播放&nbsp;</span><span>⋅&nbsp;38评论</span>
                                </p>
                            </div>
                            </dd>
                        </dl>
                        </a></li>
                        <!--riot placeholder-->
                    </ul>
                </div>
                <div riot-tag="whotpicture" class="whotpicture module" ga_event="click_pictures_recommend">
                    <div class="module-head picture-head">
                        <a href="http://www.toutiao.com/news_image/" target="_blank">精彩图片</a>
                    </div>
                    <ul class="y-box picture-list">
                        <li class="y-left picture-item"><a target="_blank" href="http://www.toutiao.com/group/6414945230428619010/">
                        <div class="module-pic picture-img">
                            <img alt="" src="images/1dcc0008754bd2ad0278"><i class="hot-tag"><span>9图</span></i>
                        </div>
                        <p>
                            美女请留步！美女推荐系列第1期台湾-曾玄玄 Sena
                        </p>
                        </a></li>
                        <li class="y-left picture-item"><a target="_blank" href="http://www.toutiao.com/group/6398879298539094273/">
                        <div class="module-pic picture-img">
                            <img alt="" src="images/18a1000cb5cdd232bf56"><i class="hot-tag"><span>11图</span></i>
                        </div>
                        <p>
                            高挑的旗袍美女
                        </p>
                        </a></li>
                        <li class="y-left picture-item"><a target="_blank" href="http://www.toutiao.com/group/6400167272862777601/">
                        <div class="module-pic picture-img">
                            <img alt="" src="images/18a4000e07204887cf8c"><i class="hot-tag"><span>10图</span></i>
                        </div>
                        <p>
                            俄罗斯生态摄影，怎么拍出了会跳舞的熊？
                        </p>
                        </a></li>
                        <li class="y-left picture-item"><a target="_blank" href="http://www.toutiao.com/group/6413267133846176001/">
                        <div class="module-pic picture-img">
                            <img alt="" src="images/1db90003249e4d363240"><i class="hot-tag"><span>12图</span></i>
                        </div>
                        <p>
                            百家企业强强联手进驻河南某高校，展开一场盛大的招聘会
                        </p>
                        </a></li>
                        <li class="y-left picture-item"><a target="_blank" href="http://www.toutiao.com/group/6391418301360406786/">
                        <div class="module-pic picture-img">
                            <img alt="" src="images/17ef000210145704aa6c"><i class="hot-tag"><span>8图</span></i>
                        </div>
                        <p>
                            8种创意无限的水果拼盘，收藏起来慢慢学
                        </p>
                        </a></li>
                        <li class="y-left picture-item"><a target="_blank" href="http://www.toutiao.com/group/6387858409861005569/">
                        <div class="module-pic picture-img">
                            <img alt="" src="images/16ab0008f2be83fabb9c"><i class="hot-tag"><span>7图</span></i>
                        </div>
                        <p>
                            小鲫鱼长得越来越像安吉哥哥了，连神态都是那么相似
                        </p>
                        </a></li>
                        <!--riot placeholder-->
                    </ul>
                </div>
                <div class="friendLink module" ga_event="click_friend_link">
                    <div class="module-head link-head">
                        友情链接
                    </div>
                    <div class="link-content" id="friendLink">
                        <ul>
                            <li class="item"><a target="_blank" href="http://www.gmw.cn/">光明网</a></li>
                            <li class="item"><a target="_blank" href="http://www.cnr.cn/">央广网</a></li>
                            <li class="item"><a target="_blank" href="http://www.cri.cn/">国际在线</a></li>
                            <li class="item"><a target="_blank" href="http://www.huanqiu.com/">环球网</a></li>
                            <li class="item"><a target="_blank" href="http://www.cyol.com/">中青在线</a></li>
                            <li class="item"><a target="_blank" href="http://www.haiwainet.cn/">海外网</a></li>
                            <li class="item"><a target="_blank" href="http://h5.china.com.cn/">中国网</a></li>
                            <li class="item"><a target="_blank" href="http://www.bjnews.com.cn/">新京报</a></li>
                            <li class="item"><a target="_blank" href="http://www.fawan.com/">法制晚报</a></li>
                            <li class="item"><a target="_blank" href="http://www.morningpost.com.cn/">北京晨报</a></li>
                            <li class="item"><a target="_blank" href="http://www.xinmin.cn/">新民网</a></li>
                            <li class="item"><a target="_blank" href="http://www.hinews.cn/news/">南海网</a></li>
                            <li class="item"><a target="_blank" href="http://www.hxnews.com/">海峡网</a></li>
                            <li class="item"><a target="_blank" href="http://www.voc.com.cn/">华声在线</a></li>
                            <li class="item"><a target="_blank" href="http://www.autohome.com.cn/">汽车之家</a></li>
                            <li class="item"><a target="_blank" href="http://123.chinaso.com/">中国搜索</a></li>
                            <li class="item"><a target="_blank" href="http://www.nbd.com.cn/">每日经济新闻</a></li>
                            <li class="item"><a target="_blank" href="http://www.enorth.com.cn/">北方网</a></li>
                        </ul>
                    </div>
                </div>
                <div class="company">
                    <p class="J-company-name">
                         © 2018 HForum
                    </p>
                    <a href="http://www.12377.cn/" target="_blank" ga_event="click_about">中国互联网举报中心 </a>
                    <a href="http://www.miibeian.gov.cn/" target="_blank" ga_event="click_about">京ICP证123456号 </a>
                    <div class="">
                        <a href="http://www.miibeian.gov.cn/" target="_blank" ga_event="click_about">京ICP备123456789号-9
                        </a>
                        <a href="javascript:;" class="icp">网络文化经营许可证</a>
                    </div>
                    <p>
                        京-非经营性-2018-0081
                    </p>
                    <span>违法和不良信息举报：010-010</span>
                    <a href="javascript:;" target="_blank" >京公网安备 123456789号</a>
                </div>
            </div>
        </div>
    </div>
    <div class="action-feedback">
        <div riot-tag="feedback" class="feedback">
            <ul>
                <li class="tool-item refreshfeed" title="刷新" ><a href="javascript:;"><i class="y-icon icon-refreshfeed"></i></a></li>
                <li class="tool-item go-top" title="回到顶部" style="display: none;"><a href="javascript:;"><i class="y-icon icon-backtotopfeed"></i></a></li>
            </ul>
        </div>
    </div>
    <div riot-tag="articleLayerBox">
    </div>
    <div riot-tag="promotion-ext" id="promotion-ext">
    </div>
</div>
<%--<div id="HBox"></div>--%>
<div id="allmap"></div>
<script src="res/admin/plugins/layui-v2.2.45/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use(['form'], function() {
        window.form = layui.form;
    });
</script>
<script src="res/js/dialog/jquery.hDialog.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=YOQ09qHZyofYDfxiFGpPbGcazubpf2ct"></script>
<script src="res/data/citys.js" charset="utf-8"></script>
<script type="text/javascript" src="res/js/head.js"></script>
<script type="text/javascript" src="res/js/home.js"></script>

</body>
</html>
