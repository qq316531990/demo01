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
    List<Book> selectAllByTag1(@Param("begin") int begin ,@Param("pageSize") int pageSize);
    List<Book> selectAllByTag0(@Param("begin") int begin ,@Param("pageSize") int pageSize);

    /**
     * 查询总记录条数
     * @return
     */
    int selectAllCount();
    int selectAllByTag1Count();
    int selectAllByTag0Count();


    /**
     * 选择性模糊查询
     * @param book
     * @return
     */
    List<Book> findByCondition(@Param("book") Book book,@Param("begin") int begin ,@Param("pageSize") int pageSize);

    /**
     * 条件查询记录条数
     * @return
     */
    int selectCountByCondition();

    /**
     * 全部修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Book record);

    /**
     * 选择性修改
     * @param record
     * @return
     */
    int updateByPrimaryKey(Book record);
}