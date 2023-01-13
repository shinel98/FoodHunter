package com.foodhunter.DTO;

import java.sql.Date;

public class Favorite {
    private Long favoriteId;
    private Long userId;
    private Long storeId;
    private Date regiDate;

    public Long getFavoriteId() {
        return favoriteId;
    }

    public void setFavoriteId(Long favoriteId) {
        this.favoriteId = favoriteId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getStoreId() {
        return storeId;
    }

    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    public Date getRegiDate() {
        return regiDate;
    }

    public void setRegiDate(Date regiDate) {
        this.regiDate = regiDate;
    }

    @Override
    public String toString() {
        return "Favorite{" +
                "favoriteId=" + favoriteId +
                ", usrId=" + userId +
                ", storeId=" + storeId +
                ", regiDate=" + regiDate +
                '}';
    }
}
