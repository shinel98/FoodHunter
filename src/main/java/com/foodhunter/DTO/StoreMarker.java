package com.foodhunter.DTO;

public class StoreMarker {
    private long storeId;
    private String url;
    private Double xLocation;
    private Double yLocation;
    private String name;
    private int visitCnt;
    private long likeCnt;
    private String categoryName;
    private String icon;

    public long getStoreId() {
        return storeId;
    }

    public void setStoreId(long storeId) {
        this.storeId = storeId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Double getxLocation() {
        return xLocation;
    }

    public void setxLocation(Double xLocation) {
        this.xLocation = xLocation;
    }

    public Double getyLocation() {
        return yLocation;
    }

    public void setyLocation(Double yLocation) {
        this.yLocation = yLocation;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getVisitCnt() {
        return visitCnt;
    }

    public void setVisitCnt(int visitCnt) {
        this.visitCnt = visitCnt;
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

    public long getLikeCnt() {
        return likeCnt;
    }

    public void setLikeCnt(long likeCnt) {
        this.likeCnt = likeCnt;
    }
}
