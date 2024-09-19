package com.example.controller;

import com.example.common.Result;
import com.example.entity.GoodsIn;
import com.example.service.GoodsInService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 分类前端操作接口
 **/
@RestController
@RequestMapping("/goodsIn")
public class GoodsInController {

    @Resource
    private GoodsInService goodsInService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody GoodsIn goodsIn) {
        goodsInService.add(goodsIn);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        goodsInService.deleteById(id);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody GoodsIn goodsIn) {
        goodsInService.updateById(goodsIn);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        GoodsIn goodsIn = goodsInService.selectById(id);
        return Result.success(goodsIn);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(GoodsIn goodsIn) {
        List<GoodsIn> list = goodsInService.selectAll(goodsIn);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(GoodsIn goodsIn,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<GoodsIn> page = goodsInService.selectPage(goodsIn, pageNum, pageSize);
        return Result.success(page);
    }

}