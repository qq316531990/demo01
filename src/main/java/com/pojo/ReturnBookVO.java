package com.pojo;

import java.util.Date;

public class ReturnBookVO {
    private int borrow_id;
    private int user_id;
    private int book_id;
    private Date lend_time;
    private Date return_time;
    private Date actual_return_time;
    private String book_name;
    private Double book_price;
    private String user_name;
    private String book_author;
    private String book_image;

    public int getBorrow_id() {
        return borrow_id;
    }

    public void setBorrow_id(int borrow_id) {
        this.borrow_id = borrow_id;
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

    public Date getLend_time() {
        return lend_time;
    }

    public void setLend_time(Date lend_time) {
        this.lend_time = lend_time;
    }

    public Date getReturn_time() {
        return return_time;
    }

    public void setReturn_time(Date return_time) {
        this.return_time = return_time;
    }

    public Date getActual_return_time() {
        return actual_return_time;
    }

    public void setActual_return_time(Date actual_return_time) {
        this.actual_return_time = actual_return_time;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public Double getBook_price() {
        return book_price;
    }

    public void setBook_price(Double book_price) {
        this.book_price = book_price;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getBook_author() {
        return book_author;
    }

    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }

    public String getBook_image() {
        return book_image;
    }

    public void setBook_image(String book_image) {
        this.book_image = book_image;
    }
}
