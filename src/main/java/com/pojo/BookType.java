package com.pojo;

public class BookType {

    private  int bookId;
    private  int typeId;

    public BookType(int bookId, int typeId) {
        this.bookId = bookId;
        this.typeId = typeId;
    }

    public BookType() {
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }
}
