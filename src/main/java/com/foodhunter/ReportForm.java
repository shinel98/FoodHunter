package com.foodhunter;

import com.foodhunter.DTO.StoreMarker;

public class ReportForm {
    long userId;
    String name;
    String categoryId;
    String addressName;
    String openDay;
    String lat;
    String lon;
    String categoryApplyName;
    public String getCategoryApplyName() {
        return categoryApplyName;
    }
    public void setCategoryApplyName(String categoryApplyName) {
        this.categoryApplyName = categoryApplyName;
    }
    public String getAddressName() {
        return addressName;
    }
    public void setAddressName(String addressName) {
        this.addressName = addressName;
    }
    public String getOpenDay() {
        return openDay;
    }
    public void setOpenDay(String openDay) {
        this.openDay = openDay;
    }
    public String getLat() {
        return lat;
    }
    public void setLat(String lat) {
        this.lat = lat;
    }
    public String getLon() {
        return lon;
    }
    public void setLon(String lon) {
        this.lon = lon;
    }
    public long getUserId() {
        return userId;
    }
    public void setUserId(long userId) {
        this.userId = userId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }
}
