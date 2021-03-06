package com.service.impl;

import com.dao.SecondTypeDao;
import com.pojo.PageBean;
import com.pojo.SecondType;
import com.pojo.SecondTypeVO;
import com.service.SecondTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SecondTypeServiceImpl implements SecondTypeService {
    @Resource
    private SecondTypeDao secondTypeDao;

    public List<SecondType> listAllTypes() {
        return  secondTypeDao.listAllTypes();
    }

    public int insertType(SecondType type) {
        return secondTypeDao.insertType(type);
    }

    public PageBean<SecondTypeVO> listTypes(PageBean<SecondTypeVO> pageBean, SecondTypeVO type) {
        Map map=new HashMap();
        System.out.println(type);
        map.put("type", type);
        pageBean.setCount(secondTypeDao.countTypes(map));
        map.put("startIndex",pageBean.getStartIndex());
        map.put("pageSize",pageBean.getPageSize());
        pageBean.setData(secondTypeDao.listTypes(map));
        return pageBean;
    }

    public int deleteTypes(Integer[] secondType_id) {
        return secondTypeDao.deleteTypes(secondType_id);
    }

    public List<SecondTypeVO> getTypeByTypeId(Integer type_id) {
        return secondTypeDao.getTypeByTypeId(type_id);
    }
    public List<SecondTypeVO> getType2ByTypeId(Integer type_id) {
        return secondTypeDao.getType2ByTypeId(type_id);
    }

    public int updateType(SecondType type) {
        return secondTypeDao.updateType(type);
    }

    public List<SecondTypeVO> getTypeByTypeName(String type_name) {
        return secondTypeDao.getTypeByTypeName(type_name);
    }
}
