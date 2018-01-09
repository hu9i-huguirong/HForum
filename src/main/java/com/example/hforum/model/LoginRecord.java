package com.example.hforum.model;

import java.util.Date;

public class LoginRecord {
    private Long loginRecordId;

    private Long loginUserId;

    private Date loginTime;

    private String loginIp;

    private Long loginType;

    //参数，登录次数
    private Long loginCount;

    public Long getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Long loginCount) {
        this.loginCount = loginCount;
    }

    public Long getLoginRecordId() {
        return loginRecordId;
    }

    public void setLoginRecordId(Long loginRecordId) {
        this.loginRecordId = loginRecordId;
    }

    public Long getLoginUserId() {
        return loginUserId;
    }

    public void setLoginUserId(Long loginUserId) {
        this.loginUserId = loginUserId;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp == null ? null : loginIp.trim();
    }

    public Long getLoginType() {
        return loginType;
    }

    public void setLoginType(Long loginType) {
        this.loginType = loginType;
    }
}