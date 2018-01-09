package com.example.hforum.controller;

import com.example.hforum.model.LoginRecord;
import com.example.hforum.service.LoginRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/record")
@Controller
public class LoginRecordController {
    @Autowired
    private LoginRecordService loginRecordService;

    @RequestMapping(value = "/recentLogin")
    public ModelAndView recentLogin(Long userId) {
        ModelAndView mv = new ModelAndView();
        LoginRecord loginRecord = loginRecordService.selectLsatRecordByUserId(userId);
        mv.addObject("recentLogin",loginRecord);
        mv.setViewName("/back-stage/manage/welcome.jsp");
        return mv;
    }
}
