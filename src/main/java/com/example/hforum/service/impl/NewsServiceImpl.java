package com.example.hforum.service.impl;

import com.example.hforum.mapper.ImageMapper;
import com.example.hforum.mapper.NewsMapper;
import com.example.hforum.mapper.NewsRecordMapper;
import com.example.hforum.model.Channel;
import com.example.hforum.model.Image;
import com.example.hforum.model.News;
import com.example.hforum.model.NewsRecord;
import com.example.hforum.po.BridgePo;
import com.example.hforum.po.NewsVo;
import com.example.hforum.service.NewsService;
import com.example.hforum.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Transactional
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsMapper newsMapper;

    @Autowired
    private NewsRecordMapper newsRecordMapper;
    @Autowired
    private ImageMapper imageMapper;

    @Override
    public int add(NewsVo newsVo) {
        News news = newsVo.getNews();
        news.setCreateTime(new Date());

        //新闻
        int i = newsMapper.insertSelective(news);
        //新闻记录
        NewsRecord newsRecord = newsVo.getNewsRecord();
        newsRecord.setNewsId(news.getNewsId());
        if (newsRecord.getAduitResult() == 1){
            //直接送审
            newsRecord.setForReviewTime(new Date());
        }
            newsRecordMapper.insertSelective(newsRecord);

        //关联新闻封面
        List<Image> images = newsVo.getImages();

        if (images != null && images.size() > 0) {
            for (Image im :
                    images) {
                Long imageId = im.getImageId();
                if (imageId != null) {
                    Image image = imageMapper.selectByPrimaryKey(Long.parseLong(imageId + ""));
                    image.setImageNewsId(news.getNewsId());
                    imageMapper.updateByPrimaryKey(image);
                }
            }
        }
        //关联新闻类别
        for (Channel channel : newsVo.getChannels()
                ) {
            insertNewsChannel(new BridgePo(news.getNewsId(), channel.getChannelId()));
        }
        return i;
    }


    @Override
    public List<News> list(NewsVo newsVo, PageBean pageBean) {
        List<News> list = newsMapper.list(newsVo);
        return list;
    }

    @Override
    public NewsVo load(Long newsId) {
        return newsMapper.load(newsId);
    }

    @Override
    public int updateByPrimaryKeySelective(News record) {
        return newsMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int deleteNewsChannelByNewsId(Long newsId) {
        return newsMapper.deleteNewsChannelByNewsId(newsId);
    }

    @Override
    public void insertNewsChannel(BridgePo bridgePo) {
        newsMapper.insertNewsChannel(bridgePo);
    }

}
