package com.foodhunter.service;

import com.foodhunter.DAO.StoreDAO;
import com.foodhunter.DTO.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StoreServiceImpl implements StoreService {
    @Autowired
    private StoreDAO storeDAO;

    @Override
    public List<Store> readStores() {
        List<Store> stores = storeDAO.readStores();
        return stores;
    }
}
