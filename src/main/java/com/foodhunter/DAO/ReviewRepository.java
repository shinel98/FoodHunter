/**
 * Created by yujin
 * 아래의 두 가지 방식을 순차적으로 적용해보기 위해 interface 생성(순전히 연습 목적)
 * Review CRUD 메모리 기반 테스트 -> jpa 기술 사용
 * **/
package com.foodhunter.DAO;

import com.foodhunter.DTO.Review;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface ReviewRepository {

    // 리뷰 작성하기
    Review save(Review review);
    // usrId로 리뷰 모두 읽어오기 -> 마이페이지에서 사용
    List<Review> findByUserId(Long usrId);
    // storeId로 리뷰 모두 읽어오기 -> 가게상세페이지에서 사용
    List<Review> findByStoreId(Long storeId);
    // 리뷰 삭제하기
    Long delete(Review review);
}
