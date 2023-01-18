package com.foodhunter.service;

import com.foodhunter.DAO.StoreCategoryDAOImpl;
import com.foodhunter.DTO.StoreCategory;
import org.springframework.beans.factory.annotation.Autowired;

public class StoreCategoryService {
    private StoreCategoryDAOImpl storeCategoryDAOImpl;

    @Autowired
    public StoreCategoryService(StoreCategoryDAOImpl storeCategoryDAOImpl) {
        this.storeCategoryDAOImpl = storeCategoryDAOImpl;
    }

    public StoreCategory save(StoreCategory storeCategory){
        storeCategoryDAOImpl.save(storeCategory);
        return storeCategory;
    }
}
