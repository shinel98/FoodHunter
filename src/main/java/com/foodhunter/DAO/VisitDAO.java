package com.foodhunter.DAO;

import com.foodhunter.DTO.Visit;

import java.util.List;

public interface VisitDAO {
    Visit save(Visit visit);
    List<Visit> findAll(Long usrId);
}
