/**
 * Created by yujin
 * **/
package com.foodhunter.DTO;

import java.sql.Date;

public class Review {

//    private long reviewId;  // primary key
private long id;  // primary key

    private long storeId;
    private String reviewContent;
    private int score;
    private Date regDate;
    private String photo;

    private long userId;

    public long getId() {

        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

//    public long getReviewId() {
//        return reviewId;
//    }
//
//    public void setReviewId(long reviewId) {
//        this.reviewId = reviewId;
//    }

    public long getStoreId() {
        return storeId;
    }

    public void setStoreId(long storeId) {
        this.storeId = storeId;
    }

    public String getReviewContent() {
        return reviewContent;
    }

    public void setReviewContent(String reviewContent) {
        this.reviewContent = reviewContent;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }



//    @Override
//    public String toString() {
//        return "Review{" +
//                "reviewId=" + reviewId +
//                ", storeId=" + storeId +
//                ", reviewContent='" + reviewContent + '\'' +
//                ", score=" + score +
//                ", regDate=" + regDate +
//                ", photo='" + photo + '\'' +
//                ", userId=" + userId +
//                '}';
//    }
@Override
public String toString() {
    return "Review{" +
            "id=" + id +
            ", storeId=" + storeId +
            ", reviewContent='" + reviewContent + '\'' +
            ", score=" + score +
            ", regDate=" + regDate +
            ", photo='" + photo + '\'' +
            ", userId=" + userId +
            '}';
}
}
