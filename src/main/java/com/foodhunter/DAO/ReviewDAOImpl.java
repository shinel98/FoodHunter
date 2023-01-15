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
        return review.getReviewId();
    }

    @Override
    public List<Review> findByUserId(Long usrId) {
        List<Review> result;
        result = sqlSession.selectList("comment.selectCommentByUserId", usrId);
        return result;
    }

    @Override
    public List<Review> findByStoreId(Long storeId) {
        List<Review> result;
        result = sqlSession.selectList("comment.selectCommentByStoreId", storeId);
        return result;
    }

    public void clearStore() {

        //store.clear();
    }
}
