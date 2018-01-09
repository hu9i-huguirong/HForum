package com.example.hforum.service.impl;

import com.example.hforum.model.Channel;
import com.example.hforum.service.ChannelService;
import com.example.hforum.utils.PageBean;
import com.example.hforum.utils.ResponseDataFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext-dao.xml"})
public class ChannelServiceImplTest {
    @Autowired
    private ChannelService channelService;
    private Channel channel;
    @Before
    public void setUp() throws Exception {
        channel =new Channel();
    }

    @Test
    public void list() {
       // channel.setChannelName("点");
        channel.setSelected(true);
        PageBean pageBean = ResponseDataFactory.createPageBean(0, 0,false);
        List<Channel> list = channelService.list(channel, pageBean);
        for (Channel c:list
             ) {
            System.out.println(c);
        }
    }

    @Test
    public void selectMaxPostion() {
        channel.setSelected(false);
        System.out.println(channelService.selectMaxPostion(channel));
    }
    @Test
    public void selectBackChannel() {
        channel.setSelected(true);
        channel.setChannelId(11);
        List<Channel> channels = channelService.selectBackChannel(channel);
        System.out.println(channels.size());
//        for (Channel c:channels
//                ) {
//            System.out.println(c);
//        }
        //return channelService.selectBackChannel(record);
    }

    @Test
    public void edit() {
       // channelPo.setSelected(false);
        channel.setCity(false);
        channel.setChannelId(5);
        channelService.edit(channel);
    }
}