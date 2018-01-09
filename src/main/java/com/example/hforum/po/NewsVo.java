package com.example.hforum.po;

import com.example.hforum.model.Channel;
import com.example.hforum.model.Image;
import com.example.hforum.model.News;
import com.example.hforum.model.NewsRecord;

import java.io.Serializable;
import java.util.List;

public class NewsVo implements Serializable{

    private News news;

    private NewsRecord newsRecord;

    private List<Image> images;

    private  List<Channel> channels;

    //模糊查询条件
    private  Integer channelId;
    private  String newsTitle;
    private  Integer aduitResult;
    private  Integer userId;
    private  String userName;
    //前台
    private Boolean front = false;

    public Boolean getFront() {
        return front;
    }

    public void setFront(Boolean front) {
        this.front = front;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getAduitResult() {
        return aduitResult;
    }

    public void setAduitResult(Integer aduitResult) {
        this.aduitResult = aduitResult;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public NewsRecord getNewsRecord() {
        return newsRecord;
    }

    public void setNewsRecord(NewsRecord newsRecord) {
        this.newsRecord = newsRecord;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public List<Channel> getChannels() {
        return channels;
    }

    public void setChannels(List<Channel> channels) {
        this.channels = channels;
    }

    @Override
    public String toString() {
        return "NewsVo{" +
                "news=" + news +
                ", newsRecord=" + newsRecord +
                ", images=" + images +
                ", channels=" + channels +
                '}';
    }
}
