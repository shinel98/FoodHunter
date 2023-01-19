package com.foodhunter.service;

import com.foodhunter.DAO.MarkerDAO;
import com.foodhunter.DTO.StoreMarker;
import org.springframework.beans.factory.annotation.Autowired;

public class MarkerService {

    public final MarkerDAO markerDAO;

    @Autowired
    public MarkerService(MarkerDAO markerDAO) {
        this.markerDAO = markerDAO;
    }

    /**마커 정보 생성 -> report**/
    public void createMarker(StoreMarker storeMarker){
        markerDAO.save(storeMarker);
    }
}
