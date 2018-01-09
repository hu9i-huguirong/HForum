package com.example.hforum.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 转成layui需要的数据格式并且兼容springmvc
 */
public class ResponseDataFactory {
    //返回的数据状态
    public  static int RESPONSE_NORMAL_CODE = 0;// 表示正常
    public  static int RESPONSE_KICKOUT_CODE = 7;//踢人

    public static PageBean createPageBean(Integer curPage, Integer pageRecord, Boolean paginate) {
        PageBean pageBean = new PageBean();
        if (paginate != null && paginate == false) {
            pageBean.setPaginate(false);
            return pageBean;
        }
        else{
            pageBean.setCurPage(curPage);
            pageBean.setPageRecord(pageRecord);
        }
        return pageBean;
    }

    public static Map<String, Object> buildResponseDataMap(PageBean pageBean, List list) {
        Map<String, Object> responseData = new HashMap<>();
        //  responseData.put("rel",pageBean.isPaginate());
        responseData.put("code", RESPONSE_NORMAL_CODE);
        responseData.put("msg", "");
        responseData.put("data", list);
        responseData.put("count", pageBean.getTotalRecord());
        return responseData;
    }

    public static Map<String, Object> buildResponseInfoMap(Integer code, String msg, String url, Long userId) {
        Map<String, Object> responseInfo = new HashMap<>();
        responseInfo.put("code", code);
        responseInfo.put("msg", msg);
        responseInfo.put("url", url);
        responseInfo.put("userId", userId);
        return responseInfo;
    }
}
