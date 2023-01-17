package com.foodhunter.service;

import com.foodhunter.DAO.UserDAO;
import com.foodhunter.DTO.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    UserDAO dao;

    @Override
    public int insertUser(User user) {
        return dao.insertUser(user);
    }

    @Override
    public int deleteUser(int id) {
        return dao.deleteUser(id);
    }

    @Override
    public User getUser(int id) {
        return dao.getUser(id);
    }

    @Override
    public int readUserByEmail(String email) {
        return dao.readUserByEmail(email);
    }

    @Override
    public int updateProfile(User user) {
        return dao.updateProfile(user);
    }
}
