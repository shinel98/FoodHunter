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

public class StoreServiceImpl implements StoreService {
    private StoreDAO storeDAO;

    public StoreServiceImpl(StoreDAO storeDAO) {
        this.storeDAO = storeDAO;
    }

    /**전체 가게 조회**/
    @Override
    public List<Store> readStores() {
        List<Store> stores = storeDAO.readStores();
        return stores;
    }

    /**가게 하나 조회 -> 상세 페이지로 이동**/
    @Override
    public Store readOneStore(long id) {
        Store store = storeDAO.readOneStore(id);
        return store;
    }

    @Override
    public List<Store> readStoresById() {
        List<Store> stores = storeDAO.readStoresDescById();
        return stores;
    }

    /**카테고리 전체 조회 -> 메인페이지 카테고리 메뉴**/
    @Override
    public List<Category> readAllCategories() {
        List<Category> categories = storeDAO.readAllCategories();
        return categories;
    }

    /**전체 가게 위치 정보 조회**/
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

    /**가게 제보**/
    @Override
    public long reportStore(Store store) {
        Store result = storeDAO.save(store);
        System.out.println("result : " + result.getName());
        return result.getCategoryId();
    }

    /**가게 삭제(신고하기) -> main페이지에서 사용**/
    public long deleteMainStore(long id) {
        long result = storeDAO.deleteMainStore(id);
        return result;
    }

    /**userId가 제보한 가게 전체 조회 -> 마이페이지**/
    @Override
    public List<Store> getStoresByUserId(long userId) {
        List<Store> stores = storeDAO.getStoresByUserId(userId);
        return stores;
    }

    /**가게 삭제(삭제 요청하기) -> store페이지에서 사용**/
    @Override
    public void deleteStore(int id) {
        storeDAO.deleteStore(id);
    }

    @Override
    public void updateStoreName(Store store) {
        storeDAO.updateStoreName(store);
    }
}
