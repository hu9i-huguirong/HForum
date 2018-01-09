package com.example.hforum.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

public class Image implements Serializable{
    private Long imageId;

    private String imageContent;

    private Long imageNewsId;

    private Long uploadUserId;

    private Integer imageType;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date uploadTime;

    public Long getImageId() {
        return imageId;
    }

    public void setImageId(Long imageId) {
        this.imageId = imageId;
    }

    public String getImageContent() {
        return imageContent;
    }

    public void setImageContent(String imageContent) {
        this.imageContent = imageContent == null ? null : imageContent.trim();
    }

    public Long getImageNewsId() {
        return imageNewsId;
    }

    public void setImageNewsId(Long imageNewsId) {
        this.imageNewsId = imageNewsId;
    }

    public Long getUploadUserId() {
        return uploadUserId;
    }

    public void setUploadUserId(Long uploadUserId) {
        this.uploadUserId = uploadUserId;
    }

    public Integer getImageType() {
        return imageType;
    }

    public void setImageType(Integer imageType) {
        this.imageType = imageType;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    @Override
    public String toString() {
        return "Image{" +
                "imageId=" + imageId +
                ", imageContent='" + imageContent + '\'' +
                ", imageNewsId=" + imageNewsId +
                ", uploadUserId=" + uploadUserId +
                ", imageType=" + imageType +
                ", uploadTime=" + uploadTime +
                '}';
    }
}