package com.foodhunter.service;

import com.foodhunter.DAO.MemoryReviewRepository;
import com.foodhunter.DTO.Review;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertThrows;

public class ReviewServiceTest {

    ReviewService reviewService;
    MemoryReviewRepository reviewRepository;

    @BeforeEach
    public void beforeEach() {
        reviewRepository = new MemoryReviewRepository();
        reviewService = new ReviewService(reviewRepository);
    }

    @AfterEach
    public void afterEach() {
        reviewRepository.clearStore();
    }

    @Test
    void 리뷰작성(){
        // given
        Review review = new Review();
        java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
        review.setUsrId(1);
        review.setUserName("yujin9747");
        review.setStoreId(4);
        review.setRegiDate(date);
        review.setReviewId(4);
        review.setReviewContent("정말 맛있어요~~ 어묵 국물 맛이 깔끔해요!");

        // when
        Long reviewId = reviewService.create(review);

        // then
        Review result = reviewService.findOne(reviewId).get();
        // 아래의 방식으로 테스트를 진행하기 위해서는 userName이 애초에 만들어질 때 중복되지 않도록 해줘야 함.
        Assertions.assertEquals(review.getUserName(), result.getUserName());
    }

    @Test
    void 중복_리뷰_예외(){
        // given
        Review review1 = new Review();
        java.sql.Date date1 = new java.sql.Date(System.currentTimeMillis());
        review1.setUsrId(1);
        review1.setUserName("yujin9747");
        review1.setStoreId(4);
        review1.setRegiDate(date1);
        review1.setReviewId(4);
        review1.setReviewContent("정말 맛있어요~~ 어묵 국물 맛이 깔끔해요!");

        Review review2 = new Review();
        java.sql.Date date2 = new java.sql.Date(System.currentTimeMillis());
        review2.setUsrId(1);
        review2.setUserName("yujin9747");
        review2.setStoreId(4);
        review2.setRegiDate(date2);
        review2.setReviewId(2);
        review2.setReviewContent("별로 ㅠ 너무 비싸요");

        // when
        reviewService.create(review1);
        IllegalStateException e = assertThrows(IllegalStateException.class, () -> reviewService.create(review2));

        // then
        Assertions.assertEquals(e.getMessage(), "이미 리뷰를 작성했습니다. 새로 작성하고 싶으시다면 기존 리뷰를 삭제해주세요.");
    }
}
