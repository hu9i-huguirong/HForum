package com.example.hforum.mapper;

import com.example.hforum.model.NewsRecord;
import org.springframework.stereotype.Repository;

@Repository
public interface NewsRecordMapper {
    int deleteByPrimaryKey(Long newsRecordId);

    int insert(NewsRecord record);

    int insertSelective(NewsRecord record);

    NewsRecord selectByPrimaryKey(Long newsRecordId);

    int updateByPrimaryKeySelective(NewsRecord record);

    int updateByPrimaryKey(NewsRecord record);

    NewsRecord selectByNewsId(Long newsId);
}