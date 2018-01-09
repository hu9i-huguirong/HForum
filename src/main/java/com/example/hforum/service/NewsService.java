package com.example.hforum.service;

import com.example.hforum.model.News;
import com.example.hforum.po.BridgePo;
import com.example.hforum.po.NewsVo;
import com.example.hforum.utils.PageBean;

import java.util.List;

public interface NewsService {

    public int add(NewsVo newsVo);

    public List<News> list(NewsVo newsVo, PageBean pageBean);

    public NewsVo load(Long newsId);

    int updateByPrimaryKeySelective(News record);

    int deleteNewsChannelByNewsId(Long newsId);

    void insertNewsChannel(BridgePo bridgePo);
}
