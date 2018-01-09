package com.example.hforum.utils;

import com.example.hforum.controller.CometController;
import org.json.JSONObject;

import javax.servlet.AsyncContext;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

public class BroadcastUtil {

    public static synchronized void broadcast(Map<String, Object> responseInfo) {
        for (AsyncContext context : CometController.CONNECTIONS) {
            HttpServletResponse response = (HttpServletResponse) context.getResponse();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
            JSONObject jsonObject = new JSONObject(responseInfo);
            try {
                PrintWriter out = response.getWriter();
                out.print(jsonObject);
                out.flush();
                out.close();
                context.complete();
                CometController.CONNECTIONS.remove(context);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
