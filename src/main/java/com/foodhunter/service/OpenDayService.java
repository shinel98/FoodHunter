package com.foodhunter.service;

import com.foodhunter.DAO.OpenDayDAO;
import com.foodhunter.DAO.OpenDayDAOImpl;
import com.foodhunter.DTO.OpenDay;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class OpenDayService {
    private final OpenDayDAO openDayDAO;

    @Autowired
    public OpenDayService(OpenDayDAO openDayDAO) {
        this.openDayDAO = openDayDAO;
    }

    public OpenDay save(OpenDay openDay){
        openDayDAO.save(openDay);
        return openDay;
    }

    public List<OpenDay> readByStoreId(long storeId){
        List<OpenDay> result;
        result = openDayDAO.readByStoreId(storeId);
        return result;
    }

    public void deleteByStoreId(long storeId) {
        openDayDAO.deleteByStoreId(storeId);
    }
}
