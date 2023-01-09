package com.foodhunter.DAO;

import com.foodhunter.DTO.Review;
import com.foodhunter.DTO.Visit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemoryVisitRepository implements VisitRepository{

    // 1st: visitId, 2nd : Visit 객체
    private static Map<Long, Visit> store = new HashMap<>();
    private static long sequence = 0L;

    @Override
    public Visit save(Visit visit) {
        visit.setVisitId(++sequence);
        store.put(visit.getVisitId(), visit);
        return visit;
    }

    @Override
    public List<Visit> findAll(Long usrId) {
        List<Visit> result = new ArrayList<>();
        store.values()
                .stream()
                .forEach(visit -> {
                    if(visit.getUsrId() == usrId) result.add(visit);
                });
        return result;
    }
}
