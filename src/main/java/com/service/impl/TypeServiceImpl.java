package com.service.impl;

import com.dao.TypeDao;
import com.pojo.PageBean;
import com.pojo.Type;
import com.pojo.StatisticsVO;
import com.service.TypeService;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TypeServiceImpl implements TypeService {
    @Resource
    private TypeDao typeDao;
    public List<Type> getList() {
        return typeDao.getList();
    }

    public int insertType(Type type) {
        return typeDao.insertType(type);
    }

    public List<StatisticsVO> listLastMonthBorrowStatistics() {
        return typeDao.listLastMonthBorrowStatistics();
    }

    public PageBean<Type> listTypes(PageBean<Type> pageBean, Type type) {
        Map map=new HashMap();
        System.out.println(type);
        map.put("type", type);
        pageBean.setCount(typeDao.countTypes(map));
        map.put("startIndex",pageBean.getStartIndex());
        map.put("pageSize",pageBean.getPageSize());
        pageBean.setData(typeDao.listTypes(map));
        return pageBean;
    }

    public int deleteTypes(Integer[] type_id) {
        return typeDao.deleteTypes(type_id);
    }

    public List<Type> getTypeByTypeId(Integer type_id) {
        return typeDao.getTypeByTypeId(type_id);
    }

    public List<Type> getTypeByTypeName(String type_name) {
        return typeDao.getTypeByTypeName(type_name);
    }

    public List<StatisticsVO> listLastMonthSecondTypeStatistics() {
        return typeDao.listLastMonthSecondTypeStatistics();
    }

    public List<StatisticsVO> listSecondTypeStatistics() {
        return typeDao.listSecondTypeStatistics();
    }

    public List<StatisticsVO> listTypeStatistics() {
        return typeDao.listTypeStatistics();
    }

    public int updateType(Type type) {
        return typeDao.updateType(type);
    }
}
