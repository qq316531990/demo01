package com.service.impl;

import com.dao.TypeDao;
import com.pojo.Type;
import com.service.TypeService;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.List;
@Service
public class TypeServiceImpl implements TypeService {
    @Resource
    TypeDao typeDao;
    public List<Type> getList() {
        return typeDao.getList();
    }
}
