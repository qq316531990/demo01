package com.controller;

import com.pojo.Paper;
import com.pojo.Type;
import com.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/type")
public class TypeController {
    @Autowired
    TypeService typeService;
    @RequestMapping("/getAllType")
    public String list(HttpServletRequest request) {
        List<Type> list = typeService.getList();
        for (Type type:list
        ) {
            System.out.println(type);
        }
        request.getSession().setAttribute("list1", list);
        return "allPaper";
    }
}
