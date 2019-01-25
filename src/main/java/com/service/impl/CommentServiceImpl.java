package com.service.impl;


import com.dao.CommentDao;
import com.pojo.Book;
import com.pojo.Comment;
import com.pojo.CommentCha;
import com.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("CommentService")
public class CommentServiceImpl implements CommentService{
    @Autowired
    CommentDao commentDao;
    /*查询出所有对书籍的评论内容*/
    public List<Comment> find(Integer page,Integer size){
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("page",page);
        map.put("size",size);
        List<Comment> list=commentDao.find(map);
        return list;
    }
    /*查询出所有的回复评论*/
    public List<Comment> findHuiFu(Integer page,Integer size) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("page",page);
        map.put("size",size);
        List<Comment> list=commentDao.findHuiFu(map);
        return list;
    }
    /*统计回复评论的数量*/
    public int count(){
        int count=commentDao.count();
        return count;
    }
    /*统计书籍评论的数量*/
    public int countComment() {
        int count=commentDao.countComment();
        return count;
    }
    /*统计对应comment_id的回复评论数量*/
    public int countHuiFu(int comment_id) {
        return commentDao.countHuiFu(comment_id);
    }
    /*删除对应comment_id的评论*/
    public int delete(int comment_id){
        int count=commentDao.delete(comment_id);
        return count;
    }
    /*统计对应book_id的书籍评论数量*/
    public int countP(int book_id) {
        return commentDao.countP(book_id);
    }
    /*根据user_id或book_id，查询出对书籍的评论*/
    public List<Comment> findOne(int cx_id,Integer page,Integer size) {
        Map<String,Object> map=new HashMap<String, Object>();
       map.put("cx_id",cx_id);
        map.put("page",page);
        map.put("size",size);
         List<Comment> list=commentDao.findOne(map);
        return list;
    }
    /*根据user_id或parent_comment_id，查询出回复的评论*/
    public List<Comment> findTwo(int cx_id,Integer page,Integer size) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("cx_id",cx_id);
        map.put("page",page);
        map.put("size",size);
        List<Comment> list=commentDao.findTwo(map);
        return list;
    }
    /*查询对应的comment_id的信息*/
    public List<Comment> findComment_id(int comment_id) {
        List<Comment> list=commentDao.findComment_id(comment_id);
        return list;
    }
    /*查询对应book_id的图书信息*/
    public Book findBook_id(int book_id) {
        return commentDao.findBook_id(book_id);
    }
    /*查询出对应book_id的所有对书籍的评论，分页*/
    public List<CommentCha> findBook(int book_id,Integer page,Integer size) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("page",page);
        map.put("size",size);
        map.put("book_id",book_id);
        List<CommentCha> list=commentDao.findBook(map);
        return list;
    }
    /*查询出对应book_id的所有对书籍的评论*/
    public List<CommentCha> findBook1(int book_id) {
        List<CommentCha> list=commentDao.findBook1(book_id);
        for(CommentCha count: list){
           int count1= commentDao.countHuiFu(count.getComment_id());
           count.setCount(count1);
        }
        return list;
    }
    /*添加书籍评论*/
    public void add(Comment c) {
        commentDao.add(c);
    }
    /*点赞后，更新点赞数量*/
    public void dianZan(Comment c) {
        commentDao.dianZan(c);
    }
    /*更改评论信息*/
    public void update(Comment c) {
        commentDao.update(c);
    }
    /*添加回复信息*/
    public void huiFu(Comment c) {
        commentDao.huiFu(c);
    }
    /*查询出对应book_id的所有回复评论*/
    public List<Comment> huiFuList(int book_id) {
        List<Comment> huiFuList=commentDao.huiFuList(book_id);
        return huiFuList;
    }
    /*查询出对应user_id的所有评论，和图书名字*/
    public List<CommentCha> plList(int user_id) {
        List<CommentCha> plList=commentDao.plList(user_id);
        return plList;
    }
    /*查询出对应book_id的平均星星数量*/
    public double avg(int book_id) {
        return commentDao.avg(book_id);
    }

}
