package com.foodhunter.DTO;

import java.util.Date;

public class Store {
    private long id;
    private String name;
    private long categoryId;
    private long userId;
    private long visitCnt;

    private Date regDate;

    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(String addressName) {
        this.addressName = addressName;
    }

    private String addressName;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    //    public long getId() {
//        return id;
//    }
//
//    public void setId(long id) {
//        this.id = id;
//    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getVisitCnt() {
        return visitCnt;
    }

    public void setVisitCnt(long visitCnt) {
        this.visitCnt = visitCnt;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }


}
