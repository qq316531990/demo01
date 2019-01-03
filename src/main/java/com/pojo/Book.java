package com.pojo;



public class Book {
    private Integer bookId;

    private String bookName;

    private String bookAuthor;

    private String bookPublishedInformation;

    private Integer bookCount;

    private String bookDescription;

    private String bookImage;

    private Integer bookTag;

    private Double bookPrice;

    private Integer bookBorrowingNumber;

    private Double bookStar;

    private Integer bookCommentNumber;

    public Book() {
    }

    public Book(Integer bookId, String bookName, String bookAuthor, String bookPublishedInformation, Integer bookCount, String bookDescription, String bookImage, Integer bookTag, Double bookPrice, Integer bookBorrowingNumber, Double bookStar, Integer bookCommentNumber) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPublishedInformation = bookPublishedInformation;
        this.bookCount = bookCount;
        this.bookDescription = bookDescription;
        this.bookImage = bookImage;
        this.bookTag = bookTag;
        this.bookPrice = bookPrice;
        this.bookBorrowingNumber = bookBorrowingNumber;
        this.bookStar = bookStar;
        this.bookCommentNumber = bookCommentNumber;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", bookPublishedInformation='" + bookPublishedInformation + '\'' +
                ", bookCount=" + bookCount +
                ", bookDescription='" + bookDescription + '\'' +
                ", bookImage='" + bookImage + '\'' +
                ", bookTag=" + bookTag +
                ", bookPrice=" + bookPrice +
                ", bookBorrowingNumber=" + bookBorrowingNumber +
                ", bookStar=" + bookStar +
                ", bookCommentNumber=" + bookCommentNumber +
                '}';
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookPublishedInformation() {
        return bookPublishedInformation;
    }

    public void setBookPublishedInformation(String bookPublishedInformation) {
        this.bookPublishedInformation = bookPublishedInformation;
    }

    public Integer getBookCount() {
        return bookCount;
    }

    public void setBookCount(Integer bookCount) {
        this.bookCount = bookCount;
    }

    public String getBookDescription() {
        return bookDescription;
    }

    public void setBookDescription(String bookDescription) {
        this.bookDescription = bookDescription;
    }

    public String getBookImage() {
        return bookImage;
    }

    public void setBookImage(String bookImage) {
        this.bookImage = bookImage;
    }

    public Integer getBookTag() {
        return bookTag;
    }

    public void setBookTag(Integer bookTag) {
        this.bookTag = bookTag;
    }

    public Double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Double bookPrice) {
        this.bookPrice = bookPrice;
    }

    public Integer getBookBorrowingNumber() {
        return bookBorrowingNumber;
    }

    public void setBookBorrowingNumber(Integer bookBorrowingNumber) {
        this.bookBorrowingNumber = bookBorrowingNumber;
    }

    public Double getBookStar() {
        return bookStar;
    }

    public void setBookStar(Double bookStar) {
        this.bookStar = bookStar;
    }

    public Integer getBookCommentNumber() {
        return bookCommentNumber;
    }

    public void setBookCommentNumber(Integer bookCommentNumber) {
        this.bookCommentNumber = bookCommentNumber;
    }
}