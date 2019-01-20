package com.service.impl;

import com.dao.MessageMapper;
import com.pojo.Message;
import com.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageMapper messageMapper;

    public int addMessage(Message message) {
        return messageMapper.insert(message);
    }

    public int updateMessage(Message message) {
        return messageMapper.updateByPrimaryKeySelective(message);
    }

    public List<Message> queryById(int userId, int begin, int pageSize) {
        return messageMapper.selectByPrimaryKey(userId,begin,pageSize);
    }

    public int queryCountById(int userId) {
        return messageMapper.selectCountByPrimaryKey(userId);
    }

    public List<Message> queryAllMessage(int begin, int pageSize) {
        return messageMapper.selectAll(begin,pageSize);
    }

    public int queryAllCount() {
        return messageMapper.selectAllCount();
    }

    public List<Message> selectByCondition(Message message, int begin, int pageSize) {
        return messageMapper.selectByCondition(message,begin,pageSize);
    }

    public int selectCountByCondition(Message message) {
        return messageMapper.selectCountByCondition(message);
    }

    public int selectUnreadCount(int userId) {
        return messageMapper.selectUnreadCountByUserId(userId);
    }


}
