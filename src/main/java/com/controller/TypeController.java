package com.controller;

import com.pojo.*;
import com.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/type")
public class TypeController {
    @Autowired
    TypeService typeService;
    /**
    *
     * @Author tangxiangan
     * @Description //TODO 获得所有的一级分类
     * @Date 9:46 2019/1/11
     * @Param [request]
     * @return java.util.List<com.pojo.Type>
     **/
    @RequestMapping("/getAllType")
    @ResponseBody
    public List<Type> list(HttpServletRequest request) {
        List<Type> list = typeService.getList();
        for (Type type : list
        ) {
            System.out.println(type);
        }
        request.getSession().setAttribute("list1", list);
        return list;
    }


    @RequestMapping("/listTypes") //映射路径
    public @ResponseBody
    PageBean<Type> listTypes(PageBean<Type> pageBean, Type type) throws Exception {
        String type_name = new String(type.getType_name().getBytes("ISO-8859-1"), "utf-8");
        type.setType_name(type_name);
        PageBean<Type> typePageBean = typeService.listTypes(pageBean, type);
        return typePageBean;
    }


    @RequestMapping("/deleteTypes")
    @ResponseBody
    public Integer deleteTypes(Integer[] type_id) {
        System.out.println(type_id.length);
        Integer num = typeService.deleteTypes(type_id);
        return num;
    }


    @RequestMapping("/getTypeByTypeId")
    @ResponseBody
    public Type getTypeByTypeId(Integer type_id) {
        List<Type> list = typeService.getTypeByTypeId(type_id);
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }


    @RequestMapping("/updateType")
    @ResponseBody
    public Integer updateType(Type type) {
        int num = typeService.updateType(type);
        return num;
    }


    @RequestMapping("/insertType")
    public @ResponseBody
    Type insertType(String type_name) {

        List<Type> list = typeService.getTypeByTypeName(type_name);
        if (list.size() == 0) {
            Type type = new Type();
            type.setType_name(type_name);
            typeService.insertType(type);
            return null;

        }
        return list.get(0);
    }


    @RequestMapping("/listTypeStatistics")
    public @ResponseBody
    List<StatisticsVO> listTypeStatistics() {
        List<StatisticsVO> list=typeService.listTypeStatistics();
        return list;
    }

    @RequestMapping("/listSecondTypeStatistics")
    public @ResponseBody
    List<StatisticsVO> listSecondTypeStatistics() {
        List<StatisticsVO> list=typeService.listSecondTypeStatistics();
        return list;
    }

    @RequestMapping("/listLastMonthSecondTypeStatistics")
    public @ResponseBody
    List<StatisticsVO> listLastMonthSecondTypeStatistics() {
        List<StatisticsVO> list=typeService.listLastMonthSecondTypeStatistics();
        return list;
    }



    @RequestMapping("/listLastMonthBorrowStatistics")
    public @ResponseBody
    List<StatisticsVO> listLastMonthBorrowStatistics() {
        List<StatisticsVO> list=typeService.listLastMonthBorrowStatistics();
        return list;
    }
}
