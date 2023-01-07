package com.foodhunter.DAO;

import com.foodhunter.DTO.Visit;

import java.util.List;

public interface VisitRepository {
    Visit save(Visit visit);
    List<Visit> findAll(Long usrId);
}
