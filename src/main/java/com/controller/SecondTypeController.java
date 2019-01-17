package com.controller;

import com.pojo.PageBean;
import com.pojo.SecondType;
import com.pojo.SecondTypeView;
import com.pojo.Type;
import com.service.SecondTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/second")
public class SecondTypeController {
    @Resource
    SecondTypeService secondTypeService;

    @RequestMapping("/listTypes") //映射路径
    public @ResponseBody
    PageBean<SecondTypeView> listTypes(PageBean<SecondTypeView> pageBean, SecondTypeView secondTypeView) throws Exception{
        String type_name =new String(secondTypeView.getSecondType_name().getBytes("ISO-8859-1"),"utf-8");
        secondTypeView.setSecondType_name(type_name);
        PageBean<SecondTypeView>   typePageBean =secondTypeService.listTypes(pageBean,secondTypeView);
        return typePageBean;
    }

    @RequestMapping("/selectType2ById")
    @ResponseBody
    public  List<SecondTypeView> getType2ByTypeId(HttpServletRequest request,String  type_id) {
        List<SecondTypeView> list=secondTypeService.getType2ByTypeId(Integer.parseInt(type_id));
        if(list.size()==0){
            return null;
        }
        request.getSession().setAttribute("list2", list);
        return list;
    }

    @RequestMapping("/deleteTypes")
    @ResponseBody
    public Integer  deleteTypes(Integer[] secondType_id) {
        System.out.println(secondType_id.length);
        Integer num=  secondTypeService.deleteTypes(secondType_id);
        return num;
    }


    @RequestMapping("/getTypeByTypeId")
    @ResponseBody
    public  SecondTypeView getTypeByTypeId(Integer secondType_id) {
        List<SecondTypeView> list=secondTypeService.getTypeByTypeId(secondType_id);
        if(list.size()==0){
            return null;
        }
        return list.get(0);
    }


    @RequestMapping("/updateType")
    @ResponseBody
    public  Integer updateType(SecondType type) {
        int num =secondTypeService.updateType(type);
        return num;
    }


    @RequestMapping("/insertType")
    public @ResponseBody
    SecondTypeView insertType( String secondType_name,int type_id)  {

        List<SecondTypeView> list=secondTypeService.getTypeByTypeName(secondType_name);
        if (list.size()==0){
            SecondType type=new SecondType();
            type.setSecondType_name(secondType_name);
            type.setType_id(type_id);
            secondTypeService.insertType(type);
            return null;
        }
        return list.get(0);
    }
}
