package com.service;

import com.pojo.PageBean;
import com.pojo.StatisticsVO;
import com.pojo.Type;

import java.util.List;

public interface TypeService {
    /**
     * @Author tangxiangan
     * @Description //查询所有分类
     * @Date 15:38 2019/1/7
     * @Param []
     * @return java.util.List<com.pojo.Type>
     **/
    List<Type> getList();
    /**
     * @Author tangxiangan
     * @Description //插入分类
     * @Date 15:38 2019/1/7
     * @Param [type]
     * @return int
     **/
    int insertType(Type type);
    /**
     * @Author tangxiangan
     * @Description //分页查询
     * @Date 15:39 2019/1/7
     * @Param [pageBean, type]
     * @return com.pojo.PageBean<com.pojo.Type>
     **/
    PageBean<Type> listTypes(PageBean<Type> pageBean, Type type);
    /**
     * @Author tangxiangan
     * @Description //删除一级分类
     * @Date 15:40 2019/1/7
     * @Param [type_id]
     * @return int
     **/
    int deleteTypes(Integer[] type_id);
    /**
     * @Author tangxiangan
     * @Description //根据一级分类id查询
     * @Date 15:41 2019/1/7
     * @Param [type_id]
     * @return java.util.List<com.pojo.Type>
     **/
    List<Type> getTypeByTypeId(Integer type_id);
    /**
    *
     * @Author tangxiangan
     * @Description //更新
     * @Date 15:41 2019/1/7
     * @Param [type]
     * @return int
     **/
    int updateType(Type type);
    /**
     * @Author tangxiangan
     * @Description //根据分类名查询
     * @Date 15:41 2019/1/7
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
