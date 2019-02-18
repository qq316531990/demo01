package com.service.impl;


import com.dao.BookMapper;
import com.dao.BorrowDao;
import com.dao.UserDao;
import com.pojo.*;
import com.service.BorrowService;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class BorrowServiceImpl implements BorrowService {

    @Resource
    private BorrowDao borrowDao;
    @Resource
    private UserDao userDao;
    @Resource
    private  BookMapper bookMapper;
    /**
    *
     * @Author tangxiangan
     * @Description // TODO 分页查询
     * @Date 15:44 2019/1/7
     * @Param [pageBean, borrow]
     * @return com.pojo.PageBean<com.pojo.Borrow>
     **/
    public PageBean<ReturnBookVO> listBorrows(PageBean<ReturnBookVO> pageBean, Borrow borrow) {
        Map map=new HashMap();
        System.out.println(borrow);
        map.put("isReturnBook",1);//如果是还书的话，查询来的信息是实际归还时间为空的数据（即尚未归还的书籍）
        map.put("borrow", borrow);
        pageBean.setCount(borrowDao.countBorrows(map));
        map.put("startIndex",pageBean.getStartIndex());
        map.put("pageSize",pageBean.getPageSize());
        pageBean.setData(borrowDao.listBorrows(map));
        return pageBean;
    }
    public PageBean<ReturnBookVO> listBorrowsForUsers(PageBean<ReturnBookVO> pageBean, Borrow borrow) {
        Map map=new HashMap();
        System.out.println(borrow);
        map.put("borrow", borrow);
        pageBean.setCount(borrowDao.countBorrows(map));
        map.put("startIndex",pageBean.getStartIndex());
        map.put("pageSize",pageBean.getPageSize());
        pageBean.setData(borrowDao.listBorrows(map));
        return pageBean;
    }
    /**
    *
     * @Author tangxiangan
     * @Description //TODO 还书
     * @Date 15:48 2019/1/7
     * @Param [borrow]
     * @return int
     **/
    public int returnBook(Borrow borrow) {
        bookMapper.updateBookBorrowNumber(borrow.getBook_id());//更新书的借阅次数
        bookMapper.updateBookCount(1,borrow.getBook_id());//更新书的库存
        Date actual_return_time=new Date();
        borrow.setActual_return_time(actual_return_time);
        int count=borrowDao.updateBorrow(borrow);//更新实际归还时间
        return count;
    }

    public List<Borrow> queryAllUnReturn() {
        return borrowDao.queryAllUnReturn();
    }

    /**
     * @Author tangxiangan
     * @Description //TODO 借阅
     * @Date 15:49 2019/1/7
     * @Param [borrow]
     * @return int
     **/
    public int insertBorrow(Borrow borrow) {
        List<User> list=userDao.getUserByUserId(borrow.getUser_id());
        Book book=new Book();
        book.setBookId(borrow.getBook_id());
        List<Book> bookList=bookMapper.findByCondition(book,0,1);
        if(bookList.get(0).getBookCount()<1){
            return -2;
        }
        else if(list.size()==0){
            return -1;
        }else {
            Calendar current = Calendar.getInstance();//
            current.add(Calendar.MONTH, 1);
            Date return_time = current.getTime();//
            borrow.setLend_time(new Date());
            borrow.setReturn_time(return_time);
            bookMapper.updateBookCount(-1,borrow.getBook_id());
            int count = borrowDao.insertBorrow(borrow);
            return  count;
        }
    }
}

