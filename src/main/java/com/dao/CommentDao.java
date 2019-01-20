package com.dao;

import com.pojo.Book;
import com.pojo.Comment;

import java.util.List;
import java.util.Map;

public interface CommentDao {
    public List<Comment> find(Map<String,Object> map);
    public List<Comment> findHuiFu(Map<String,Object> map);
    public int count();
    public int countComment();
    public int delete(int comment_id);
    public List<Comment> findOne(Map<String,Object> map);
    public List<Comment> findTwo(Map<String,Object> map);
    public List<Comment> findBook(Map<String,Object> map);
    public void add(Comment c);
    public void dianZan(Comment c);
    public void update(Comment c);
    public List<Comment> findComment_id(int comment_id);
    public Book findBook_id(Integer book_id);
    public void huiFu(Comment c);
    public List<Comment> huiFuList(int book_id);
    public List<Comment> plList(int user_id);
}
