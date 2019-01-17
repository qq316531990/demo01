package com.dao;

import com.pojo.Borrow;
import com.pojo.ReturnBookVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BorrowDao {
    /**
     * @Author tangxiangan
     * @Description // TODO 借阅图书
     * @Date 15:23 2019/1/7
     * @Param [borrow]
     * @return int
     **/
    int insertBorrow(@Param("borrow") Borrow borrow);
    /** @Author tangxiangan
     * @Description //TODO  更新借阅表
     * @Date 15:23 2019/1/7
     * @Param [borrow]
     * @return int
     **/
    int updateBorrow(@Param("borrow")Borrow borrow);
    /** @Author tangxiangan
     * @Description //TODO  借阅信息分页查询
     * @Date 15:24 2019/1/7
     * @Param []
     * @return java.util.List<com.pojo.Borrow>
     **/
    List<ReturnBookVO> listBorrows (Map map);
    /** @Author tangxiangan
     * @Description //TODO 分页查询计算总数
     * @Date 15:25 2019/1/7
     * @Param [map]
     * @return int
     **/
    int countBorrows(Map map);

    /**
     * 查询未归还图书
     * @return
     */
    List<Borrow> queryAllUnReturn();

}
