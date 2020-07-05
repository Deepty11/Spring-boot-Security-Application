package com.rehnuma.springbootsecurity.service;

import com.rehnuma.springbootsecurity.model.Role;
import com.rehnuma.springbootsecurity.model.User;
import com.rehnuma.springbootsecurity.repositories.RoleRepository;

import com.rehnuma.springbootsecurity.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import java.util.Arrays;
import java.util.HashSet;
@Service
public class UserServiceImp implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);

    }

    @Override
    public void saveUser(User user) {
        System.out.println("I am userServiceImp");
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Role userRole= roleRepository.findByRole("Admin");

        user.setActive(1);
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);

    }
}
