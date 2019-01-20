package com.dao;


import com.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    /**
     * 根据图书id删除图书(逻辑)
     * @param bookId
     * @return
     */
    int deleteByPrimaryKey(Integer bookId);

    /**
     * 添加图书
     * @param record
     * @return
     */
    int insert(Book record);

    /**
     * 选择性插入
     * @param record
     * @return
     */
    int insertSelective(Book record);

    /**
     * 查询所有图书
     * @return
     */
    List<Book> selectAll(@Param("begin") int begin ,@Param("pageSize") int pageSize);


    /**
     * 查询总记录条数
     * @return
     */
    int selectAllCount();

    /**
     * 根据ID查询
     * @param bookId
     * @return
     */
    Book selectByPrimaryKey(Integer bookId);


    /**
     * 选择性模糊查询
     * @param book
     * @param begin 开始页
     * @param pageSize 每页大小
     * @return
     */
    List<Book> findByCondition(@Param("book") Book book,@Param("begin") int begin ,@Param("pageSize") int pageSize);

    /**
     * 条件查询记录条数
     * @return
     */
    int selectCountByCondition(@Param("book") Book book);

    /**
     * 全部修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Book record);
    int updateById(int bookId);

    /**
     * 选择性修改
     * @param record
     * @return
     */
    int updateByPrimaryKey(Book record);

   /*
    *
    * @Author tangxiangan
    * @Description //更新库存
    * @Date 15:00 2019/1/7
    * @Param [i, bookId]
    * @return int
    **/
    int updateBookCount(@Param("i")int i,@Param("bookId")int bookId);
    /*
    *
     * @Author tangxiangan
     * @Description //
     * @Date 15:01 2019/1/7
     * @Param [bookId]
     * @return int
     **/
    int updateBookBorrowNumber(@Param("bookId")int bookId);



}