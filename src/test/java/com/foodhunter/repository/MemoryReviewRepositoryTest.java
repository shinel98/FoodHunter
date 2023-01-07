package com.foodhunter.repository;

import com.foodhunter.DAO.MemoryReviewRepository;
import com.foodhunter.DTO.Review;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Date;

public class MemoryReviewRepositoryTest {

    MemoryReviewRepository repository = new MemoryReviewRepository();

    @AfterEach
    public void afterEach() {
        repository.clearStore();
    }

    @Test
    public void save(){
        Review review = new Review();
        java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
        review.setReviewContent("팥 양이 정말 많아요!! 사장님이 친절하셔서 다음에 또 가고 싶네요 ㅎㅎ");
        review.setScore(5);
        review.setUsrId(1);
        review.setUserName("yujin9747");
        review.setStoreId(4);
        review.setRegiDate(date);

        repository.save(review);

        Review result = repository.findById(review.getReviewId()).get();  // Optional에서 값을 빼오기 위해 get 사용
        Assertions.assertEquals(review, result);    // 같을 경우, 문제 없을 경우 아무 메세지도 나오지 않음.
        // Assertions.assertEquals(member, null);  다를 경우 나오는 메세지 확인해보
        // 이외에도 다양한 Assertions 가 있으니 사용해보기
    }
}
