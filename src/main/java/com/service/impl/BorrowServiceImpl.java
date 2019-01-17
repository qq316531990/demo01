package com.service.impl;

import com.dao.BorrowMapper;
import com.pojo.Borrow;
import com.pojo.Message;
import com.service.BookService;
import com.service.BorrowService;
import com.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BorrowServiceImpl implements BorrowService {

    @Autowired
    private BorrowMapper borrowMapper;
    @Autowired
    private MessageService messageService;
    @Autowired
    private BookService bookService;



    public int addBorrowReturn(int bookId, Message message) {

        return 0;
    }

    public int updateBorrowReturn(Borrow borrow) {
        return 0;
    }

    public List<Borrow> queryById(int id) {
        return null;
    }

    public List<Borrow> queryAllBorrow() {
        return null;
    }

    public List<Borrow> queryAllUnReturn() {
        return borrowMapper.queryAllUnReturn();
    }

}
