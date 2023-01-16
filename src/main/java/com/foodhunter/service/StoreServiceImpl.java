package com.foodhunter.service;

import com.foodhunter.DAO.StoreDAO;
import com.foodhunter.DTO.Category;
import com.foodhunter.DTO.Likes;
import com.foodhunter.DTO.Store;
import com.foodhunter.DTO.StoreMarker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StoreServiceImpl implements StoreService {
    @Autowired
    private StoreDAO storeDAO;

    @Override
    public List<Store> readStores() {
        List<Store> stores = storeDAO.readStores();
        return stores;
    }

    @Override
    public List<Category> readAllCategories() {
        List<Category> categories = storeDAO.readAllCategories();
        return categories;
    }

    @Override
    public List<StoreMarker> readMarkerInfo() {
        List<StoreMarker> markersInfo = storeDAO.readAllMarkers();
        return markersInfo;
    }
    @Override
    public List<Likes> readLikes() {
        List<Likes> likes = storeDAO.readLikes();
        return likes;
    }
}
