package com.foodhunter.DAO;

import com.foodhunter.DTO.StoreCategory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class StoreCategoryDAOImpl implements StoreCategoryDAO{

    SqlSession sqlSession;

    @Autowired
    public StoreCategoryDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public StoreCategory save(StoreCategory storeCategory) {
        sqlSession.insert("storeCategory.insertCategory", storeCategory);
        return storeCategory;
    }
}
