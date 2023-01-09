/**
 * Created by yujin
 * Component 스캔을 위한 Configuration
 * **/
package com.foodhunter;

import com.foodhunter.DAO.MemoryReviewRepository;
import com.foodhunter.DAO.MemoryVisitRepository;
import com.foodhunter.DAO.ReviewRepository;
import com.foodhunter.DAO.VisitRepository;
import com.foodhunter.service.ReviewService;
import com.foodhunter.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
public class SpringConfig {
    private DataSource dataSource;
    @Autowired
    public SpringConfig(DataSource dataSource) {
        this.dataSource = dataSource;
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
         return new MemoryReviewRepository();
    }

    @Bean
    public VisitRepository visitRepository() {
        return new MemoryVisitRepository();
    }
}
