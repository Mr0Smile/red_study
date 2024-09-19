package com.example.service;

import com.example.entity.Content;
import com.example.mapper.ContentMapper;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.List;

@Service
public class ContentService {

    @Resource
    private ContentMapper contentMapper;

    public List<Content> getContentByArticleId(Integer articleId) {
        return contentMapper.selectByArticleId(articleId);
    }
}
