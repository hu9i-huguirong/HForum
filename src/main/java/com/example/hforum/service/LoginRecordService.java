package com.example.hforum.service;

import com.example.hforum.model.LoginRecord;

public interface LoginRecordService {
	public int add(LoginRecord loginRecord);

	public LoginRecord selectLsatRecordByUserId(Long userId);

}
