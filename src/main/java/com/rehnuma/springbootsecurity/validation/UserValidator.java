package com.rehnuma.springbootsecurity.validation;

import com.rehnuma.springbootsecurity.model.User;
import com.rehnuma.springbootsecurity.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
@Component
public class UserValidator implements Validator {
    @Autowired
    private UserService userService;
    public UserValidator() {
        super();
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {
        System.out.println("Target's class name:"+target.getClass());
        User user=(User) target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"name","NotEmpty");
        if (user.getName().length() < 6 || user.getName().length() > 32) {
            errors.rejectValue("name", "Size.userForm.username");
        }
        if (userService.findByEmail(user.getEmail()) != null) {
            errors.rejectValue("name", "Duplicate.userForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 6 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }

    }
}
