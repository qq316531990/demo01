package com.utils;

import com.controller.MessageController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

@Component
public class TimerTask {

    /**
     * 注入,防止空指针异常,直接new无法引入注入的类
     */
    @Autowired
    MessageController messageController;

//    @Scheduled(cron = "0 0 1 * * ?")//每天1.2.3点执行
    @Scheduled(cron = "0 13 16 ? * *")
    public void task1()
    {

        messageController.sendMessage();

    }
}

