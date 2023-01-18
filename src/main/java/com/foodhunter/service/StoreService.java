package com.foodhunter.service;

import com.foodhunter.DTO.Category;
import com.foodhunter.DTO.Likes;
import com.foodhunter.DTO.Store;
import com.foodhunter.DTO.StoreMarker;

import java.util.List;
import java.util.Map;

public interface StoreService {
    public List<Store> readStores();
    public Store readOneStore(long storeId);
    public List<Store> readStoresById();
    public List<Category> readAllCategories();
    public List<StoreMarker> readMarkerInfo();
    public List<Likes> readLikes();

    public long reportStore(Store store);

    public List<Store> getStoresByUserId(long userId);
    public void deleteStore(int id);
}
