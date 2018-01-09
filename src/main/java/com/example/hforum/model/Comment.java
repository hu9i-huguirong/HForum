package com.example.hforum.model;

import java.util.Date;

public class Comment {
    private Integer commentId;

    private String commentContent;

    private Long commentUserId;

    private Long commentNewsId;

    private Integer superCommentId;

    private Date commentTime;

    private Integer commentThumb;

    private Boolean allowShow;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }

    public Long getCommentUserId() {
        return commentUserId;
    }

    public void setCommentUserId(Long commentUserId) {
        this.commentUserId = commentUserId;
    }

    public Long getCommentNewsId() {
        return commentNewsId;
    }

    public void setCommentNewsId(Long commentNewsId) {
        this.commentNewsId = commentNewsId;
    }

    public Integer getSuperCommentId() {
        return superCommentId;
    }

    public void setSuperCommentId(Integer superCommentId) {
        this.superCommentId = superCommentId;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public Integer getCommentThumb() {
        return commentThumb;
    }

    public void setCommentThumb(Integer commentThumb) {
        this.commentThumb = commentThumb;
    }

    public Boolean getAllowShow() {
        return allowShow;
    }

    public void setAllowShow(Boolean allowShow) {
        this.allowShow = allowShow;
    }
}