package com.foodhunter.service;

import com.foodhunter.DTO.Category;
import com.foodhunter.DAO.CategoryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryDAO categoryDAO;

    @Override
    public int insertCategory(Category category) {
        return categoryDAO.insertCategory(category);
    }

    @Override
    public int deleteCategory(int category_id) {
        return categoryDAO.deleteCategory(category_id);
    }

    @Override
    public int updateCategory(Category category) {
        return categoryDAO.updateCategory(category);
    }

    @Override
    public Category getCategory(int category_id) {
        return categoryDAO.getCategory(category_id);
    }

    @Override
    public List<Category> getCategoryList() {
        return categoryDAO.getCategoryList();
    }

    @Override
    public List<Category> getCategoryListByRequestStatus(int requestStatus) {
        return categoryDAO.getCategoryListByRequestStatus(requestStatus);
    }
}
