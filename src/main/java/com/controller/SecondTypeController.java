package com.controller;

import com.pojo.PageBean;
import com.pojo.SecondType;
import com.pojo.SecondTypeVO;
import com.pojo.Type;
import com.service.SecondTypeService;
import com.service.TypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/second")
public class SecondTypeController {
    @Resource
    SecondTypeService secondTypeService;
    @Resource
    TypeService typeService;
    /**
     * @Author tangxiangan
     * @Description //TODO 二级分类管理分页
     * @Date 10:43 2019/1/11
     * @Param [pageBean, secondTypeVO]
     * @return com.pojo.PageBean<com.pojo.SecondTypeVO>
     **/
    @RequestMapping("/listTypes") //映射路径
    public @ResponseBody
    PageBean<SecondTypeVO> listTypes(PageBean<SecondTypeVO> pageBean, SecondTypeVO secondTypeVO) throws Exception{
        String type_name =new String(secondTypeVO.getSecondType_name().getBytes("ISO-8859-1"),"utf-8");
        secondTypeVO.setSecondType_name(type_name);
        PageBean<SecondTypeVO>   typePageBean =secondTypeService.listTypes(pageBean, secondTypeVO);
        return typePageBean;
    }

    @RequestMapping("/getTypesForUser" ) //映射路径
    public String listTypes(HttpServletRequest request) throws Exception{
        List<SecondType> secondTypeList=secondTypeService.listAllTypes();
        List<Type> typeList=typeService.getList();
        Map map = new HashMap();
        map.put("typeList",typeList);
        map.put("secondTypeList",secondTypeList);
        request.getSession().setAttribute("typeList",typeList);
        request.getSession().setAttribute("secondTypeList",secondTypeList);
        return "jsp/user_index";
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
    public SecondTypeVO getTypeByTypeId(Integer secondType_id) {
        List<SecondTypeVO> list=secondTypeService.getTypeByTypeId(secondType_id);
        if(list.size()==0){
            return null;
        }
        return list.get(0);
    }


    @RequestMapping("/updateType")
    @ResponseBody
    public  Integer updateType(SecondType type) {

        System.out.println(type);
        int num =secondTypeService.updateType(type);
        return num;
    }


    @RequestMapping("/insertType")
    public @ResponseBody
    SecondTypeVO insertType(String secondType_name, int type_id)  {

        List<SecondTypeVO> list=secondTypeService.getTypeByTypeName(secondType_name);
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
