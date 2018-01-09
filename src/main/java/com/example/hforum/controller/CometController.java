package com.example.hforum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

/**
 * 服务器推送
 * ConcurrentLinkedQueue是Queue队列的一个线程安全实现，这里使用它来作为保存请求的容器。
 * AsyncContext是Tomcat支持的异步环境，不同的服务器使用的对象也略有不同。
 * Jetty支持的对象是Continuation。完成了广播的请求需要通过context.complete()将相关请求结束，
 * 并使用CONNECTIONS.remove(context)删除队列。
 */
@Controller
@RequestMapping(value = "/comet")
public class CometController {
    public static final Queue<AsyncContext> CONNECTIONS = new ConcurrentLinkedQueue<AsyncContext>();

    @ResponseBody
    @RequestMapping("/open")
    public void open(HttpServletRequest request) throws ServletException, IOException {
        // 开始请求的挂起
        AsyncContext context = request.startAsync();
        context.setTimeout(0);
        //把异步上下文放在列表中以被将来调用
        CONNECTIONS.offer(context);
    }
}
