package com.service;

import com.pojo.PageBean;
import com.pojo.SecondType;
import com.pojo.SecondTypeVO;

import java.util.List;

public interface SecondTypeService {
    List<SecondType> listAllTypes ();
    int insertType(SecondType type);
    PageBean<SecondTypeVO> listTypes(PageBean<SecondTypeVO> pageBean, SecondTypeVO type);
    int deleteTypes(Integer[] secondType_id);
    List<SecondTypeVO> getTypeByTypeId(Integer type_id);
    List<SecondTypeVO> getType2ByTypeId(Integer type_id);
    int updateType(SecondType type);
    List<SecondTypeVO> getTypeByTypeName (String type_name);
}
