/**
 * Created by yujin
 * **/
package com.foodhunter.service;

import com.foodhunter.DAO.ReviewRepository;
import com.foodhunter.DTO.Review;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;

public class ReviewService {
    private final ReviewRepository reviewRepository;

    @Autowired
    public ReviewService(ReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;
    }

    /** review 작성 **/
    public Long create(Review review){
        validateDuplicateReview(review);
        reviewRepository.save(review);
        return review.getReviewId();
    }

    /** review를 이미 작성한 가게에 똑같은 유저가 중복 작성을 하는 경우 validation check **/
    public void validateDuplicateReview(Review review){
        List<Review> storeReview = reviewRepository.findAll(review.getStoreId());
        storeReview.stream()
                .forEach(rv -> {
                    if(rv.getUsrId() == review.getUsrId()){
                        throw new IllegalStateException("이미 리뷰를 작성했습니다. 새로 작성하고 싶으시다면 기존 리뷰를 삭제해주세요.");
                    }
                });
    }

    public Optional<Review> findOne(Long reviewId){
        return reviewRepository.findById(reviewId);
    }

    /** review 한 가게에 대해 전체 조회 **/
    public List<Review> read(Long storeId){
        return reviewRepository.findAll(storeId);
    }
}
