package com.example.hforum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
    //前台路径访问控制
    @RequestMapping("/")
    public String toWelcomePage() {
        return "front/index";
    }

    @RequestMapping("/{page}")
    public String toFrontPage(@PathVariable String page) {
        return "front/" + page;
    }

    @RequestMapping("/{dir}/{page}")
    public String toFrontDirPage(@PathVariable String dir, @PathVariable String page) {
        if("u".equals(dir)){
            return "front/user/" + page;
        }
        return "front/" +dir + "/" + page;
    }

    //后台路径访问控制
    @RequestMapping("/back")
    public String toAdminWelcomePage() {
        return "back/manage/index";
    }

    @RequestMapping("/back/{page}")
    public String toBackPage(@PathVariable String page) {
        return "back/" + page;
    }

    @RequestMapping("/back/{dir}/{page}")
    public String toBackDirPage(@PathVariable String dir, @PathVariable String page) {
        return "back/" + dir + "/" + page;
    }

    @RequestMapping("/back/{dir1}/{dir2}/{page}")
    public String toBackDirPage2(@PathVariable String dir1, @PathVariable String dir2, @PathVariable String page) {
        return "back/" +dir1 + "/" + dir2 + "/" + page;
    }

    @RequestMapping("common/{page}")
    public String toCommonPage(@PathVariable String page) {
        return "common/" + page;
    }
}
