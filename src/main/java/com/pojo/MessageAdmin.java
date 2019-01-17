package com.pojo;

import java.util.Date;

public class MessageAdmin {
    private Integer messageId;

    private String userName;

    private String messageContent;

    private Integer messageType;

    private Date messageTime;

    private Integer messageState;

    private String bookName;

    public MessageAdmin() {
    }

    public MessageAdmin(Integer messageId, String userName, String messageContent, Integer messageType, Date messageTime, Integer messageState, String bookName) {
        this.messageId = messageId;
        this.userName = userName;
        this.messageContent = messageContent;
        this.messageType = messageType;
        this.messageTime = messageTime;
        this.messageState = messageState;
        this.bookName = bookName;
    }

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    @Override
    public String toString() {
        return "MessageAdmin{" +
                "messageId=" + messageId +
                ", userName='" + userName + '\'' +
                ", messageContent='" + messageContent + '\'' +
                ", messageType=" + messageType +
                ", messageTime=" + messageTime +
                ", messageState=" + messageState +
                ", bookName='" + bookName + '\'' +
                '}';
    }
}
