package com.pojo;

import java.util.Date;

public class CommentCha {
    private int comment_id;
    private int user_id;
    private int book_id;
    private int parent_comment_id;
    private String comment_content;
    private Date comment_time;
    private int comment_great_number;
    private int comment_state;
    private String book_name;
    private int count;

    public CommentCha() {
    }

    public CommentCha(int comment_id, int user_id, int book_id, int parent_comment_id, String comment_content, Date comment_time, int comment_great_number, int comment_state, String book_name,int count) {
        this.comment_id = comment_id;
        this.user_id = user_id;
        this.book_id = book_id;
        this.parent_comment_id = parent_comment_id;
        this.comment_content = comment_content;
        this.comment_time = comment_time;
        this.comment_great_number = comment_great_number;
        this.comment_state = comment_state;
        this.book_name = book_name;
        this.count=count;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getParent_comment_id() {
        return parent_comment_id;
    }

    public void setParent_comment_id(int parent_comment_id) {
        this.parent_comment_id = parent_comment_id;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public Date getComment_time() {
        return comment_time;
    }

    public void setComment_time(Date comment_time) {
        this.comment_time = comment_time;
    }

    public int getComment_great_number() {
        return comment_great_number;
    }

    public void setComment_great_number(int comment_great_number) {
        this.comment_great_number = comment_great_number;
    }

    public int getComment_state() {
        return comment_state;
    }

    public void setComment_state(int comment_state) {
        this.comment_state = comment_state;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
