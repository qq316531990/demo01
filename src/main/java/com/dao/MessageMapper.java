package com.dao;

import com.pojo.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageMapper {
   // int deleteByPrimaryKey(Message message);

    int insert(Message record);

    //int insertSelective(Message record);

    int updateByPrimaryKeySelective(Message record);

    //int updateByPrimaryKey(Message record);

    List<Message> selectByPrimaryKey(@Param("userId")Integer userId, @Param("begin") int begin , @Param("pageSize") int pageSize);
    int selectCountByPrimaryKey(Integer userId);

    List<Message> selectAll(@Param("begin") int begin ,@Param("pageSize") int pageSize);
    int selectAllCount();

    List<Message> selectByCondition(@Param("message") Message message,@Param("begin") int begin ,@Param("pageSize") int pageSize);
    int selectCountByCondition(@Param("message") Message message);

    int selectUnreadCountByUserId(int userId);


}