package com.service;

import com.dao.CommentDao;
import com.pojo.Book;
import com.pojo.Comment;
import com.pojo.CommentCha;

import java.util.List;
import java.util.Map;

public interface CommentService {
    /*查询出所有对书籍的评论内容*/
    public List<Comment> find(Integer page,Integer size);
    /*查询出所有的回复评论*/
    public List<Comment> findHuiFu(Integer page,Integer size);
    /*统计回复评论的数量*/
    public int count();
    /*统计书籍评论的数量*/
    public int countComment();
    /*统计对应comment_id的回复评论数量*/
    public int countHuiFu(int comment_id);
    /*删除对应comment_id的评论*/
    public int delete(int comment_id);
    /*统计对应book_id的书籍评论数量*/
    public int countP(int book_id);
    /*根据user_id或book_id，查询出对书籍的评论*/
    public List<Comment> findOne(int cx_id,Integer page,Integer size);
    /*根据user_id或parent_comment_id，查询出回复的评论*/
    public List<Comment> findTwo(int cx_id,Integer page,Integer size);
    /*查询对应的comment_id的信息*/
    public List<Comment> findComment_id(int comment_id);
    /*查询对应book_id的图书信息*/
    public Book findBook_id(int book_id);
    /*查询出对应book_id的所有对书籍的评论，分页*/
    public List<CommentCha> findBook(int book_id, Integer page, Integer size);
    /*查询出对应book_id的所有对书籍的评论*/
    public List<CommentCha> findBook1(int book_id);
    /*添加书籍评论*/
    public void add(Comment c);
    /*点赞后，更新点赞数量*/
    public void dianZan(Comment c);
    /*更改评论信息*/
    public void update(Comment c);
    /*添加回复信息*/
    public void huiFu(Comment c);
    /*查询出对应book_id的所有回复评论*/
    public List<Comment> huiFuList(int book_id);
    /*查询出对应user_id的所有评论，和图书名字*/
    public List<CommentCha> plList(int user_id);
    /*查询出对应book_id的平均星星数量*/
    public double avg(int book_id);


}
