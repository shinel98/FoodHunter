package com.foodhunter.DAO;

import com.foodhunter.DTO.RecentlyVisited;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RecentlyVisitedDAO {
    @Autowired
    SqlSession sqlSession;

    public List<RecentlyVisited> getRecentlyVisitedList(long userId) {
        return sqlSession.selectList("recentlyVisited.selectRecentlyVisited", userId);
    }
}
