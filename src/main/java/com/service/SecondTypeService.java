package com.service;

import com.pojo.PageBean;
import com.pojo.SecondType;
import com.pojo.SecondTypeView;

import java.util.List;

public interface SecondTypeService {
    int insertType(SecondType type);
    PageBean<SecondTypeView> listTypes(PageBean<SecondTypeView> pageBean, SecondTypeView type);
    int deleteTypes(Integer[] secondType_id);
    List<SecondTypeView> getTypeByTypeId(Integer type_id);
    List<SecondTypeView> getType2ByTypeId(Integer type_id);
    int updateType(SecondType type);
    List<SecondTypeView> getTypeByTypeName (String type_name);
}
