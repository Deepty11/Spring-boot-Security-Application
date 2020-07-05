package com.rehnuma.springbootsecurity.configurations;

import com.rehnuma.springbootsecurity.model.Role;
import com.rehnuma.springbootsecurity.model.User;
import com.rehnuma.springbootsecurity.repositories.UserRepository;
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
public class userDetailsImpl implements UserDetailsService {
    @Autowired
    UserRepository userRepository;
    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user=userRepository.findByEmail(username);
        Set<GrantedAuthority> grantedAuthorities=new HashSet<>();
        for(Role roles:user.getRoles()){
            grantedAuthorities.add(new SimpleGrantedAuthority(roles.getName()));
        }
        return new org.springframework.security.core.userdetails.User(user.getEmail(),user.getPassword(),grantedAuthorities) ;
    }
}
