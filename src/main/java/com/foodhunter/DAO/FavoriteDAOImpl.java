package com.foodhunter.DAO;

import com.foodhunter.DTO.Favorite;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class FavoriteDAOImpl implements FavoriteDAO{
    SqlSession sqlSession;

    public FavoriteDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public Favorite save(Favorite favorite) {
        sqlSession.insert("favorite.insertFavorite", favorite);
        return favorite;
    }

    @Override
    public List<Favorite> findByUserId(Long userId) {
        List<Favorite> result;
        result = sqlSession.selectList("favorite.selectFavoriteByUserId", userId);
        return result;
    }

    @Override
    public List<Favorite> findByStoreId(long storeId) {
        List<Favorite> result;
        result = sqlSession.selectList("favorite.selectFavoriteByStoreId", storeId);
        return result;
    }

    @Override
    public Long delete(Favorite favorite) {
        sqlSession.delete("favorite.deleteFavorite", favorite);
        return favorite.getFavoriteId();
    }

    @Override
    public Long findOne(Favorite favorite) {
        List<Favorite> result = sqlSession.selectList("favorite.selectOne", favorite);
        if(result.size()==0) return -1L;
        return (long) result.size();
    }
}
