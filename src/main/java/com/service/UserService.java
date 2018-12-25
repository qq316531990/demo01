package com.service;

import com.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
   List<User> login(String user_name);
   int insertUser(User user);
}
