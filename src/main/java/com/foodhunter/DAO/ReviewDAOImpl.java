/**
 * Created by yujin
 * **/
package com.foodhunter.DAO;

import com.foodhunter.DTO.Review;
import org.apache.ibatis.session.SqlSession;

import java.util.*;

public class ReviewDAOImpl implements ReviewDAO {

    SqlSession sqlSession;

    public ReviewDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public Review save(Review review) {
        sqlSession.insert("comment.insertComment", review);
        return review;
    }

    @Override
    public Long delete(Review review){
        sqlSession.delete("comment.deleteComment", review);
        return -1L;
    }

    @Override
    public List<Review> findByUserId(Long usrId) {
//        List<Review> result = new ArrayList<>();
//        store.values()
//                .forEach(review -> {
//                    if(review.getUsrId() == usrId) result.add(review);
//                });
//        return result;
        return new ArrayList<>();
    }

    @Override
    public List<Review> findByStoreId(Long storeId) {
        // 리스트를 new로 생성해주지 않고 바로 리턴값을 받아오려고 하면 오류가 난다. 오류 이름 까먹음.
        List<Review> result = new ArrayList<>();
        result = sqlSession.selectList("comment.selectCommentByStoreId", storeId);
        return result;
    }

    public void clearStore() {

        //store.clear();
    }
}
