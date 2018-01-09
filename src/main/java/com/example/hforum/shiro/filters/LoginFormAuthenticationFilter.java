package com.example.hforum.shiro.filters;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class LoginFormAuthenticationFilter extends FormAuthenticationFilter {
    /**
     * 重写登录地址
     */
    @Override
    protected void redirectToLogin(ServletRequest request,
                                   ServletResponse response) throws IOException {
        String requestURI = ((HttpServletRequest) request).getRequestURI();
        if (requestURI.indexOf("/back") == 0) {
            //重定向到后台登录页
            WebUtils.getAndClearSavedRequest(request); // 要清除登录前请求路径 不然不会重写成功
            String loginUrl = "/back/login";
            WebUtils.issueRedirect(request, response, loginUrl);
        } else {
            super.redirectToLogin(request, response);
        }
    }

}
