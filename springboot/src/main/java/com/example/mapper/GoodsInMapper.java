package com.example.mapper;

import com.example.entity.GoodsIn;
import org.apache.ibatis.annotations.Delete;
import java.util.List;

/**
 * 操作goodsIn相关数据接口
 */
public interface GoodsInMapper {

  /**
   * 新增
   */
  int insert(GoodsIn goodsIn);

  /**
   * 删除
   */
  @Delete("delete from goods_in where id = #{id}")
  int deleteById(Integer id);

  /**
   * 修改
   */
  int updateById(GoodsIn goodsIn);

  /**
   * 根据id查询
   */
  GoodsIn selectById(Integer id);

  /**
   * 查询所有
   */
  List<GoodsIn> selectAll(GoodsIn goodsIn);

}