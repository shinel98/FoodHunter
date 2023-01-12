package com.foodhunter.DAO;

import com.foodhunter.DTO.Store;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class StoreDAOImpl implements StoreDAO{
    @Autowired
    private SqlSessionTemplate sqlSession;
    private String namespace = "main";

    @Override
    public List<Store> readStores() {
        List<Store> stores = new ArrayList<Store>();
        stores = sqlSession.selectList(namespace+".getStores");

        return stores;
    }
}
