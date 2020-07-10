package com.rehnuma.springbootsecurity.configurations;

import com.rehnuma.springbootsecurity.model.Role;
import com.rehnuma.springbootsecurity.model.User;
import com.rehnuma.springbootsecurity.repositories.UserRepository;
import com.rehnuma.springbootsecurity.service.UserInfoDetails;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.HashSet;
import java.util.Set;

@Service
public class UserDetailsImpl implements UserDetailsService {
    @Autowired
    UserRepository userRepository;

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("I am in loadUserByUsername");
        User user=userRepository.findByEmail(username);
        if(user==null){
            throw new UsernameNotFoundException("Username not found ");
        }

        UserInfoDetails userInfoDetails= new UserInfoDetails(user);


        return userInfoDetails;

    }

}
