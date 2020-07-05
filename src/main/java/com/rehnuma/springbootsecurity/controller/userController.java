package com.rehnuma.springbootsecurity.controller;

import com.rehnuma.springbootsecurity.model.User;
import com.rehnuma.springbootsecurity.service.UserServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class userController {
    @Autowired
    private UserServiceImp userServiceImp;
    @RequestMapping("/")
    public String welcome(HttpServletRequest request){
        request.setAttribute("mode","MODE_HOME");
        return "index";
    }
    @RequestMapping("/signUp")
    public String registration(HttpServletRequest request){
        request.setAttribute("mode","MODE_REGISTRATION");
        return "index";
    }
    @PostMapping("/signUp/saveUser")
    public String registerUser(@ModelAttribute User user, BindingResult result,HttpServletRequest request){
        System.out.println("hello");
        System.out.println(user.getId());
        System.out.println(user.getName());
        System.out.println(user.getEmail());
        System.out.println(user.getPassword());
        System.out.println(user.getContact());

        userServiceImp.saveUser(user);
        request.setAttribute("mode","MODE_HOME");
        System.out.println("saved!");
        return "index";
    }
    @RequestMapping("/login")
    public String login(HttpServletRequest request,String error, String logout){
        if(error!=null){
            request.setAttribute("error","Email or password is invalid");
        }
        if(logout!=null){
            request.setAttribute("logout","You have successfully logged out!");
        }
        request.setAttribute("mode","MODE_LOGIN");
        return "index";
    }
}
