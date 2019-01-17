package com.service;

import com.pojo.PageBean;
import com.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface UserService {
   List<User> login(String user_name);
   int insertUser(User user);
   PageBean<User> listUsers(PageBean<User> pageBean, User user);
   int deleteUsers(Integer[] user_id);
   List<User> getUserByUserId(Integer user_id);
   int updateUser(User user);
}
