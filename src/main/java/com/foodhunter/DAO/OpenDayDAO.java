package com.foodhunter.DAO;

import com.foodhunter.DTO.OpenDay;

import java.util.List;

public interface OpenDayDAO {
    public OpenDay save(OpenDay openDay);
    public List<OpenDay> readByStoreId(long storeId);
    public void deleteOpenDay(int id);
}
