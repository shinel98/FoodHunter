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

    /**카테고리 추가 신청(requestStatus = 1)**/
    public StoreCategory save(StoreCategory storeCategory){
        storeCategoryDAOImpl.save(storeCategory);
        return storeCategory;
    }
}
