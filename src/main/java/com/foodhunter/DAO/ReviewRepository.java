/**
 * Created by yujin
 * 아래의 두 가지 방식을 순차적으로 적용해보기 위해 interface 생성(순전히 연습 목적)
 * Review CRUD 메모리 기반 테스트 -> jpa 기술 사용
 * **/
package com.foodhunter.DAO;

import com.foodhunter.DTO.Review;

import java.util.List;
import java.util.Optional;

public interface ReviewRepository {

    Review save(Review review);
    Optional<Review> findById(Long id);
    List<Review> findAll(Long storeId);
}
