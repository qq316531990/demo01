package com.dao;

import com.pojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TypeDao {
    List<Type> getList();

    List<Type> listTypes (Map map);
    int countTypes(Map map);
    int deleteTypes(Integer[] type_id);
    int updateType(@Param("type") Type type);
    List<Type> getTypeByTypeId(Integer type_id);
    int insertType(@Param("type") Type type);
    List<Type> getTypeByTypeName (String type_name);



}
