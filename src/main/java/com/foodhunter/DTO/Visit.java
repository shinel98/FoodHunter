package com.foodhunter.DTO;

import java.sql.Date;

public class Visit {

    private Long visitId;
    private Long userId;
    private Long storeId;
    private Date regiDate;

    public Long getVisitId() {
        return visitId;
    }

    public void setVisitId(Long visitId) {
        this.visitId = visitId;
    }

    public Long getUsrId() {
        return userId;
    }

    public void setUsrId(Long usrId) {
        this.userId = usrId;
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
        return "Visit{" +
                "visitId=" + visitId +
                ", usrId=" + userId +
                ", storeId=" + storeId +
                ", regiDate=" + regiDate +
                '}';
    }
}
