package com.dao;

import com.pojo.StatisticsVO;
import com.pojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TypeDao {
    /**
     * @Author tangxiangan
     * @Description //TODO 查询内所有一级分类
     * @Date 15:19 2019/1/7
     * @Param []
     * @return java.util.List<com.pojo.Type>
     **/
    List<Type> getList();
    /**
     * @Author tangxiangan
     * @Description //TODO  分页查询
     * @Date 15:20 2019/1/7
     * @Param [map]
     * @return java.util.List<com.pojo.Type>
     **/
    List<Type> listTypes (Map map);
    /**
     * @Author tangxiangan
     * @Description //TODO 分页查询计算总数
     * @Date 15:24 2019/1/7
     * @Param [map]
     * @return int
     **/
    int countTypes(Map map);
    /**
     * @Author tangxiangan
     * @Description //TODO  删除一级分类
     * @Date 15:20 2019/1/7
     * @Param [type_id]
     * @return int
     **/
    int deleteTypes(Integer[] type_id);
    /**
     * @Author tangxiangan
     * @Description //TODO 更新一级分类
     * @Date 15:21 2019/1/7
     * @Param [type]
     * @return int
     **/
    int updateType(@Param("type") Type type);
    /**
     * @Author tangxiangan
     * @Description //TODO 根据一级分类id查询
     * @Date 15:21 2019/1/7
     * @Param [type_id]
     * @return java.util.List<com.pojo.Type>
     **/
    List<Type> getTypeByTypeId(Integer type_id);
    /**
     * @Author tangxiangan
     * @Description //TODO 插入
     * @Date 15:21 2019/1/7
     * @Param [type]
     * @return int
     **/
    int insertType(@Param("type") Type type);
    /**
     * @Author tangxiangan
     * @Description //TODO  根据分类名进行查询
     * @Date 15:22 2019/1/7
     * @Param [type_name]
     * @return java.util.List<com.pojo.Type>
     **/
    List<Type> getTypeByTypeName (String type_name);


    /**
     * @Author tangxiangan
     * @Description //TODO 分类借阅次数统计图表
     * @Date 14:05 2019/1/8
     * @Param []
     * @return java.util.List<com.pojo.StatisticsVO>
     **/
    List<StatisticsVO> listTypeStatistics();
    /**
     * @Author tangxiangan
     * @Description //TODO 二级分类借阅次数统计图表
     * @Date 14:05 2019/1/8
     * @Param []
     * @return java.util.List<com.pojo.StatisticsVO>
     **/
    List<StatisticsVO> listSecondTypeStatistics();
    /**
     * @Author tangxiangan
     * @Description //TODO  获得某个月的二级分类借阅次数统计
     * @Date 10:11 2019/1/9
     * @Param []
     * @return java.util.List<com.pojo.StatisticsVO>
     **/
    List<StatisticsVO> listLastMonthSecondTypeStatistics();
    /**
     * @Author tangxiangan
     * @Description //TODO  上个月借阅前10的书籍的统计
     * @Date 10:11 2019/1/9
     * @Param []
     * @return java.util.List<com.pojo.StatisticsVO>
     **/
    List<StatisticsVO> listLastMonthBorrowStatistics();

}
