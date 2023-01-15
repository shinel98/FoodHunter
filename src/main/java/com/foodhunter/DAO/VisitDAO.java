package com.foodhunter.DAO;

import com.foodhunter.DTO.Visit;

import java.util.List;

public interface VisitDAO {
    /**방문인증 완료**/
    Visit save(Visit visit);
    /**내가 방문인증한 가게 모두 조회**/
    List<Visit> findAll(Long userId);
}
