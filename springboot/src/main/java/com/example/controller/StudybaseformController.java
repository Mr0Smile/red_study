package com.example.controller;

import com.example.common.Result;
import com.example.entity.StudyBaseform;
import com.example.service.StudybaseformService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 分类前端操作接口
 **/
@RestController
@RequestMapping("/studybaseform")
public class StudybaseformController {

    @Resource
    private StudybaseformService studybaseformService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody StudyBaseform studybaseform) {
        System.out.println("--------------------");
        System.out.println(studybaseform);
        System.out.println("--------------------");

        studybaseformService.add(studybaseform);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        studybaseformService.deleteById(id);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody StudyBaseform studybaseform) {
        studybaseformService.updateById(studybaseform);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        StudyBaseform studybaseform = studybaseformService.selectById(id);
        return Result.success(studybaseform);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(StudyBaseform studybaseform) {
        List<StudyBaseform> list = studybaseformService.selectAll(studybaseform);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(StudyBaseform studybaseform,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<StudyBaseform> page = studybaseformService.selectPage(studybaseform, pageNum, pageSize);
        return Result.success(page);
    }


}