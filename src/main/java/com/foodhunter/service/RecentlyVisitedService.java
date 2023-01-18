package com.foodhunter.service;

import com.foodhunter.DTO.RecentlyVisited;

import java.util.List;

public interface RecentlyVisitedService {
    public List<RecentlyVisited> getRecentlyVisitedList(long userId);
}
