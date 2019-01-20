package com.dao;

import com.pojo.BookType;

import java.util.List;

public interface BookTypeMapper {

    /**
     * 根据类型ID查询图书ID集合
     * @param typeId
     * @return
     */
    List<BookType> selectBookByType(int typeId);

    /**
     * 插入分类
     * @param bookType
     * @return
     */
    int insert (BookType bookType);

}
