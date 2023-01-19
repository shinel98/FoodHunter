package com.foodhunter.DAO;

import com.foodhunter.DTO.OpenDay;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

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

    @Override
    public List<OpenDay> readByStoreId(long storeId) {
        List<OpenDay> result;
        result = sqlSession.selectList("openDay.readByStoreId", storeId);
        return result;
    }

    @Override
    public void deleteOpenDay(int id) {
        sqlSession.delete("openDay.deleteOpenDay", id);
    }
}
