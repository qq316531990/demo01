package com.dao;

import com.pojo.SecondType;
import com.pojo.SecondTypeView;
import com.pojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface  SecondTypeDao {

    List<SecondTypeView> listTypes (Map map);
    int countTypes(Map map);
    int deleteTypes(Integer[] secondType_id);
    int updateType(@Param("type") SecondType type);
    List<SecondTypeView> getTypeByTypeId(Integer type_id);
    int insertType(@Param("type") SecondType type);
    List<SecondTypeView> getTypeByTypeName (String type_name);
}
