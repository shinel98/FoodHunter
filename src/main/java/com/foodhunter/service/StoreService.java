package com.foodhunter.service;

import com.foodhunter.DTO.Category;
import com.foodhunter.DTO.Likes;
import com.foodhunter.DTO.Store;
import com.foodhunter.DTO.StoreMarker;

import java.util.List;
import java.util.Map;

public interface StoreService {
    public List<Store> readStores();
    public List<Category> readAllCategories();
    public List<StoreMarker> readMarkerInfo();
    public List<Likes> readLikes();
}
