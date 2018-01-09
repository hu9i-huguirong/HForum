package com.example.hforum.controller;

import com.example.hforum.model.Image;
import com.example.hforum.service.ImageService;
import com.example.hforum.utils.DateUtil;
import com.example.hforum.utils.WebuploaderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;

@RequestMapping("/image")
@Controller
public class ImageController {
    @Autowired
    private ImageService imageService;

    @RequestMapping("/uploadImage")
    //@ResponseBody
    public void uploadImage(MultipartFile file, Image image, HttpServletRequest request,HttpServletResponse response)  {
        Long imageId = null;
        try {
            String d = DateUtil.format(new Date(), "yyyyMMdd");
            String destDir = "news/images/" + d;
            String fileName = WebuploaderUtil.upload(file, destDir, request);
            image.setUploadTime(new Date());
            image.setImageContent(destDir + "/" + fileName);
            imageService.add(image);
            response.getWriter().print(image.getImageId());
        } catch (Exception e) {
           throw new RuntimeException(e);
        }
    }

    @RequestMapping("/downloadImage")
    public void downloadImage(HttpServletRequest request, HttpServletResponse response, String fileName) throws Exception {

        String realPath = request.getSession().getServletContext().getRealPath("/");
        fileName = realPath + "news/20171228/images/" + fileName;
//        //假如以中文名下载的话
//        String filename = "下载文件.png";
//        //转码，免得文件名中文乱码
//        filename = URLEncoder.encode(filename, "UTF-8");
//        //设置文件下载头
//        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
//        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
//        response.setContentType("multipart/form-data");

        //获取输入流
        InputStream is = new FileInputStream(
                new File(fileName));
        OutputStream os = response.getOutputStream();
        byte[] b = new byte[1024];
        int len = -1;

        while ((len = is.read(b)) != -1) {
            os.write(b, 0, len);
        }
        os.close();
        is.close();
    }
}
