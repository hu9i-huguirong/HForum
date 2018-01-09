package com.example.hforum.controller;

import com.example.hforum.model.User;
import com.example.hforum.service.UserService;
import com.example.hforum.shiro.token.MyUsernamePasswordToken;
import com.example.hforum.utils.PageBean;
import com.example.hforum.utils.ResponseDataFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@RequestMapping("/user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    // 限制提交方式只能为post
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String userName, String userPwd,String userType) {
        Subject currentUser = SecurityUtils.getSubject();
        // 把用户名和密码封装为 UsernamePasswordToken 对象
        MyUsernamePasswordToken token = new MyUsernamePasswordToken(userName, userPwd, userType);
        if (!currentUser.isAuthenticated()) {// 没有认证
            // rememberme
            // token.setRememberMe(true);
            try {
                // 执行登录.
                currentUser.login(token);
            }

            // 所有认证时异常的父类.
            catch (AuthenticationException ae) {
                ae.printStackTrace();
                //System.out.println("登录失败: " + ae.getMessage());
            }
        }

        if (token.getUserType().equals("admin")) {
            return "redirect:/back";
        } else {
            return "redirect:/u/index";
        }
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public Map<String, Object> list(int page, int limit, User user) {

        PageBean pageBean = ResponseDataFactory.createPageBean(page, limit, true);

        List<User> list = userService.list(user, pageBean);

        return ResponseDataFactory.buildResponseDataMap(pageBean, list);
    }


    @RequestMapping(value = "/logout")
    public String logout(Integer loginType) {
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.isAuthenticated()) {
            currentUser.logout();
        }
        String redirectURL = "redirect:/login";;
        if (loginType == 2) {
            redirectURL = "redirect:/back/login";
        }
        return redirectURL;
    }


}
