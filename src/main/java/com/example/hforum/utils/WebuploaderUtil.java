package com.example.hforum.utils;

import com.example.hforum.global.HForumException;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

public class WebuploaderUtil {
    private static final String allowSuffix = "jpg|png|gif|jpeg|bmp";//允许文件格式
    private static final long allowSize = 2 * 1024 * 1024L;//允许文件大小 2MB

    public static void checkFile(MultipartFile file) throws HForumException {
        if (file == null) {
            throw new HForumException("文件不能为空");
        }
        // file.getOriginalFilename()是得到上传时的文件名
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        int length = allowSuffix.indexOf(suffix);
        if (length == -1) {
            throw new HForumException("请上传允许格式的文件");
        } else if (file.getSize() > allowSize) {
            throw new HForumException("您上传的文件大小已经超出范围");
        }
    }

    /**
     * 单个文件上传
     *
     * @param file
     * @param destDir
     * @param request
     * @return
     * @throws Exception
     */
    public static String upload(MultipartFile file, String destDir, HttpServletRequest request) throws Exception {
        try {
            checkFile(file);
            String realPath = request.getSession().getServletContext().getRealPath("/");
            File destFile = new File(realPath + destDir);
            if (!destFile.exists()) {
                destFile.mkdirs();
            }
            String fileNewName = IDUtil.createUUID();
            File f = new File(destFile.getAbsoluteFile() + "/" + fileNewName);
            file.transferTo(f);
            f.createNewFile();
            return fileNewName;
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * 多个文件上传
     *
     * @param files
     * @param destDir
     * @param request
     * @return
     * @throws Exception
     */
    public static String[] uploads(MultipartFile[] files, String destDir, HttpServletRequest request) throws Exception {
        String[] fileNames;
        try {
            fileNames = new String[files.length];
            int index = 0;
            for (MultipartFile file : files) {
                checkFile(file);
                String realPath = request.getSession().getServletContext().getRealPath("/");
                File destFile = new File(realPath + destDir);
                if (!destFile.exists()) {
                    destFile.mkdirs();
                }
                // String fileNewName = IDUtil.createUUID()+"."+suffix;
                //不加后缀名
                String fileNewName = IDUtil.createUUID();
                File f = new File(destFile.getAbsoluteFile() + "/" + fileNewName);
                //MultipartFile自带的解析方法
                file.transferTo(f);
                f.createNewFile();
                fileNames[index++] = fileNewName;
            }
            return fileNames;
        } catch (Exception e) {
            throw e;
        }
    }
}
