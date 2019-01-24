package com.controller;


import com.dao.CommentDao;
import com.pojo.Book;
import com.pojo.Comment;
import com.pojo.CommentCha;
import com.pojo.Message;
import com.service.BookService;
import com.service.CommentService;
import com.service.MessageService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("comment")
public class CommentController {
    @Autowired
    CommentService commentService;
    @Autowired
    BookService bookService;
    @Autowired
    UserService userService;
    @Autowired
    MessageService messageService;


    @RequestMapping("/find")
   public String find(ModelMap map,Integer index,Integer size){
                if (index==null){
                    index=1;
                }
            size=5;
       Integer page=(index-1)*size;
         int count=commentService.countComment();
        int total=count%size==0?count/size:count/size+1;
         List<Comment> list=commentService.find(page,size);
         map.put("list",list);
         map.put("page",page);
         map.put("index",index);
         map.put("total",total);
         return "jsp/commentFindAll";
     }

    @RequestMapping("/findHuiFu")
    public String findHuiFu(ModelMap map,Integer index,Integer size){
        if (index==null){
            index=1;
        }
        size=5;
        Integer page=(index-1)*size;
        int count=commentService.count();
        int total=count%size==0?count/size:count/size+1;
        List<Comment> listHf=commentService.findHuiFu(page,size);
        map.put("listHf",listHf);
        map.put("page",page);
        map.put("index",index);
        map.put("total",total);
        return "jsp/commentFindHuiFu";
    }

      @RequestMapping("/delete")
     public void delete(int comment_id){
         commentService.delete(comment_id);
     }

    @RequestMapping("/deleteComment")
    public void deleteComment(int[] comment_id) {
       for (int i=0;i<comment_id.length;i++){
           commentService.delete(comment_id[i]);
       }
    }

       @RequestMapping("/findOne")
     public String findOne(ModelMap map,int cx_id,Integer index,Integer size){
           if (index==null){
               index=1;
           }
           size=5;
           Integer page=(index-1)*size;
           int count=commentService.countComment();
           int total=count%size==0?count/size:count/size+1;
           List<Comment> listOne=commentService.findOne(cx_id,page,size);
           map.put("listOne",listOne);
           map.put("page",page);
           map.put("index",index);
           map.put("total",total);
         return "jsp/commentChaXun1";
       }

    @RequestMapping("/findTwo")
    public String findTwo(ModelMap map,int cx_id,Integer index,Integer size){
        if (index==null){
            index=1;
        }
        size=5;
        Integer page=(index-1)*size;
        int count=commentService.count();
        int total=count%size==0?count/size:count/size+1;
        List<Comment> listTwo=commentService.findTwo(cx_id,page,size);
        map.put("listTwo",listTwo);
        map.put("page",page);
        map.put("index",index);
        map.put("total",total);
        return "jsp/commentChaXun2";
    }


       @RequestMapping("/findComment_id")
       public void findComment_id(ModelMap map,int comment_id){
         List<Comment> findComment_id=commentService.findComment_id(comment_id);
         map.put("findComment_id",findComment_id);
       }

       @RequestMapping("/findBook")
       public String findBook(ModelMap map,int book_id,Integer index,Integer size){
            if(index==null){
                index=1;
            }
           size=5;
           Integer page=(index-1)*size;
           List<CommentCha> list=commentService.findBook(book_id,page,size);
           int count=commentService.countComment();
           int total=count%size==0?count/size:count/size+1;
           List<Comment> huiFuList=commentService.huiFuList(book_id);
           Book book1=bookService.queryById(book_id);
           System.out.println("1231");
           System.out.println(book1.getBookName());
           map.put("book1",book1);
           map.put("huiFuList",huiFuList);
           map.put("list",list);
           map.put("page",page);
           map.put("index",index);
           map.put("total",total);
         return "jsp/commentBook";
       }

       @RequestMapping("/add")
       public Comment add(int user_id,int book_id,String comment_content,int comment_state){
             Comment c=new Comment();
             c.setUser_id(user_id);
             c.setBook_id(book_id);
             c.setComment_content(comment_content);
             c.setComment_state(comment_state);
             c.setComment_time(new Date());
             commentService.add(c);

            double avg = commentService.avg();
            System.out.println(avg);
            System.out.println("11111");
             Book book=new Book();
             book.setBookId(book_id);
             book.setBookStar(avg);
             bookService.updateBook(book);

             return c;
       }

       @RequestMapping("/updateDianZan")
       public void dianZan(int comment_id,int great_number){
           Comment c=new Comment();
           c.setComment_id(comment_id);
           c.setComment_great_number(great_number);
           commentService.dianZan(c);
       }

       @RequestMapping("/update")
       public void update(int comment_id,String comment_content,int comment_state){
           Comment c=new Comment();
           c.setComment_id(comment_id);
           c.setComment_content(comment_content);
           c.setComment_state(comment_state);
           commentService.update(c);
       }

       @RequestMapping("/huiFu")
       public void huiFu(int user_id,int book_id,int parent_comment_id,String comment_content){
           Comment c=new Comment();
           c.setUser_id(user_id);
           c.setBook_id(book_id);
           c.setParent_comment_id(parent_comment_id);
           c.setComment_content(comment_content);
           c.setComment_time(new Date());
           commentService.huiFu(c);
           /**
            * 将获取的回复消息发送给被回复人
            */
           List<Comment> parent =commentService.findComment_id(parent_comment_id);
           Comment parentComment=parent.get(0);
           String commentContent=comment_content;
           int parentUserId=parentComment.getUser_id();
           String userName=userService.getUserByUserId(parentUserId).get(0).getUser_name();
           Message msg = new Message();
           msg.setBookId(book_id);
           msg.setUserId(parentUserId);
           msg.setMessageContent(parentComment.getComment_content()+ " //  " +userName+"  //  " +commentContent);
           msg.setMessageType(4);
           msg.setMessageState(0);
           msg.setMessageTime(new Date());
           messageService.addMessage(msg);
       }


       @RequestMapping("/plList")
    public String plList(ModelMap map,int user_id){
         List<CommentCha> plList=commentService.plList(user_id);
         map.put("plList",plList);
         return "jsp/myComment";
       }


    @RequestMapping("/findBook1")
    public String findBook1(ModelMap map,int book_id,Integer index,Integer size){
        if(index==null){
            index=1;
        }
        size=5;
        Integer page=(index-1)*size;
        List<CommentCha> list=commentService.findBook1(book_id);
        int count=commentService.countComment();
        int total=count%size==0?count/size:count/size+1;
        List<Comment> huiFuList=commentService.huiFuList(book_id);
        Book book1=bookService.queryById(book_id);
        System.out.println("1231");
        System.out.println(book1.getBookName());
        map.put("book1",book1);
        map.put("huiFuList",huiFuList);
        map.put("list",list);
        map.put("page",page);
        map.put("index",index);
        map.put("total",total);
        return "jsp/book_detail";
    }

    @RequestMapping("/countHuiFu")
    public int countHuiFu(int comment_id){
        int count=0;
        count=commentService.countHuiFu(comment_id);
        return count;
    }

}
