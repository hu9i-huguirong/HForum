package com.example.hforum.service.impl;

import com.example.hforum.mapper.UserMapper;
import com.example.hforum.model.User;
import com.example.hforum.service.UserService;
import com.example.hforum.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public void add(User user) {
        userMapper.insertSelective(user);
    }

    @Override
    public User login(User user) {
        return userMapper.loadSelective(user);
    }

    @Override
    public User selectByPrimaryKey(Long userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public List<User> list(User user, PageBean pageBean) {
        List<User> list = userMapper.list(user);
        return list;
    }

}
