package com.rehnuma.springbootsecurity.service;

import com.rehnuma.springbootsecurity.model.Role;
import com.rehnuma.springbootsecurity.model.RoleType;
import com.rehnuma.springbootsecurity.model.User;
import com.rehnuma.springbootsecurity.repositories.RoleRepository;

import com.rehnuma.springbootsecurity.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserServiceImp implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(User user)  {
        System.out.println("I am userServiceImp --> saveUser(User user) :");

        Set<Role> roles=new HashSet<>();
        roles.add(new Role(RoleType.ROLE_USER));

        user.setRoles(roles);
        user.setActive(1);
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }
}
