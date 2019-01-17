package com.service;

import com.pojo.Borrow;
import com.pojo.PageBean;
import com.pojo.ReturnBookVO;
import com.pojo.Type;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface BorrowService {
      /**
       * @Author tangxiangan
       * @Description TODO 管理员当面借阅图书的方法
       * @Date 14:34 2019/1/7
       * @Param [borrow]
       * @return int
       **/
      int insertBorrow (Borrow borrow);

      /**
       * @Author tangxiangan
       * @Description TODO 归还图书的方法
       * @Date 14:36 2019/1/7
       * @Param [borrow]
       * @return int
       **/
      int returnBook (Borrow borrow);
      List<Borrow> queryAllUnReturn();
      /**
       * @Author tangxiangan
       * @Description //TODO 分页查询
       * @Date 15:43 2019/1/7
       * @Param [pageBean, borrow]
       * @return com.pojo.PageBean<com.pojo.Borrow>
       **/
      PageBean<ReturnBookVO> listBorrows(PageBean<ReturnBookVO> pageBean, Borrow borrow);
      PageBean<ReturnBookVO> listBorrowsForUsers(PageBean<ReturnBookVO> pageBean, Borrow borrow);
}
