package com.service.impl;

import com.pojo.Paper;
import com.service.PaperService;
import com.dao.PaperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaperServiceImpl implements PaperService {
    @Autowired
    private PaperDao paperDao;


    public int addPaper(Paper paper) {
        return paperDao.addPaper(paper);
    }


    public int deletePaperById(long id) {
        return paperDao.deletePaperById(id);
    }


    public int updatePaper(Paper paper) {
        return paperDao.updatePaper(paper);
    }


    public Paper queryById(long id) {
        return paperDao.queryById(id);
    }


    public List<Paper> queryAllPaper() {
        return paperDao.queryAllPaper();
    }

}

