package com.example.hforum.controller;

import com.example.hforum.model.Channel;
import com.example.hforum.service.ChannelService;
import com.example.hforum.utils.PageBean;
import com.example.hforum.utils.ResponseDataFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@RequestMapping("/channel")
@Controller
public class ChannelController {
    @Autowired
    private ChannelService channelService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void add(@RequestBody Channel channel,HttpServletResponse response) throws IOException {
        int i = channelService.add(channel);
        System.out.println(channel);
        PrintWriter out = response.getWriter();
        out.print(i);
        out.flush();
        out.close();
    }


    @RequestMapping(value = "/list")
    @ResponseBody
    public Map<String, Object> list(Integer page, Integer limit, Boolean paginate, Channel channel) {

        PageBean pageBean = ResponseDataFactory.createPageBean(page, limit, paginate);

        List<Channel> list = channelService.list(channel, pageBean);

        return ResponseDataFactory.buildResponseDataMap(pageBean, list);
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public void edit(Channel channel, HttpServletResponse response) throws IOException {
        channelService.edit(channel);
        //这句话的意思，是让浏览器用utf8来解析返回的数据
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        //这句话的意思，是告诉servlet用UTF-8转码，而不是用默认的ISO8859
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(0);
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/updatePostions")
    public void updatePostions(@RequestBody List<Channel> channels, HttpServletResponse response) throws IOException {
        for (Channel c :
                channels) {
            channelService.edit(c);
        }
        PrintWriter out = response.getWriter();
        out.print(0);
        out.flush();
        out.close();
    }
}
