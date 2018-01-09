package com.example.hforum.po;

import java.io.Serializable;

/**
 * 用于桥接
 */
public class BridgePo implements Serializable {
    private Long oneId;
    private Long twoId;


    public BridgePo(Long oneId, Long twoId) {
        this.oneId = oneId;
        this.twoId = twoId;
    }

    public BridgePo(Long oneId, Integer twoId) {
        this.oneId = oneId;
        this.twoId = Long.parseLong(twoId+"");
    }

    public Long getOneId() {
        return oneId;
    }

    public void setOneId(Long oneId) {
        this.oneId = oneId;
    }

    public Long getTwoId() {
        return twoId;
    }

    public void setTwoId(Long twoId) {
        this.twoId = twoId;
    }
}
