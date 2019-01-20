package com.service.impl;

import com.dao.BookTypeMapper;
import com.pojo.BookType;
import com.service.BookTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BookTypeServiceImpl implements BookTypeService {

    @Autowired
    BookTypeMapper bookTypeMapper;

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
}
