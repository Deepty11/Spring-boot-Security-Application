package com.rehnuma.springbootsecurity.validator;

import com.rehnuma.springbootsecurity.model.User;
import com.rehnuma.springbootsecurity.service.UserServiceImp;
import org.apache.el.util.Validation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.w3c.dom.ls.LSResourceResolver;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import java.io.IOException;
@Component
public class UserValidator implements Validator {
    @Autowired
    private UserServiceImp userServiceImp;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    static boolean isValid(String email) {
        String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        return email.matches(regex);
    }

    @Override
    public void validate(Object o, Errors error) {
        User user=(User) o;


        ValidationUtils.rejectIfEmptyOrWhitespace(error,"email","NotEmpty");
        if(!isValid(user.getEmail())){
            error.rejectValue("email","InvalidEmail");


        }
        if(user.getPassword().length()<4 && user.getPassword().length()>32){
            error.rejectValue("password","Size.userform.password");
        }


    }
}
