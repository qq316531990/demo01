package com.service;

import com.pojo.Book;
import com.pojo.Comment;

import java.util.List;
import java.util.Map;

public interface CommentService {
    public List<Comment> find(Integer page,Integer size);
    public List<Comment> findHuiFu(Integer page,Integer size);
    public int count();
    public int countComment();
    public int delete(int comment_id);
    public List<Comment> findOne(int cx_id,Integer page,Integer size);
    public List<Comment> findTwo(int cx_id,Integer page,Integer size);
    public List<Comment> findComment_id(int comment_id);
    public Book findBook_id(int book_id);
    public List<Comment> findBook(int book_id,Integer page,Integer size);
    public void add(Comment c);
    public void dianZan(Comment c);
    public void update(Comment c);
    public void huiFu(Comment c);
    public List<Comment> huiFuList(int book_id);
    public List<Comment> plList(int user_id);
    public double avg();

}
