package com.service.impl;

import com.dao.BookMapper;
import com.pojo.Book;
import com.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;


    public int addBook(Book book) {
        return bookMapper.insertSelective(book);
    }

    public int deleteBook(int book_id) {
        return bookMapper.deleteByPrimaryKey(book_id);
    }

    public int updateBook(Book book) {
        return bookMapper.updateByPrimaryKeySelective(book);
    }

    public int updateBookById(int bookId) {
        return bookMapper.updateById(bookId);
    }

    /**
     * 查询图书(所有,上架,未上架)
     * @return
     */
    public List<Book> queryAll( int begin ,int pageSize) {
        return bookMapper.selectAll(begin,pageSize);
    }

    /**
     * 查询热门书籍
     * @return
     */
    public List<Book> queryHotBook(int pageSize) {
        return bookMapper.selectHotBook(pageSize);
    }

    public List<Book> queryNewBook() {
        return bookMapper.selectNewBook();
    }

    public List<Book> queryMultiple() {
        return bookMapper.selectMultiple();
    }


    /**
     * 查询数量(..;..;..)
     * @return
     */
    public int countAll(){
        return bookMapper.selectAllCount();
    }

    public Book queryById(int bookId) {
        return bookMapper.selectByPrimaryKey(bookId);
    }


    /**
     * 选择查询
     * @param book
     * @return
     */
    public List<Book> queryByCondition(Book book ,int begin ,int pageSize) {
        return bookMapper.findByCondition(book,begin,pageSize);
    }

    public int countByCondition(Book book) {
        return bookMapper.selectCountByCondition(book);
    }

    public int updateBookCount(int i, int bookId) {
        return bookMapper.updateBookCount(i,bookId);
    }
}
