package com.service;

import com.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookService {

    /**
     * 添加图书
     * @param book
     * @return
     */
    int addBook(Book book);

    /**
     * 根据id删除图书
     * @param book_id
     * @return
     */
    int deleteBook(int book_id);

    /**
     * 修改图书信息
     * @param book
     * @return
     */
    int updateBook(Book book);

    /**
     * 查询所有图书
     * @return
     */
    List<Book> queryAll(int begin,int pageSize );

    /**
     * 查询热门/新/多评书籍
     * @return
     */
    List<Book> queryHotBook();
    List<Book> queryNewBook();
    List<Book> queryMultiple();



    /**
     * 查询总记录条数
     * @return
     */
    int countAll();


    /**
     * 选择性模糊查询
     * @param book
     * @return
     */
    List<Book> queryByCondition(Book book,int begin,int pageSize);

    /**
     * 条件查询记录数
     * @return
     */
    int countByCondition(Book book);

    Book queryById(int bookId);
    int updateBookCount(int i,int bookId);

}
