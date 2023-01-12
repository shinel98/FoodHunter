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

    /** 방문인증 작성 **/
    public Long authenticate(Visit visit){
        // Todo : distance 관련한 서비스를 여기서 제공해야 하는지 결정해서, 나중에 validation 체크 추가하기
        visitDAO.save(visit);
        return visit.getVisitId();
    }

    /** 방문인증을 한 가게에 대해 전체 조회 **/
    public List<Visit> read(Long usrId){
        // Todo: storeRepository의 findAll을 사용해 최종적으로 List<Store>를 반환하도록 수정하기
        return visitDAO.findAll(usrId);
    }

}
