package com.foodhunter.service;

import com.foodhunter.DAO.FavoriteDAO;
import com.foodhunter.DTO.Favorite;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class FavoriteService {

    public final FavoriteDAO favoriteDAO;

    @Autowired
    public FavoriteService(FavoriteDAO favoriteDAO) {
        this.favoriteDAO = favoriteDAO;
    }

    /**좋아요(즐겨찾기) 등록**/
    public Long like(Favorite favorite){
        favoriteDAO.save(favorite);
        return favorite.getFavoriteId();
    }

    /**좋아요(즐겨찾기) 취소**/
    public Long unlike(Favorite favorite){
        favoriteDAO.delete(favorite);
        return favorite.getFavoriteId();
    }

    /**userId가 등록한 즐겨찾기 전체 조회 -> 마이페이지**/
    public List<Favorite> readByUserId(Long userId){
        List<Favorite> result;
        result = favoriteDAO.findByUserId(userId);
        return result;
    }

    /**현재 접근하는 store를 userId가 이미 좋아요 누른 가게인지 조회**/
    public Long current(Favorite favorite){
        Long result;
        result = favoriteDAO.findOne(favorite);
        return result;
    }

    /**storeId에 누른 좋아요 전체 조회 -> 카카오 공유에서 좋아요 수 표시**/
    public List<Favorite> readByStoreId(long storeId){
        List<Favorite> result;
        result = favoriteDAO.findByStoreId(storeId);
        return result;
    }
}
