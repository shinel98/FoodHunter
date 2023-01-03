/**
 * Created by yujin
 * **/
package com.foodhunter.DAO;

import com.foodhunter.DTO.Review;

import java.util.*;

public class MemoryReviewRepository implements ReviewRepository{

    // primary key인 reviewId를 기준으로 데이타를 가져올 store
    private static Map<Long, Review> store = new HashMap<>();
    private static long sequence = 0L;
    @Override
    public Review save(Review review) {
        review.setReviewId(++sequence);
        store.put(review.getReviewId(), review);
        return review;
    }

    @Override
    public Optional<Review> findById(Long id) {
        return Optional.ofNullable(store.get(id));
    }

    @Override
    public List<Review> findAll(Long storeId) {
        List<Review> result = new ArrayList<>();
        store.values()
                .stream()
                .forEach(review -> {
                    if(review.getStoreId() == storeId) result.add(review);
                });
        return result;
    }

    public void clearStore() {
        store.clear();
    }
}
