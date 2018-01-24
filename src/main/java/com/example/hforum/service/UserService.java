package com.example.hforum.service;

import com.example.hforum.model.User;
import com.example.hforum.utils.PageBean;

import java.util.List;

public interface UserService {
	public void add(User user);

	public User loadSelective(User user);

	public User selectByPrimaryKey(Long userId);

	public List<User> list(User user,PageBean pageBean);

	User selectByEmail(User record);

	int updateByPrimaryKeySelective(User record);

	User selectByActivateKey(User record);
}
