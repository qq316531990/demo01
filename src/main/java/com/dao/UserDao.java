package com.dao;

import com.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserDao {

    List<User> login (String user_name);
    int insertUser(@Param("user") User user);
    List<User> listUsers (Map map);
    int countUsers(Map map);
    int deleteUsers(Integer[] user_id);
    int updateUser(@Param("user") User user);
    List<User> getUserByUserId(Integer user_id);

}
