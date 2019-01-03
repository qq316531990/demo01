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

    /**
     * 查询图书(所有,上架,未上架)
     * @return
     */
    public List<Book> queryAll( int begin ,int pageSize) {
        return bookMapper.selectAll(begin,pageSize);
    }
    public List<Book> queryAllByTag1( int begin ,int pageSize) {
        return bookMapper.selectAllByTag1(begin,pageSize);
    }
    public List<Book> queryAllByTag0( int begin ,int pageSize) {
        return bookMapper.selectAllByTag0(begin,pageSize);
    }

    /**
     * 查询数量(..;..;..)
     * @return
     */
    public int countAll(){
        return bookMapper.selectAllCount();
    }
    public int countByTag1(){
        return bookMapper.selectAllByTag1Count();
    }
    public int countByTag0(){
        return bookMapper.selectAllByTag0Count();
    }


    /**
     * 选择查询
     * @param book
     * @return
     */
    public List<Book> queryByCondition(Book book ,int begin ,int pageSize) {
        return bookMapper.findByCondition(book,begin,pageSize);
    }

    public int countByCondition(){
        return bookMapper.selectCountByCondition();
    }
}
