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

    public Long like(Favorite favorite){
        favoriteDAO.save(favorite);
        return favorite.getFavoriteId();
    }

    public Long unlike(Favorite favorite){
        favoriteDAO.delete(favorite);
        return favorite.getFavoriteId();
    }

    public List<Favorite> readByUserId(Long userId){
        List<Favorite> result;
        result = favoriteDAO.findByUserId(userId);
        return result;
    }

    public Long current(Favorite favorite){
        Long result;
        result = favoriteDAO.findOne(favorite);
        return result;
    }

    public List<Favorite> readByStoreId(long storeId){
        List<Favorite> result;
        result = favoriteDAO.findByStoreId(storeId);
        return result;
    }
}
