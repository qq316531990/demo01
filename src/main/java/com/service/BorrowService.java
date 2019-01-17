package com.service;

import com.pojo.Borrow;
import com.pojo.Message;


import java.util.List;


public interface BorrowService {

    int addBorrowReturn(int bookId, Message message);



    int updateBorrowReturn(Borrow borrow);

    List<Borrow> queryById(int id);

    List<Borrow> queryAllBorrow();

    List<Borrow> queryAllUnReturn();

}
