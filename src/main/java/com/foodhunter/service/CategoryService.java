package com.foodhunter.service;

import com.foodhunter.DTO.Category;

import java.util.List;

public interface CategoryService {
    public int insertCategory(Category category);
    public int deleteCategory(int category_id);
    public int updateCategory(Category category);
    public Category getCategory(int category_id);
    public List<Category> getCategoryList();
    public List<Category> getCategoryListByRequestStatus(int requestStatus);
}
