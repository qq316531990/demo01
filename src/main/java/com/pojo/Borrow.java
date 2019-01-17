package com.pojo;

import java.util.Date;

public class Borrow {
    private Integer borrowId;

    private Integer userId;

    private Integer bookId;

    private Date lendTime;

    private Date returnTime;

    private Date actualReturnTime;

    public Borrow(){

    }

    public Borrow(Integer borrowId, Integer userId, Integer bookId, Date lendTime, Date returnTime, Date actualReturnTime) {
        this.borrowId = borrowId;
        this.userId = userId;
        this.bookId = bookId;
        this.lendTime = lendTime;
        this.returnTime = returnTime;
        this.actualReturnTime = actualReturnTime;
    }

    @Override
    public String toString() {
        return "Borrow{" +
                "borrowId=" + borrowId +
                ", userId=" + userId +
                ", bookId=" + bookId +
                ", lendTime=" + lendTime +
                ", returnTime=" + returnTime +
                ", actualReturnTime=" + actualReturnTime +
                '}';
    }

    public Integer getBorrowId() {
        return borrowId;
    }

    public void setBorrowId(Integer borrowId) {
        this.borrowId = borrowId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Date getLendTime() {
        return lendTime;
    }

    public void setLendTime(Date lendTime) {
        this.lendTime = lendTime;
    }

    public Date getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(Date returnTime) {
        this.returnTime = returnTime;
    }

    public Date getActualReturnTime() {
        return actualReturnTime;
    }

    public void setActualReturnTime(Date actualReturnTime) {
        this.actualReturnTime = actualReturnTime;
    }
}