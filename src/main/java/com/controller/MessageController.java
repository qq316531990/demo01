package com.controller;

import com.pojo.*;
import com.service.*;
import com.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageService messageService;
    @Autowired
    private BookService bookService;
    @Autowired
    private UserService userService;
    @Autowired
    private BorrowService borrowService;
    @Autowired
    private CommentService commentService;



    int i=0;

    public Message getMessage(HttpServletRequest request,  String s, String tag) {
        Message msg = new Message();
        int bookId=0;
        if(request.getSession().getAttribute("borrow")!=null){
            Borrow borrow=(Borrow) request.getSession().getAttribute("borrow");
            bookId=borrow.getBook_id();
            msg.setUserId(borrow.getUser_id());
        }else{
            bookId=Integer.parseInt(request.getParameter("bookId"));
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
        String d1 = sdf.format(new Date());
        msg.setBookId(bookId);
        //消息产生时设置时间
        try {
            msg.setMessageTime(sdf.parse(d1));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //0:预约消息,1:借阅消息(预约成功等) 2:还书提醒消息 3:超时提醒 4:评论消息
//        if (s == "add" && tag == "0") {
//            msg.setUserId(user.getUser_id());
//            msg.setMessageContent(bookService.queryById(bookId).getBookName()+" : 您于"
//                    + d1
//                    + "成功预约"
//                    + bookService.queryById(bookId).getBookName()
//                    + ", 请于第二日21时之前取书, 未按时取书将影响您的信誉及之后的体验,敬请留意."
//                    + "/n"
//                    + "取消预约请于2小时内进行,取消不会对您产生任何影响,感谢您的使用,谢谢!"
//                    + "                                                      By 某潜伏的书虫");
//            //0:预约消息,1:借阅消息(预约成功等) 2:还书提醒消息 3:评论消息
//            msg.setMessageType(0);
//            //0:未读,1:已读
//            msg.setMessageState(0);
//        }

        //借书成功消息
        if (s == "add" && tag.equals("1") ) {


            Date date=new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.DAY_OF_MONTH, 30);
            date = calendar.getTime();
            String ralTime=sdf2.format(date);
            msg.setMessageContent(bookService.queryById(bookId).getBookName()+":       您于"
                    + d1
                    + "在我馆成功借得《"
                    + bookService.queryById(bookId).getBookName()
                    + "》, 请于"
                    +ralTime
                    +" 21:00 之前还书, 未按时还书将影响您的信誉 ,且逾期当天开始每天将扣除1%押金,敬请留意."
                    + "/n"
                    + "归还日三天起将每天发送提醒消息,请注意查收,谢谢!" + "/n"
                    + "                                                     By 某潜伏的书虫");
            //0:预约消息,1:借阅消息(预约成功等) 2:还书提醒消息 3:超时提醒  4:评论消息
            msg.setMessageType(1);
            //0:未读,1:已读
            msg.setMessageState(0);

        }



        return msg;
    }

    public void test1(){

        Message message =new Message();
        message.setUserId(16);
        message.setMessageContent("定时任务测试");

        messageService.addMessage(message);
    }


    /**
     * 定时任务:归还日前三天(1:00触发);
     *     若未还书,之后每天同时间触发
     */
    @Transactional(rollbackFor = Exception.class)
    public void sendMessage(){
        List<Borrow> list1=borrowService.queryAllUnReturn();
        Message msg = new Message();
        msg.setMessageState(0);
        Date date=new Date();
        msg.setMessageTime(date);
        //获取三天前的时间
        Calendar calendar1 = Calendar.getInstance();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
        calendar1.add(Calendar.DATE, -3);
        Date three_days_ago =calendar1.getTime();
        //String three_days_ago = sdf1.format(calendar1.getTime());
        if(list1.size()>0){
            for (Borrow borrow1: list1 ) {
                //当前时间晚与应归还时间,已逾期
                if(borrow1.getReturn_time().before(date)){
                    msg.setUserId(borrow1.getUser_id());
                    msg.setBookId(borrow1.getBook_id());
                    msg.setMessageContent("  您借阅的《"
                            + bookService.queryById(borrow1.getBook_id()).getBookName()
                            + "》已超时,为了不产生更多的费用,请尽快归还"
                            + "By 某潜伏的书虫");
                    //0:预约消息,1:借阅消息(预约成功等) 2:还书提醒消息 3:超时提醒 4:评论消息
                    msg.setMessageType(3);


                }//当前时间晚于要归还前三天,即将到期
                else if(three_days_ago.before(date)){
                    msg.setUserId(borrow1.getUser_id());
                    msg.setBookId(borrow1.getBook_id());
                    msg.setMessageContent("  您借阅的《"
                            + bookService.queryById(borrow1.getBook_id()).getBookName()
                            + "》即将到期, 为了不产生费用及影响您今后的使用,请尽快归还"
                            + "By 某潜伏的书虫");
                    //0:预约消息,1:借阅消息(预约成功等) 2:还书提醒消息 3:超时提醒 4:评论消息
                    msg.setMessageType(2);
                }
            }
            messageService.addMessage(msg);
        }

    }

    /**
     * 添加消息
     * @param request
     */
    @RequestMapping("/addMessage")
    public void addMessage(HttpServletRequest request,String tag){

        if(tag==null){
            tag=request.getParameter("tag");
        }

        i=messageService.addMessage(getMessage(request,"add",tag));

    }


    /**
     * 修改,
     * @param
     * @return
     */
    @RequestMapping("/updateMessage")
    public ModelAndView messageUpdate(HttpServletRequest request){
        int msgId=Integer.parseInt(request.getParameter("messageId"));
        Message message=new Message();
        message.setMessageId(msgId);
        message.setMessageState(1);
        i=messageService.updateMessage(message);
        User user = (User) request.getSession().getAttribute("userLogin");
        int j=messageService.selectUnreadCount(user.getUser_id());
        request.getSession().setAttribute("unRead",j);
        return listUser(request);
    }


//    @ResponseBody
//    @RequestMapping("/unreadMessage")
//    public ModelAndView unreadMessage(HttpServletRequest request){
//        User user = (User) request.getSession().getAttribute("userLogin");
//        int j=messageService.selectUnreadCount(user.getUser_id());
//        return null;//返回个人主页,在主页上显示未读数
//    }

    /**
     * 个人消息
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/selectMessageForUser")
    public ModelAndView listUser(HttpServletRequest request){
        ModelAndView mav1=new ModelAndView();
        List<Message> list;
        //获取当前登录的用户对象
        User user = (User) request.getSession().getAttribute("userLogin");
        int userId=user.getUser_id();
        int pageSize = 5;		 //每页大小
        int currentPage =1;     //当前页
        int totalNum=messageService.queryCountById(userId);    //总条数
        String cp = request.getParameter("cp");
        currentPage = cp != null ? Integer.parseInt(cp) : 1;
        PageUtils<Message> pu;
        pu= new PageUtils<Message>(currentPage, pageSize, totalNum);
        list=messageService.queryById(userId,(pu.getCurrentPage()-1)  * pu.getPageSize(), pu.getPageSize());
        //查询未读的消息数
        int unreadCount=messageService.selectUnreadCount(userId);
        pu.setList(list);
        if(user.getPermission_id()==6){
            mav1.setViewName("jsp/myMessageForAdmin");
        }else{
            mav1.setViewName("jsp/myMessage");
        }

        mav1.addObject("pu",pu);
        mav1.addObject("unreadCount",unreadCount);
        return mav1;
    }

    /**
     * 消息管理
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/selectMessageForManege")
    public ModelAndView listAdmin(HttpServletRequest request){
        ModelAndView mav2 = new ModelAndView();
        Message message1=new Message();
        List<Message> list;
        List<MessageAdmin> list1=new ArrayList<MessageAdmin>();
        int pageSize = 5;		//每页大小
        int currentPage =1;    //当前页
        int totalNum=0;   //总条数
        String cp = request.getParameter("cp");
        //获取标记,看是否第一次进入页面
        String tab=request.getParameter("tab");
        currentPage = cp != null ? Integer.parseInt(cp) : 1;
        PageUtils<MessageAdmin> pu;


        if(tab ==null) {

            totalNum=messageService.queryAllCount();
            pu= new PageUtils<MessageAdmin>(currentPage, pageSize, totalNum);
            list = messageService.queryAllMessage((pu.getCurrentPage()-1)  * pu.getPageSize(), pu.getPageSize());


        }else{
            if(request.getParameter("bookId")!=""){
                message1.setBookId(Integer.parseInt(request.getParameter("bookId")));
            }
            if(request.getParameter("userId")!=""){
                message1.setUserId(Integer.parseInt(request.getParameter("userId")));
            }
            totalNum=messageService.selectCountByCondition(message1);
            pu= new PageUtils<MessageAdmin>(currentPage, pageSize, totalNum);
            list = messageService.selectByCondition(message1, (pu.getCurrentPage()-1)  * pu.getPageSize(), pu.getPageSize());
        }
        for (int i=0;i<list.size();i++ ) {
            MessageAdmin msga=new MessageAdmin();
//            List<MessageAdmin> list1=new ArrayList<MessageAdmin>();
            msga.setMessageId(list.get(i).getMessageId());
            msga.setBookName(bookService.queryById(list.get(i).getBookId()).getBookName());
            msga.setMessageContent(list.get(i).getMessageContent());

            msga.setMessageState(list.get(i).getMessageState());
            msga.setMessageTime(list.get(i).getMessageTime());
            msga.setMessageType(list.get(i).getMessageType());
            msga.setUserName(userService.getUserByUserId(list.get(i).getUserId()).get(0).getUser_name());
            list1.add(i,msga);
            System.out.println(msga);
        }
        pu.setList(list1);

        mav2.setViewName("jsp/message");
        mav2.addObject("pu", pu);
        return mav2;
    }

}
