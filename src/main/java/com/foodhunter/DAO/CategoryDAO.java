package com.foodhunter.DAO;

import com.foodhunter.DTO.Category;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoryDAO {

    @Autowired
    SqlSession sqlSession;
    public int insertCategory(Category category) {
        return sqlSession.insert("Category.insertCategory", category);
    }
    public int deleteCategory(int category_id) {
        return sqlSession.delete("Category.deleteCategory", category_id);
    }
    public int updateCategory(Category category) {
        return sqlSession.update("Category.updateCategory", category);
    }
    public Category getCategory(int category_id) {
        return sqlSession.selectOne("Category.getCategory", category_id);
    }
    public List<Category> getCategoryList() {
        return sqlSession.selectList("Category.getCategoryList");
    }
    public List<Category> getCategoryListByRequestStatus(int requestStatus) {
        return sqlSession.selectList("Category.getCategoryListByRequestStatus", requestStatus);
    }
}
