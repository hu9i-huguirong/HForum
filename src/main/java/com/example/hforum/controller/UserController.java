package com.example.hforum.controller;

import com.example.hforum.model.User;
import com.example.hforum.service.UserService;
import com.example.hforum.shiro.token.MyUsernamePasswordToken;
import com.example.hforum.utils.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RequestMapping("/user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    private static final int USER_EMPTY = 100;
    private static final int USER_EXIST_NO_ACTIVATE = 101;
    private static final int USER_REGISTER_SUCCESS = 102;
    private static final int USER_ACTIVATE_KEY_EMPTY = 103;
    private static final int USER_ACTIVATE_KEY_ERROR = 104;
    private static final int USER_ACTIVATE_SUCCESS = 105;
    private static final int USER_ACTIVATE_EMAIL_RESEND = 106;
    private static final int USER_EXIST_ACTIVATED = 107;

    // 限制提交方式只能为post
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String userName, String userPwd, String userType) {
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

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public void register(User user, HttpServletRequest request, HttpServletResponse response) throws Exception {
        User u = userService.selectByEmail(user);
        PrintWriter out = response.getWriter();
        if (u != null) {
            if (u.getUserStatus() == 0) {
                out.print(USER_EXIST_NO_ACTIVATE);
            } else {
                out.print(USER_EXIST_ACTIVATED);
            }

        } else {
            String activateKey = IDUtil.createUUID(false);
            user.setActivateKey(activateKey);
            user.setUserStatus(0l);
            user.setRegisterTime(new Date());
            userService.add(user);

            user.setPassword(EncodeUtil.hashEcode(user.getPassword(), user.getUserId() + ""));
            user.setUserName("用户_" + user.getUserId());
            userService.updateByPrimaryKeySelective(user);

            EmailUtil.schedule(user.getEmail(), request.getSession(), activateKey);

            out.print(USER_REGISTER_SUCCESS);
        }
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/register/activate")
    public void activate(User user, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String activateKey = (String) request.getSession().getAttribute("activateKey");
        PrintWriter out = response.getWriter();
        if (activateKey == null || user.getActivateKey() == null) {
            out.print(USER_ACTIVATE_KEY_EMPTY);
        } else if (!user.getActivateKey().equals(activateKey)) {
            out.print(USER_ACTIVATE_KEY_ERROR);
        } else {
            User u = userService.selectByActivateKey(user);
            if (u == null) {
                out.print(USER_EMPTY);
            } else {
                if (u.getUserStatus() != 1) {
                    u.setUserStatus(1l);
                    userService.updateByPrimaryKeySelective(u);
                }
                out.print(USER_ACTIVATE_SUCCESS);
            }

        }
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/resend", method = RequestMethod.POST)
    @ResponseBody
    public void reSend(User user, HttpServletRequest request, HttpServletResponse response) throws Exception {
        User u = userService.selectByEmail(user);
        PrintWriter out = response.getWriter();
        if (u == null) {
            out.print(USER_EMPTY);
        } else if (u.getUserStatus() == 1) {
            out.print(USER_ACTIVATE_SUCCESS);
        } else {
            String activateKey = IDUtil.createUUID(false);
            u.setActivateKey(activateKey);
            userService.updateByPrimaryKeySelective(u);
            EmailUtil.schedule(user.getEmail(), request.getSession(), activateKey);
            out.print(USER_ACTIVATE_EMAIL_RESEND);
        }
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/logout")
    public String logout(Integer loginType) {
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.isAuthenticated()) {
            currentUser.logout();
        }
        String redirectURL = "redirect:/login";
        ;
        if (loginType == 2) {
            redirectURL = "redirect:/back/login";
        }
        return redirectURL;
    }


}
