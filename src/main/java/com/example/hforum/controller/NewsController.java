package com.example.hforum.controller;

import com.example.hforum.model.*;
import com.example.hforum.po.BridgePo;
import com.example.hforum.po.NewsVo;
import com.example.hforum.service.*;
import com.example.hforum.utils.PageBean;
import com.example.hforum.utils.ResponseDataFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RequestMapping("/news")
@Controller
public class NewsController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private ChannelService channelService;
    @Autowired
    private NewsRecordService newsRecordService;
    @Autowired
    private ImageService imageService;
    @Autowired
    private UserService userService;


    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void add(@RequestBody NewsVo newsVo, HttpServletResponse response) throws IOException {

        int i = newsService.add(newsVo);
        PrintWriter out = response.getWriter();
        out.print(i);
        out.flush();
        out.close();
    }


    @RequestMapping(value = "/list")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit, Boolean paginate, NewsVo newsVo, HttpServletResponse response) {

        PageBean pageBean = ResponseDataFactory.createPageBean(page, limit, paginate);
        Subject currentUser = SecurityUtils.getSubject();
        if (newsVo.getFront()) {
            //查询所有已发布的新闻
            newsVo.setUserId(null);
            newsVo.setAduitResult(3);
        }else if (currentUser.hasRole("admin")) {
            //查询所有新闻
            newsVo.setUserId(null);
        } else if (currentUser.hasRole("audit")) {
            //查询所有待审核的新闻
            newsVo.setUserId(null);
            newsVo.setAduitResult(1);
        }
        //否则查询自己编辑的新闻
        List<News> newsList = newsService.list(newsVo, pageBean);
        List<NewsVo> newsVoList = new ArrayList<>();

        NewsVo nv = null;
        if (newsList != null) {
            for (News n :
                    newsList) {
                nv = new NewsVo();

                Long newsId = n.getNewsId();
                nv.setNews(n);

                List<Channel> channels = channelService.selectByNewsId(newsId);
                nv.setChannels(channels);

                NewsRecord newsRecord = newsRecordService.selectByNewsId(newsId);
                nv.setNewsRecord(newsRecord);
                List<Image> images = imageService.selectByNewsId(newsId);
                nv.setImages(images);

                newsVoList.add(nv);
            }
        }

        return ResponseDataFactory.buildResponseDataMap(pageBean, newsVoList);
    }


    @RequestMapping(value = "/{page}/{newsId}")
    public String load(@PathVariable String page, @PathVariable Long newsId, HttpServletResponse response, Model model) {
        NewsVo newsVo = newsService.load(newsId);
        if ("editNews".equals(page)) {
            model.addAttribute("editNewsVo", newsVo);
            return "back/manage/news/edit-news";
        }
        //获取新闻创建人姓名
        User user = userService.selectByPrimaryKey(newsVo.getNews().getCreateUserId());
        newsVo.setUserName(user.getUserName());
         if("viewNews".equals(page)){
             model.addAttribute("viewNewsVo", newsVo);
            return "back/manage/news/view-news";
        }
           else {
             model.addAttribute("detailNewsVo", newsVo);
            return "front/news-detail";
        }
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public void edit(@RequestBody NewsVo newsVo, HttpServletResponse response) throws IOException {
        News news = newsVo.getNews();
        newsService.updateByPrimaryKeySelective(news);
        int result = 1;
        NewsRecord newsRecord = newsVo.getNewsRecord();
        if (newsRecord.getAduitResult() == 1) {
            //送审
            newsRecord.setForReviewTime(new Date());
            result = 2;
        }
        newsRecordService.updateByPrimaryKeySelective(newsRecord);
        //更新桥接表
        newsService.deleteNewsChannelByNewsId(news.getNewsId());
        List<Channel> channels = newsVo.getChannels();
        if (channels != null && channels.size() > 0) {
            for (Channel channel : channels
                    ) {
                newsService.insertNewsChannel(new BridgePo(news.getNewsId(), channel.getChannelId()));
            }
        }
        PrintWriter out = response.getWriter();
        out.print(result);
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/release", method = RequestMethod.POST)
    public void release(Long releaseMs, Long soldoutMs, Long userId, Long newsId, HttpServletResponse response) throws IOException {

        PrintWriter out = response.getWriter();
        Long serverTime = new Date().getTime();
        if (releaseMs < serverTime) {
            out.print(2);
            out.flush();
            out.close();
            return;
        }

        //发布新闻
        News news = new News();
        news.setNewsId(newsId);
        news.setReleaseTime(new Date(releaseMs));
        newsService.updateByPrimaryKeySelective(news);

        NewsRecord newsRecord = newsRecordService.selectByNewsId(newsId);
        newsRecord.setAduitResult(2);
        newsRecord.setAduitUserId(userId);
        newsRecord.setSoldoutTime(new Date(soldoutMs));
        newsRecord.setSoldoutUserId(userId);
        newsRecordService.updateByPrimaryKeySelective(newsRecord);


        out.print(1);
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/getNewsStauts", method = RequestMethod.POST)
    public void getNewsStauts(Long newsId, HttpServletResponse response) throws IOException {
        NewsRecord newsRecord = newsRecordService.selectByNewsId(newsId);
        PrintWriter out = response.getWriter();
        out.print(newsRecord.getAduitResult());
        out.flush();
        out.close();
    }

}
