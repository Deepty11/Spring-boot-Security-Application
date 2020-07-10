package com.rehnuma.springbootsecurity.controller;

import com.rehnuma.springbootsecurity.model.User;
import com.rehnuma.springbootsecurity.service.UserInfoDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AnonymousAuthenticationProvider;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    public static User getLoggedInUser() {
        Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        if(authentication instanceof AnonymousAuthenticationToken){
            logger.error("Not logged in");
            return null;
        }
        UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken)authentication;

        if (!(auth.getPrincipal() instanceof UserInfoDetails)) {
            throw new IllegalArgumentException("Principal cannot be null");
        }
        return ((UserInfoDetails) auth.getPrincipal()).getUser();

    }
    @GetMapping("/login")
    public String login(HttpServletRequest request){
        if(getLoggedInUser()!=null){
            return "redirect:/home";
        }
        request.setAttribute("mode","MODE_LOGIN");
        return "index";
    }

    @PostMapping("/doLogin")
    public void loginProcess(){
        getLoggedInUser();
    }

    @RequestMapping("/logout")
    public String logout(){
        SecurityContextHolder.getContext().setAuthentication(null);
        return "redirect:/login";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(Model map){
        User user=getLoggedInUser();
        map.addAttribute("user",user);
        return "home";
    }
}
