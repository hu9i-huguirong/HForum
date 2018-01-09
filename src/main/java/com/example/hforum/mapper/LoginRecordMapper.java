package com.example.hforum.mapper;

import com.example.hforum.model.LoginRecord;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginRecordMapper {
    int deleteByPrimaryKey(Long loginRecordId);

    int insert(LoginRecord record);

    int insertSelective(LoginRecord record);

    LoginRecord selectByPrimaryKey(Long loginRecordId);

    int updateByPrimaryKeySelective(LoginRecord record);

    int updateByPrimaryKey(LoginRecord record);

    LoginRecord selectLastRecord(Long loginUserId);

    Long selectLoginCount(LoginRecord record);
}