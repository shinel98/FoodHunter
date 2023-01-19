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

    /**오픈요일 추가**/
    public OpenDay save(OpenDay openDay){
        openDayDAO.save(openDay);
        return openDay;
    }

    /**storeId의 오픈 요일 전체 조회**/
    public List<OpenDay> readByStoreId(long storeId){
        List<OpenDay> result;
        result = openDayDAO.readByStoreId(storeId);
        return result;
    }

    public void deleteOpenDay(int id) {
        openDayDAO.deleteOpenDay(id);
    }
    public void deleteByStoreId(long storeId) {
        openDayDAO.deleteByStoreId(storeId);
    }
}
