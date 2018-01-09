package com.example.hforum.global;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HForumExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
                                         Exception ex) {

        ModelAndView mv = new ModelAndView();
        if (ex instanceof UnauthorizedException) {
            // 没有权限异常
            mv.setViewName("/common/403");
        } else if (ex instanceof HForumException) {
            //自定义异常
            mv.addObject("message", ((HForumException) ex).getMessage());
        } else {
            //未知异常
            mv.addObject("message", ex.getMessage());
         //   mv.setViewName("/common/500");
        }
        return mv;
    }

}