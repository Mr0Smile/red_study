package com.example.mapper;

import com.example.entity.Content;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface ContentMapper {
    List<Content> selectByArticleId(Integer articleId);
}