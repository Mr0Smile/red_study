package com.example.service;

import com.example.entity.StudyBaseform;
import com.example.mapper.StudybaseformMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * studybaseform业务处理
 **/
@Service
public class StudybaseformService {

    @Resource
    private StudybaseformMapper studybaseformMapper;

    /**
     * 新增
     */
    public void add(StudyBaseform studybaseform) {
        studybaseformMapper.insert(studybaseform);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        studybaseformMapper.deleteById(id);
    }

    /**
     * 修改
     */
    public void updateById(StudyBaseform studybaseform) {
        studybaseformMapper.updateById(studybaseform);
    }

    /**
     * 根据ID查询
     */
    public StudyBaseform selectById(Integer id) {
        return studybaseformMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<StudyBaseform> selectAll(StudyBaseform studybaseform) {
        return studybaseformMapper.selectAll(studybaseform);
    }

    /**
     * 分页查询
     */
    public PageInfo<StudyBaseform> selectPage(StudyBaseform studybaseform, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<StudyBaseform> list = studybaseformMapper.selectAll(studybaseform);
        return PageInfo.of(list);
    }

}