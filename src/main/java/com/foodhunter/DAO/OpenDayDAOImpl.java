package com.foodhunter.DAO;

import com.foodhunter.DTO.OpenDay;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class OpenDayDAOImpl implements OpenDayDAO{

    SqlSession sqlSession;

    @Autowired
    public OpenDayDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public OpenDay save(OpenDay openDay) {
        sqlSession.insert("openDay.insertDay", openDay);
        return openDay;
    }
}
