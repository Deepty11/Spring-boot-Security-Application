package com.rehnuma.springbootsecurity.service;

import com.rehnuma.springbootsecurity.model.Role;

public interface RoleService {
    public Role findByRole(String name);
}
