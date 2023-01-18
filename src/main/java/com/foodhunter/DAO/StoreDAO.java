package com.foodhunter.DAO;

import com.foodhunter.DTO.Category;
import com.foodhunter.DTO.Likes;
import com.foodhunter.DTO.Store;
import com.foodhunter.DTO.StoreMarker;

import java.util.List;
import java.util.Map;

public interface StoreDAO {
    public List<Store> readStores();
    public Store readOneStore(long storeId);
    public List<Store> readStoresDescById();
    public List<Category> readAllCategories();
    public List<StoreMarker> readAllMarkers();
    public List<Likes> readLikes();

    public Store save(Store store);

    public List<Store> getStoresByUserId(long userId);
    public void deleteStore(int id);
}
