package com.pojo;

import java.util.Date;

public class Borrow {

    private int borrow_id;
    private int user_id;
    private int book_id;
    private Date lend_time;
    private Date return_time;
    private Date actual_return_time;

    @Override
    public String toString() {
        return "Borrow{" +
                "borrow_id=" + borrow_id +
                ", user_id=" + user_id +
                ", book_id=" + book_id +
                ", lend_time=" + lend_time +
                ", return_time=" + return_time +
                ", actual_return_time=" + actual_return_time +
                '}';
    }

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
}


