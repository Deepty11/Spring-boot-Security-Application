package com.rehnuma.springbootsecurity.service;

import com.rehnuma.springbootsecurity.model.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.stream.Collectors;

public class UserInfoDetails implements UserDetails {

    private User user;

    public User getUser(){
        return user;
    }

    public UserInfoDetails(User user){
        this.user=user;
    }

    public UserInfoDetails() {

        super();
    }



    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

        return user.getRoles()
                .stream()
                .map(auth->new SimpleGrantedAuthority(auth.getRoleType().toString())).collect(Collectors.toList());
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
