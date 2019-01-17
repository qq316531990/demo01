package com.pojo;

public class Comment {
    private int commentId;
    private int userId;
    private int bookId;
    private  int parentCommentId;
    private String commentContent;

    public Comment(int commentId, int userId, int bookId, int parentCommentId, String commentContent) {
        this.commentId = commentId;
        this.userId = userId;
        this.bookId = bookId;
        this.parentCommentId = parentCommentId;
        this.commentContent = commentContent;
    }

    public Comment() {
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getParentCommentId() {
        return parentCommentId;
    }

    public void setParentCommentId(int parentCommentId) {
        this.parentCommentId = parentCommentId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }
}
