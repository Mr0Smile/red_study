package com.example.mapper;

import com.example.entity.StudyBase;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

public interface StudyBaseMapper {

    /**
     * 新增
     */
    int insert(StudyBase studybaseform);

    /**
     * 删除
     */
    @Delete("delete from study_base where id = #{id}")
    int deleteById(Integer id);

    /**
     * 修改
     */
    int updateById(StudyBase studybaseform);

    StudyBase selectById(Integer id);

    /**
     * 查询所有
     */
    List<StudyBase> selectAll(StudyBase studybaseform);

}
