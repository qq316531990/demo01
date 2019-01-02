package com.service;

import com.pojo.PageBean;
import com.pojo.Type;
import com.pojo.User;

import java.util.List;

public interface TypeService {
    List<Type> getList();
    int insertType(Type type);
    PageBean<Type> listTypes(PageBean<Type> pageBean, Type type);
    int deleteTypes(Integer[] type_id);
    List<Type> getTypeByTypeId(Integer type_id);
    int updateType(Type type);
    List<Type> getTypeByTypeName (String type_name);

}
