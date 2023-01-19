/**
 * Created by yujin
 * **/
package com.foodhunter.service;

import com.foodhunter.DAO.ReviewDAO;
import com.foodhunter.DTO.Review;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ReviewService {
    private final ReviewDAO reviewDAO;

    @Autowired
    public ReviewService(ReviewDAO reviewDAO) {
        this.reviewDAO = reviewDAO;
    }

    /**review 작성**/
    public Long write(Review review){
//        try{
//            validateDuplicateReview(review);
//        }
//        catch (IllegalStateException e){
//            return -1L;
//        }
        reviewDAO.save(review);
        return review.getReviewId();
    }

    /**review를 이미 작성한 가게에 똑같은 유저가 중복 작성을 하는 경우 validation check**/
    public void validateDuplicateReview(Review review){
        List<Review> storeReview = reviewDAO.findByStoreId(review.getStoreId());
        storeReview.stream()
                .forEach(rv -> {
                    if(rv.getUsrId() == review.getUsrId()){
                        throw new IllegalStateException("이미 리뷰를 작성했습니다. 새로 작성하고 싶으시다면 기존 리뷰를 삭제해주세요.");
                    }
                });
    }

    /**리뷰 삭제**/
    public Long delete(Review review){
        Long removedReviewId = reviewDAO.delete(review);
        return removedReviewId; // Todo: 삭제할 리뷰가 없는 에러 상황에서는 -1L 반환되니 컨트롤러에서 처리하기
    }

    /**userId가 작성한 리뷰 전체 조회 -> 마이페이지**/
    public List<Review> readByUserId(Long userId){
        List<Review> result = reviewDAO.findByUserId(userId);
        return result;
    }

    /**storeId에 등록된 리뷰 전체 조회 -> store페이지**/
    public List<Review> readByStoreId(Long storeId){
        List<Review> result = reviewDAO.findByStoreId(storeId);
        return result;
    }
}
