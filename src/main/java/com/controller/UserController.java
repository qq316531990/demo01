package com.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.pojo.PageBean;
import com.pojo.User;
import com.service.UserService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/login")
    public @ResponseBody
    User login(HttpSession session, String user_name, String pwd) {
        System.out.println(pwd);
        List<User> list = userService.login(user_name);
        if (list.size() == 0) {
            return null;
        } else {

            if (list.get(0).getPwd().equals(pwd)) {
                session.setAttribute("userLogin", list.get(0));
                session.setAttribute("adminIsLogin", "OK");

                System.out.println(list.get(0));
                return list.get(0);
            } else {
                return null;
            }


        }

    }

    @RequestMapping("/register")
    public @ResponseBody
    User register( String phone, String pwd, String user_name,Integer permission_id)  {

        List<User> list=userService.login(user_name);
        if (list.size()==0){
            User user=new User();
            user.setUser_name(user_name);
            user.setPhone(phone);
            user.setPwd(pwd);
            user.setSex("男");
            if (permission_id!=null){
                user.setPermission_id(permission_id);
            }
            else{
                user.setPermission_id(1);
            }
            user.setCredibility(100);
            user.setBalance(0);
            userService.insertUser(user);
            return null;
        }
        return list.get(0);
    }

    @RequestMapping("/listUsers") //映射路径
    public @ResponseBody
    PageBean<User> listUsers(PageBean<User> pageBean,User user) {

        PageBean<User>  userPageBean=userService.listUsers(pageBean,user);

        return userPageBean;
    }

    @RequestMapping("/deleteUsers")
    @ResponseBody
    public Integer  deleteUsers(Integer[] user_id) {
        System.out.println(user_id.length);
        Integer num=  userService.deleteUsers(user_id);
         return num;
    }

    @RequestMapping("/getUserByUserId")
    @ResponseBody
    public  User getUserByUserId(Integer user_id) {
        List<User> list=userService.getUserByUserId(user_id);
        if(list.size()==0){
            return null;
        }
        return list.get(0);
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public  Integer updateUser(User user) {
        System.out.println(user);
        int num =userService.updateUser(user);
        System.out.println(num);
        return num;
    }

    @RequestMapping("/loginOut")
    public @ResponseBody
      Integer     loginOut(HttpSession session) {
                session.removeAttribute("adminIsLogin");
                 return 1;

        }





}
