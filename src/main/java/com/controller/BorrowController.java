package com.controller;

import com.pojo.*;

import com.service.BookService;
import com.service.BorrowService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/borrow")
public class BorrowController {
    @Autowired
    BorrowService borrowService;
    @Autowired
    UserService userService;
    @Autowired
    BookService bookService;

    /**
     * @Author tangxiangan
     * @Description //TODO 如果卡号正确，借阅后插入向图书借阅表插入信息，同时更新库存，否则返回-1
     * @Date 15:58 2019/1/7
     * @Param [borrow]
     * @return java.lang.Integer
     **/
    @RequestMapping("/insertBorrow") //映射路径
    public @ResponseBody Integer insertBorrow(Borrow borrow) {
      return  borrowService.insertBorrow(borrow);

    }

    /**
    *
     * @Author tangxiangan
     * @Description //TODO 还书
     * @Date 16:00 2019/1/7
     * @Param [borrow]
     * @return java.lang.Integer
     **/
    @RequestMapping("/returnBook") //映射路径
    public @ResponseBody  Integer returnBook(Borrow borrow, HttpServletResponse response) {

        return borrowService.returnBook(borrow);

    }

    /**
     * @Author tangxiangan
     * @Description //TODO  借阅信息查询
     * @Date 16:09 2019/1/7
     * @Param [pageBean, borrow]
     * @return com.pojo.PageBean<com.pojo.Borrow>
     **/
    @RequestMapping("/listBorrows")
    @ResponseBody
    PageBean<ReturnBookVO> listBorrows(PageBean<ReturnBookVO> pageBean, Borrow borrow, String tag, HttpServletRequest request) {
        if ("user".equals(tag)){
          User user=  (User)request.getSession().getAttribute("userLogin");
           borrow.setUser_id(user.getUser_id());
        }
         PageBean<ReturnBookVO>   borrowPageBean =borrowService.listBorrows(pageBean,borrow);
        System.out.println(borrowPageBean.getData().get(0).getLend_time());
        return borrowPageBean;
    }

    @RequestMapping("/listBorrowsForUsers")
    String listBorrowsForUsers(HttpServletRequest request,int currPage) {
        Borrow borrow=new Borrow();
        User user=  (User)request.getSession().getAttribute("userLogin");
        borrow.setUser_id(user.getUser_id());
        PageBean<ReturnBookVO> pageBean=new PageBean<ReturnBookVO>();
        pageBean.setCurrPage(currPage);
        pageBean.setPageSize(5);
        PageBean<ReturnBookVO>   borrowPageBean =borrowService.listBorrowsForUsers(pageBean,borrow);
        request.getSession().setAttribute("borrowList",borrowPageBean);
        return "jsp/user_borrow_history";
    }

    }

