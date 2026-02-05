package vietphan.com.laptopshop.controller.admin;

import vietphan.com.laptopshop.domain.User;
import vietphan.com.laptopshop.repository.UserRepository;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vietphan.com.laptopshop.service.UserService;

@Controller
public class UserController {

    private final UserService userService;
    

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model){
        List<User> users = this.userService.getUsersByEmail("vietqhoa0210@gmail.com");
        System.out.println(users);
        model.addAttribute("users", users);
        model.addAttribute("message", "test");
        return "hello";
    }

    @RequestMapping("/admin/user/create")
    public String createUserPage(Model model){
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model){
        model.addAttribute("users", this.userService.getAllUsers());
        return "admin/user/detail";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable("id") Long id){
        System.out.println("Fetching user id: " + id);
        model.addAttribute("user", this.userService.getUserById(id));
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable("id") Long id){
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/update";
    }

    @RequestMapping(value = "/admin/user/update", method = RequestMethod.POST)
    public String postUpdateUser(@ModelAttribute("user") User user, @RequestParam(name = "avatarFile", required = false) MultipartFile avatarFile){
        this.userService.updateUser(user, avatarFile);
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User user, @RequestParam(name = "avatarFile", required = false) MultipartFile avatarFile){
        System.out.println("run here" + user);
        this.userService.handleUserCreation(user, avatarFile);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/delete/{id}")
    public String deleteUserPage(Model model, @PathVariable("id") Long id){
        model.addAttribute("id",id);
        model.addAttribute("newUser",new User());
        // this.userService.deleteUserById(id);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUserPage(Model model, @ModelAttribute("newUser") User user){
        this.userService.deleteUserById(user.getId());
        return "redirect:/admin/user";
    }
}



