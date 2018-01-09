package com.example.hforum.service;

import com.example.hforum.model.Channel;
import com.example.hforum.utils.PageBean;

import java.util.List;

public interface ChannelService {

    public int add(Channel channel);

    public List<Channel> list(Channel channel, PageBean pageBean);

    public int edit(Channel record);

    int selectMaxPostion(Channel channel);

    List<Channel> selectBackChannel(Channel record);

    List<Channel> selectByNewsId(Long newsId);
}
