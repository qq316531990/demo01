package com.service.impl;

import com.dao.BookTypeMapper;
import com.dao.SecondTypeDao;
import com.pojo.BookType;
import com.pojo.SecondTypeVO;
import com.service.BookTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BookTypeServiceImpl implements BookTypeService {

    @Autowired
    BookTypeMapper bookTypeMapper;
    @Autowired
    SecondTypeDao secondTypeDao;

    /**
     * 根据二级分类查图书
     * @param type_id
     * @return
     */
    public List<Integer> selectBookByType(int type_id) {
        List<BookType> bookTypes=bookTypeMapper.selectBookByType(type_id);
        if(bookTypes.size()!=0){
            List<Integer> bookId=new ArrayList<Integer>();
            for(int i=0;i<bookTypes.size();i++){
                bookId.add(bookTypes.get(i).getBookId());
            }
            return bookId;
        }
        return null;
    }

    public int insert(BookType bookType) {
        return bookTypeMapper.insert(bookType);
    }

    /**
     * 根据一级分类查图书
     * @param type_id
     * @return
     */
    public List<Integer> selectSecondByType(int type_id) {
        List<SecondTypeVO> SecondTypeVO=secondTypeDao.getType2ByTypeId(type_id);
        List<Integer> bookId=new ArrayList<Integer>();
        for (SecondTypeVO sec: SecondTypeVO) {
            int secondTypeId=sec.getSecondType_id();
            if(selectBookByType(secondTypeId)!=null){
                for (Integer i: selectBookByType(secondTypeId) ) {
                    bookId.add(i);
                }
            }
        }

        return bookId;
    }
}
