package com.rehnuma.springbootsecurity.service;

import com.rehnuma.springbootsecurity.model.User;

public interface UserService  {
    public User findByEmail(String email);
    public void saveUser(User user);
}
