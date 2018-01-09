package com.example.hforum.service;

import com.example.hforum.model.Image;

import java.util.List;

public interface ImageService {
    void add(Image image);

    List<Image> selectByNewsId(Long newsId);
}
