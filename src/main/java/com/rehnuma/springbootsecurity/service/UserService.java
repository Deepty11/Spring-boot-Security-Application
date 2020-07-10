package com.rehnuma.springbootsecurity.service;

import com.rehnuma.springbootsecurity.model.User;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.IOException;

public interface UserService  {
    public User findByEmail(String email);
    public void saveUser(User user);
}
