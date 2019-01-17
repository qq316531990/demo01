package com.service;

import com.pojo.Message;

import java.util.List;

public interface MessageService {

    int addMessage(Message message);

    int updateMessage(Message message);

    /**
     * 用户个人分页查询
     * @param userId
     * @param begin
     * @param pageSize
     * @return
     */
    List<Message> queryById(int userId,int begin,int pageSize);
    int queryCountById(int userId);

    /**
     * 查询所有
     * @param begin
     * @param pageSize
     * @return
     */
    List<Message> queryAllMessage(int begin,int pageSize);
    int queryAllCount();

    /**
     * 选择查询
     * @param message
     * @param begin
     * @param pageSize
     * @return
     */
    List<Message> selectByCondition(Message message,int begin ,int pageSize);
    int selectCountByCondition(Message message);

    /**
     * 查询用户未读消息数
     * @param userId
     * @return
     */
    int selectUnreadCount(int userId);

}
