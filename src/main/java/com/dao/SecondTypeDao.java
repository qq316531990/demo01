package com.dao;

import com.pojo.SecondType;
import com.pojo.SecondTypeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface  SecondTypeDao {
    /**
    *
     * @Author tangxiangan
     * @Description //TODO 查询所有分类
     * @Date 10:54 2019/1/11
     * @Param []
     * @return java.util.List<com.pojo.SecondType>
     **/
    List<SecondType> listAllTypes ();
    /**
    *
     * @Author tangxiangan
     * @Description //TODO 二级分页分页查询
     * @Date 10:55 2019/1/11
     * @Param [map]
     * @return java.util.List<com.pojo.SecondTypeVO>
     **/
    List<SecondTypeVO> listTypes (Map map);
    int countTypes(Map map);
    /**
    *
     * @Author tangxiangan
     * @Description //TODO 删除
     * @Date 10:55 2019/1/11
     * @Param [secondType_id]
     * @return int
     **/
    int deleteTypes(Integer[] secondType_id);
    /**
    *
     * @Author tangxiangan
     * @Description //TODO 更新
     * @Date 10:55 2019/1/11
     * @Param [secondType_id]
     * @return int
     **/
    int updateType(@Param("type") SecondType type);
    /**
     *
     * @Author tangxiangan
     * @Description //TODO 根据id查询二级分类
     * @Date 10:55 2019/1/11
     * @Param [type]
     * @return int
     **/
    List<SecondTypeVO> getTypeByTypeId(Integer type_id);
    /**
    *
     * @Author tangxiangan
     * @Description //TODO 插入二级分类
     * @Date 10:56 2019/1/11
     * @Param [type]
     * @return int
     **/
    int insertType(@Param("type") SecondType type);
    /**
    *
     * @Author tangxiangan
     * @Description //TODO 根据分类名查询是否已存在对应的对象
     * @Date 10:56 2019/1/11
     * @Param List<SecondTypeVO>
     * @return java.util.List<com.pojo.SecondTypeVO>
     **/
    List<SecondTypeVO> getTypeByTypeName (String type_name);
}
