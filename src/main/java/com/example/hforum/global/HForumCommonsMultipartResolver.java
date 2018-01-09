package com.example.hforum.global;

import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;

/**
 * 自定义全局文件解释器
 */
public class HForumCommonsMultipartResolver extends CommonsMultipartResolver {
    /**
     * 用于过滤百度编辑器上传文件时阻止CommonsMultipartResolver对文件进行包装
     *
     * @param request
     * @return
     */
    @Override
    public boolean isMultipart(HttpServletRequest request) {
        String uri = request.getRequestURI();
        if (uri.indexOf("ueditor/config") > 0) {
            return false;//放行
        }
        return super.isMultipart(request);
    }
}
