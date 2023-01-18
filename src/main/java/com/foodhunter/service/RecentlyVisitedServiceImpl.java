package com.foodhunter.service;

import com.foodhunter.DAO.RecentlyVisitedDAO;
import com.foodhunter.DTO.RecentlyVisited;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecentlyVisitedServiceImpl implements RecentlyVisitedService {
    @Autowired
    RecentlyVisitedDAO dao;

    @Override
    public List<RecentlyVisited> getRecentlyVisitedList(long userId) {
        return dao.getRecentlyVisitedList(userId);
    }
}
