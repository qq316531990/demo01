package com.pojo;

import java.util.Date;

public class Message {
    private Integer messageId;

    private Integer userId;

    private String messageContent;

    private Integer messageType;

    private Date messageTime;

    private Integer messageState;

    private Integer bookId;

    public Message() {
    }

    public Message(Integer messageId, Integer userId, String messageContent, Integer messageType, Date messageTime, Integer messageState, Integer bookId) {
        this.messageId = messageId;
        this.userId = userId;
        this.messageContent = messageContent;
        this.messageType = messageType;
        this.messageTime = messageTime;
        this.messageState = messageState;
        this.bookId = bookId;
    }

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public Integer getMessageType() {
        return messageType;
    }

    public void setMessageType(Integer messageType) {
        this.messageType = messageType;
    }

    public Date getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(Date messageTime) {
        this.messageTime = messageTime;
    }

    public Integer getMessageState() {
        return messageState;
    }

    public void setMessageState(Integer messageState) {
        this.messageState = messageState;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    @Override
    public String toString() {
        return "Message{" +
                "messageId=" + messageId +
                ", userId=" + userId +
                ", messageContent='" + messageContent + '\'' +
                ", messageType=" + messageType +
                ", messageTime=" + messageTime +
                ", messageState=" + messageState +
                ", bookId=" + bookId +
                '}';
    }
}