package vietphan.com.laptopshop.controller;

import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vietphan.com.laptopshop.service.UserService;

// @Controller
// public class UserController {

//     @RequestMapping("/")
//     public String getHomePage(){
//         return "hello from controller";
//     }
// }

@RestController
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping("/")
    public String getHomePage(){
        return this.userService.handleHello();
    }
}

