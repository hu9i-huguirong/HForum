package com.example.hforum.service.impl;

import com.example.hforum.model.Image;
import com.example.hforum.service.ImageService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext-dao.xml"})
public class ImageServiceImplTest {
    @Autowired
    private ImageService imageService;
    private Image image;

    @Before
    public void setUp() throws Exception {
        image = new Image();
    }
    @Test
    public void add() {
        image.setImageContent("aaa");
        image.setUploadTime(new Date());
        image.setUploadUserId(2l);

        imageService.add(image);
        System.out.println(image.getImageId());
    }
}