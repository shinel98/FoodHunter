package com.foodhunter.service;

import com.foodhunter.DTO.User;

public interface UserService {
    public int insertUser(User user);
    public int deleteUser(int id);
    public User getUser(int id);
    public int readUserByEmail(String email);
    public int updateProfile(User user);
}
