package com.example.hforum.service.impl;

import com.example.hforum.mapper.ChannelMapper;
import com.example.hforum.model.Channel;
import com.example.hforum.service.ChannelService;
import com.example.hforum.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class ChannelServiceImpl implements ChannelService {
    @Autowired
    private ChannelMapper channelMapper;

    @Override
    public int add(Channel channel) {
        Channel c = channelMapper.selectByChannelName(channel.getChannelName());
        if (c != null){
            return 2;
        }else {
            int i = selectMaxPostion(channel);
            channel.setPosition(i + 1);
            return channelMapper.insert(channel);
        }
    }

    @Override
    public List<Channel> list(Channel channel, PageBean pageBean) {
        List<Channel> list = channelMapper.list(channel);
        return list;
    }

    @Override
    public int edit(Channel record) {
        Boolean selected = record.getSelected();
        if (selected != null) {
            //更新选中状态
            record.setSelected(!selected);
            List<Channel> channels = selectBackChannel(record);
            if (channels.size() > 0) {  //先更新排在它后面的栏目
                for (Channel c : channels
                        ) {
                    //往前移一位
                    c.setPosition(c.getPosition() - 1);
                    channelMapper.updateByPrimaryKeySelective(c);
                }
            }
            record.setSelected(selected);
            int i = selectMaxPostion(record);
            record.setPosition(i + 1);

        }
        return channelMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int selectMaxPostion(Channel channel) {
        return channelMapper.selectMaxPostion(channel);
    }

    @Override
    public List<Channel> selectBackChannel(Channel record) {
        return channelMapper.selectBackChannel(record);
    }

    @Override
    public List<Channel> selectByNewsId(Long newsId) {
        return channelMapper.selectByNewsId(newsId);
    }
}
