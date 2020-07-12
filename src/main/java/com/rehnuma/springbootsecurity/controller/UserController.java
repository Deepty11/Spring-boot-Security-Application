package com.rehnuma.springbootsecurity.controller;

import com.rehnuma.springbootsecurity.model.Role;
import com.rehnuma.springbootsecurity.model.RoleType;
import com.rehnuma.springbootsecurity.model.User;
import com.rehnuma.springbootsecurity.service.UserServiceImp;

import com.rehnuma.springbootsecurity.validation.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.Set;


@Controller
public class UserController {
    //will create a directory "upload" under the project directory
    public static String uploadDirectory=System.getProperty("user.dir")+"/src/main/webapp/resources/user_Images";

    @Autowired
    private UserServiceImp userServiceImp;

    @Autowired
    private UserValidator userValidator;

    @GetMapping("/")
    public String getWelcome(HttpServletRequest request){
        request.setAttribute("mode","MODE_WELCOME");
        return "index";
    }

    @GetMapping( "/signUp")
    public String getRegistration(HttpServletRequest request, Model model){
        model.addAttribute("user",new User());
        request.setAttribute("mode","MODE_REGISTRATION");
        return "index";
    }

    @PostMapping("/signUp")
    public String registerUser(@ModelAttribute("user") User user , BindingResult result, HttpServletRequest request) throws IOException {

        MultipartFile file=user.getFile();
        StringBuilder fileName=new StringBuilder();
        Path path= Paths.get(uploadDirectory,file.getOriginalFilename());
        fileName.append(file.getOriginalFilename());


        user.setFile_name(fileName.toString());



        userValidator.validate(user,result);
        System.out.println("I am in registration post ");
        if(result.hasErrors()){
            request.setAttribute("mode","MODE_REGISTRATION");
            return "index";
        }

        userServiceImp.saveUser(user);
        Files.write(path,file.getBytes()); //write the file in "user_images" directory
        System.out.println("saved!");
        request.setAttribute("check","true");
        request.setAttribute("success","Registration is done successfully!");
        request.setAttribute("mode","MODE_REGISTRATIONSUCCESSFUL");
        return "index";
    }



}
