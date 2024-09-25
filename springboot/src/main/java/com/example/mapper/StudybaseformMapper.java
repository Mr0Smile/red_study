package com.example.mapper;

import com.example.entity.StudyBaseform;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

public interface StudybaseformMapper {

    /**
     * 新增
     */
    int insert(StudyBaseform studybaseform);

    /**
     * 删除
     */
    @Delete("delete from study_baseform where id = #{id}")
    int deleteById(Integer id);

    /**
     * 修改
     */
    int updateById(StudyBaseform studybaseform);

    StudyBaseform selectById(Integer id);

    /**
     * 查询所有
     */
    List<StudyBaseform> selectAll(StudyBaseform studybaseform);

}

