package com.service.impl;

import com.dao.UserDao;
import com.pojo.PageBean;
import com.pojo.User;
import com.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;
    public List<User> login(String user_name) {
        return userDao.login( user_name);
    }

    public List<User> getUserByUserId(Integer user_id) {
        return userDao.getUserByUserId(user_id);
    }

    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    public PageBean<User> listUsers(PageBean<User> pageBean, User user) {
        // TODO Auto-generated method stub

        //查数据  并将数据  放置到pageBean中
        Map map=new HashMap();
        System.out.println(user);
        map.put("user", user);
        pageBean.setCount(userDao.countUsers(map));
        map.put("startIndex",pageBean.getStartIndex());
        map.put("pageSize",pageBean.getPageSize());
        pageBean.setData(userDao.listUsers(map));
        return pageBean;
    }

    public int insertUser(User user) {
        return userDao.insertUser(user);
    }

    public int deleteUsers(Integer[] user_id) {
        return userDao.deleteUsers(user_id);
    }
}
