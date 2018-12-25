package com.controller;

import com.pojo.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    User login(HttpSession session, Model model, String user_name, String pwd) throws Exception {
        System.out.println(pwd);
        List<User> list = userService.login(user_name);
        if (list.size() == 0) {
            model.addAttribute("result", "0");//该用户不存在
        } else {

            if (list.get(0).getPwd().equals(pwd)) {
                session.setAttribute("user", list.get(0));
                //将用户保存在session里面
                return list.get(0);
            } else {
                return null;
            }


        }
        return null;
    }

    @RequestMapping("/register")
    public @ResponseBody
    User register(HttpSession session, HttpServletResponse response, Model model, String phone, String pwd, String user_name) throws Exception {
        System.out.println(pwd);
        System.out.println(phone);
        System.out.println(user_name);
        List<User> list=userService.login(user_name);
        if (list.size()==0){
            User user=new User();
            user.setUser_name(user_name);
            user.setPhone(phone);
            user.setPwd(pwd);
            user.setCredibility(100);
            user.setBalance(0);
            user.setPermission_id(1);
            userService.insertUser(user);
            return null;
        }
        return list.get(0);



    }
}
