package com.foodhunter.DAO;

import com.foodhunter.DTO.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{

    @Autowired
    private SqlSessionTemplate sqlSession;
    private String namespace = "user";
    @Override
    public int insertUser(User user) {
        int result = sqlSession.insert(namespace + ".insertUser", user);
        return result;
    }

    @Override
    public int deleteUser(int id) {
        int result = sqlSession.delete(namespace+".deleteUser", id);
        return result;
    }

    @Override
    public User getUser(int id) {
        User user = sqlSession.selectOne(namespace+".getUser", id);
        return user;
    }

    @Override
    public int readUserByEmail(String email) {
        int userId;
        try {
            userId = sqlSession.selectOne(namespace+".readUserByEmail", email);
        }catch(NullPointerException e){
            System.out.println(e);
            userId = 0;
        }
        return userId;
    }

    @Override
    public int updateProfile(User user) {
        int result = sqlSession.update(namespace+".updateProfile", user);
        return result;
    }
}
