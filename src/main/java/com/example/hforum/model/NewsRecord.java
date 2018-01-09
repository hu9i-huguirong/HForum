package com.example.hforum.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

public class NewsRecord implements Serializable {
    private Long newsRecordId;

    private Long newsId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date forReviewTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date soldoutTime;

    private Long soldoutUserId;

    private String aduitFailureCause;

    private Long aduitUserId;

    private Integer aduitNewsVersion;

    private Integer aduitResult;

    public Long getNewsRecordId() {
        return newsRecordId;
    }

    public void setNewsRecordId(Long newsRecordId) {
        this.newsRecordId = newsRecordId;
    }

    public Long getNewsId() {
        return newsId;
    }

    public void setNewsId(Long newsId) {
        this.newsId = newsId;
    }

    public Date getForReviewTime() {
        return forReviewTime;
    }

    public void setForReviewTime(Date forReviewTime) {
        this.forReviewTime = forReviewTime;
    }

    public Date getSoldoutTime() {
        return soldoutTime;
    }

    public void setSoldoutTime(Date soldoutTime) {
        this.soldoutTime = soldoutTime;
    }

    public Long getSoldoutUserId() {
        return soldoutUserId;
    }

    public void setSoldoutUserId(Long soldoutUserId) {
        this.soldoutUserId = soldoutUserId;
    }

    public String getAduitFailureCause() {
        return aduitFailureCause;
    }

    public void setAduitFailureCause(String aduitFailureCause) {
        this.aduitFailureCause = aduitFailureCause == null ? null : aduitFailureCause.trim();
    }

    public Long getAduitUserId() {
        return aduitUserId;
    }

    public void setAduitUserId(Long aduitUserId) {
        this.aduitUserId = aduitUserId;
    }

    public Integer getAduitNewsVersion() {
        return aduitNewsVersion;
    }

    public void setAduitNewsVersion(Integer aduitNewsVersion) {
        this.aduitNewsVersion = aduitNewsVersion;
    }

    public Integer getAduitResult() {
        return aduitResult;
    }

    public void setAduitResult(Integer aduitResult) {
        this.aduitResult = aduitResult;
    }

    @Override
    public String toString() {
        return "NewsRecord{" +
                "newsRecordId=" + newsRecordId +
                ", newsId=" + newsId +
                ", forReviewTime=" + forReviewTime +
                ", soldoutTime=" + soldoutTime +
                ", soldoutUserId=" + soldoutUserId +
                ", aduitFailureCause='" + aduitFailureCause + '\'' +
                ", aduitUserId=" + aduitUserId +
                ", aduitNewsVersion=" + aduitNewsVersion +
                ", aduitResult=" + aduitResult +
                '}';
    }
}