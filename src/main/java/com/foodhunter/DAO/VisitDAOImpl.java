package com.foodhunter.DAO;

import com.foodhunter.DTO.Visit;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VisitDAOImpl implements VisitDAO {

    // 1st: visitId, 2nd : Visit 객체
    private static Map<Long, Visit> store = new HashMap<>();
    SqlSession sqlSession;
    private static long sequence = 0L;

    public VisitDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public Visit save(Visit visit) {
        visit.setVisitId(++sequence);
        store.put(visit.getVisitId(), visit);
        return visit;
    }

    @Override
    public List<Visit> findAll(Long usrId) {
        List<Visit> result = new ArrayList<>();
        store.values()
                .stream()
                .forEach(visit -> {
                    if(visit.getUsrId() == usrId) result.add(visit);
                });
        return result;
    }
}
