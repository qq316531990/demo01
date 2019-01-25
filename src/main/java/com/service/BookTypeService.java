package com.service;

import com.pojo.BookType;

import java.util.List;

public interface BookTypeService {

    /**
     * 根据二级分类差图书
     * @param type_id
     * @return
     */
    List<Integer> selectBookByType(int type_id);

    /**
     * 添加
     * @param bookType
     * @return
     */
    int insert (BookType bookType);

    /**
     * 根据一级分类查图书
     * @param type_id
     * @return
     */
    List<Integer> selectSecondByType(int type_id);
}
