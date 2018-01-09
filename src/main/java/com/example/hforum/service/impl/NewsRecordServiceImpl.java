package com.example.hforum.service.impl;

import com.example.hforum.mapper.NewsRecordMapper;
import com.example.hforum.model.NewsRecord;
import com.example.hforum.service.NewsRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsRecordServiceImpl implements NewsRecordService {
    @Autowired
    private NewsRecordMapper newsRecordMapper;
    @Override
    public NewsRecord selectByNewsId(Long newsId) {
        return newsRecordMapper.selectByNewsId(newsId);
    }

    @Override
    public int updateByPrimaryKeySelective(NewsRecord record) {
        return newsRecordMapper.updateByPrimaryKeySelective(record);
    }
}
