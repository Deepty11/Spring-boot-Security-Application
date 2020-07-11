package com.rehnuma.springbootsecurity.controller;


import com.rehnuma.springbootsecurity.model.User;
import com.rehnuma.springbootsecurity.service.UserInfoDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.nio.file.attribute.UserPrincipalNotFoundException;

@Controller
public class ProfileInfoController {

    private static final Logger log= LoggerFactory.getLogger(ProfileInfoController.class);

    public static User getLoggedInUser(){
        Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
        if(authentication instanceof AnonymousAuthenticationToken){
            log.debug("Not logged in");
        }

        UsernamePasswordAuthenticationToken auth= (UsernamePasswordAuthenticationToken) authentication;
        if(!(auth.getPrincipal() instanceof UserInfoDetails)){
            throw new IllegalArgumentException("Principal cannot be null");
          }
        return ((UserInfoDetails) auth.getPrincipal()).getUser();
     }



    @RequestMapping("/profile")
    public String showProfile(HttpServletRequest request, Model map){

        User user =getLoggedInUser();
        map.addAttribute("user",user);
        request.setAttribute("mode","MODE_PROFILE");
        return "home";
    }
}
