package com.foodhunter;

import com.foodhunter.DAO.ReviewDAOImpl;
import com.foodhunter.DAO.VisitDAOImpl;
import com.foodhunter.DAO.ReviewRepository;
import com.foodhunter.DAO.VisitRepository;
import com.foodhunter.service.ReviewService;
import com.foodhunter.service.VisitService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfig {
    private SqlSession sqlSession;

    //DataSource dataSource;
    @Autowired
    public SpringConfig(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Bean
    public ReviewService reviewService(){

        return new ReviewService(reviewRepository());
    }

    @Bean
    public VisitService visitService(){
        return new VisitService(visitRepository());
    }

    @Bean
    public ReviewRepository reviewRepository() {
         return new ReviewDAOImpl(sqlSession);
    }

    @Bean
    public VisitRepository visitRepository() {
        return new VisitDAOImpl(sqlSession);
    }
}
