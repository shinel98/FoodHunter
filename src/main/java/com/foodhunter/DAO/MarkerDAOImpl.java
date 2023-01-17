package com.foodhunter.DAO;

import com.foodhunter.DTO.StoreMarker;
import org.apache.ibatis.session.SqlSession;

public class MarkerDAOImpl implements MarkerDAO{
    SqlSession sqlSession;

    public MarkerDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public StoreMarker save(StoreMarker storeMarker) {
        sqlSession.insert("main.insertMarker", storeMarker);
        return storeMarker;
    }
}
