package com.service.impl;

import com.dao.UserDao;
import com.pojo.User;
import com.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Resource
    UserDao userDao;
    public List<User> login(String user_name) {
        return userDao.login( user_name);
    }

    public int insertUser(User user) {
        return userDao.insertUser(user);
    }
}
