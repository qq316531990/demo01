package com.dao;

import com.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {

    List<User> login (String user_name);
    int insertUser(@Param("user") User user);

}
