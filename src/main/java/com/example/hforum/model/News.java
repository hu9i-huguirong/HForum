package com.example.hforum.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class News {
    private Long newsId;

    private String newsTitle;

    private String newsFrom;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;

    private Long createUserId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date releaseTime;

    private Integer newsThumb;

    private Boolean allowComment;

    private Boolean newsDelete;

    private String newsContent;

    public Long getNewsId() {
        return newsId;
    }

    public void setNewsId(Long newsId) {
        this.newsId = newsId;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle == null ? null : newsTitle.trim();
    }

    public String getNewsFrom() {
        return newsFrom;
    }

    public void setNewsFrom(String newsFrom) {
        this.newsFrom = newsFrom == null ? null : newsFrom.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Long createUserId) {
        this.createUserId = createUserId;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    public Integer getNewsThumb() {
        return newsThumb;
    }

    public void setNewsThumb(Integer newsThumb) {
        this.newsThumb = newsThumb;
    }

    public Boolean getAllowComment() {
        return allowComment;
    }

    public void setAllowComment(Boolean allowComment) {
        this.allowComment = allowComment;
    }

    public Boolean getNewsDelete() {
        return newsDelete;
    }

    public void setNewsDelete(Boolean newsDelete) {
        this.newsDelete = newsDelete;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent == null ? null : newsContent.trim();
    }

    @Override
    public String toString() {
        return "News{" +
                "newsId=" + newsId +
                ", newsTitle='" + newsTitle + '\'' +
                ", newsFrom='" + newsFrom + '\'' +
                ", createTime=" + createTime +
                ", createUserId=" + createUserId +
                ", releaseTime=" + releaseTime +
                ", newsThumb=" + newsThumb +
                ", allowComment=" + allowComment +
                ", newsDelete=" + newsDelete +
                ", newsContent='" + newsContent + '\'' +
                '}';
    }
}