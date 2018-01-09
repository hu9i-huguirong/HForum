package com.example.hforum.service;

import com.example.hforum.model.NewsRecord;

public interface NewsRecordService {
    NewsRecord selectByNewsId(Long newsId);

    int updateByPrimaryKeySelective(NewsRecord record);
}
