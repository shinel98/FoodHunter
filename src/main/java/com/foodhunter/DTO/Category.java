package com.foodhunter.DTO;

import java.util.Date;

public class Category {
    private long categoryId;
    private String categoryName;
    private String icon;
    private long requestStatus;
    private long requestCnt;
    private Date regDate;

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public long getRequestStatus() {
        return requestStatus;
    }

    public void setRequestStatus(long requestStatus) {
        this.requestStatus = requestStatus;
    }

    public long getRequestCnt() {
        return requestCnt;
    }

    public void setRequestCnt(long requestCnt) {
        this.requestCnt = requestCnt;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }
}
