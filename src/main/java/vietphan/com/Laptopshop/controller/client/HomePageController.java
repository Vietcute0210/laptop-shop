package vietphan.com.laptopshop.controller.client;

import vietphan.com.laptopshop.domain.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import vietphan.com.laptopshop.domain.dto.RegisterDTO;
import vietphan.com.laptopshop.service.ProductService;
import vietphan.com.laptopshop.service.UserService;
import org.springframework.validation.BindingResult;
import jakarta.validation.Valid;


@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;


    public HomePageController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }
    
    @GetMapping("")
    public String getHomePage(Model model) {
        model.addAttribute("products",this.productService.getAllProducts());
        return "client/homepage/show";
    }
    
    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("newRegister") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);
        this.userService.handleUserCreation(user, null);
        return "redirect:/login";
    }


    @GetMapping("/register")
    public String getRegisterPageGet(Model model) {
        model.addAttribute("newRegister", new RegisterDTO());
        return "client/auth/register";
    }

    @GetMapping("/login")
    public String getLoginPageGet(Model model) {
        return "client/auth/login";
    }
}
