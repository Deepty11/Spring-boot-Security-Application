package com.rehnuma.springbootsecurity.service;

import com.rehnuma.springbootsecurity.model.Role;
import com.rehnuma.springbootsecurity.repositories.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceimp implements RoleService {
    @Autowired
    private RoleRepository roleRepository;
    @Override
    public Role findByRole(String name) {
        return roleRepository.findByRole(name);
    }
}
