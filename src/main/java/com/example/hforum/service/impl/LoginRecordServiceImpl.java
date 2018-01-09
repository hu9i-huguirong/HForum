package com.example.hforum.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.hforum.mapper.LoginRecordMapper;
import com.example.hforum.model.LoginRecord;
import com.example.hforum.service.LoginRecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class LoginRecordServiceImpl implements LoginRecordService {
    @Autowired
    private LoginRecordMapper loginRecordMapper;

    @Override
    public int add(LoginRecord loginRecord) {
        int i = loginRecordMapper.insert(loginRecord);

        return i;
    }

    @Override
    public LoginRecord selectLsatRecordByUserId(Long loginUserId) {
        LoginRecord loginRecord  = loginRecordMapper.selectLastRecord(loginUserId);
        //登录次数
        loginRecord.setLoginCount(loginRecordMapper.selectLoginCount(loginRecord));
        return loginRecord;
    }


}
