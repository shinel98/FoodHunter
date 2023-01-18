package com.foodhunter.DAO;

import com.foodhunter.DTO.Category;
import com.foodhunter.DTO.Likes;
import com.foodhunter.DTO.Store;
import com.foodhunter.DTO.StoreMarker;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class StoreDAOImpl implements StoreDAO{
    private SqlSession sqlSession;
    private String namespace = "main";

    public StoreDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<Store> readStores() {
        List<Store> stores = new ArrayList<Store>();
        stores = sqlSession.selectList(namespace+".getStores");

        return stores;
    }

    @Override
    public Store readOneStore(long storeId) {
        Store result = sqlSession.selectOne(namespace + ".getOneStore", storeId);
        return result;
    }

    @Override
    public List<Store> readStoresDescById() {
        List<Store> stores = new ArrayList<Store>();
        stores = sqlSession.selectList(namespace+".getStoresDescending");

        return stores;
    }

    @Override
    public List<Category> readAllCategories() {
        List<Category> categories = new ArrayList<>();
        categories = sqlSession.selectList(namespace+".getAllCategories");
        return categories;
    }

    @Override
    public List<StoreMarker> readAllMarkers() {
        List<StoreMarker> storeMarkerInfo = new ArrayList<>();
        storeMarkerInfo = sqlSession.selectList(namespace+".getMarkerInfo");
        return storeMarkerInfo;
    }
    @Override
    public List<Likes> readLikes(){
        List<Likes> likes = new ArrayList<>();
        likes = sqlSession.selectList(namespace+".getLikes");
        return likes;
    }

    @Override
    public Store save(Store store) {
        sqlSession.insert(namespace + ".insertStore", store);
        return store;
    }
    @Override
    public long deleteStore(long id){
        long result = sqlSession.delete(namespace +".deleteStore", id);
        return result;
    }
}
