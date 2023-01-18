package com.foodhunter;

public class ReviewForm {
    String content;
    String photo;
    Long storeId;
    Long userId;

    public Long getUserId() {return userId;}
    public void setUserId(Long userId) {this.userId = userId;}
    public String getPhoto() {
        return photo;
    }
    public void setPhoto(String photo) {
        this.photo = photo;
    }
    public Long getStoreId() {
        return storeId;
    }
    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }



}

