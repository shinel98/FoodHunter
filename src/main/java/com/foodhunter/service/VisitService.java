package com.foodhunter.service;

import com.foodhunter.DAO.VisitDAO;
import com.foodhunter.DTO.Visit;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class VisitService {
    private final VisitDAO visitDAO;

    @Autowired
    public VisitService(VisitDAO visitDAO) {
        this.visitDAO = visitDAO;
    }

    /**방문인증**/
    public Long authenticate(Visit visit){
        visitDAO.save(visit);
        return visit.getVisitId();
    }

    /**userId 사용자별 방문인증 전체 조회**/
    public List<Visit> read(Long userId){
        return visitDAO.findAll(userId);
    }

    /**storeId 가게별 방문인증 전체 조회**/
    public List<Visit> readByStoreId(Long storeId){
        return visitDAO.findAllByStoreId(storeId);
    }

}
