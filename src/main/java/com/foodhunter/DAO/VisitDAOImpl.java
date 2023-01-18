package com.foodhunter.DAO;

import com.foodhunter.DTO.Visit;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VisitDAOImpl implements VisitDAO {

    SqlSession sqlSession;

    public VisitDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public Visit save(Visit visit) {
        sqlSession.insert("visit.insertVisit", visit);
        return visit;
    }

    @Override
    public List<Visit> findAll(Long userId) {
        List<Visit> result;
        result = sqlSession.selectList("visit.selectVisitByUserId", userId);
        return result;
    }

    @Override
    public List<Visit> findAllByStoreId(Long storeId) {
        List<Visit> result;
        result = sqlSession.selectList("visit.selectVisitByStoreId", storeId);
        return result;
    }
}
