package vietphan.com.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vietphan.com.laptopshop.service.ProductService;


@Controller
public class ItemController {
    
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getMethodName(Model model,@PathVariable("id") Long id) {
        model.addAttribute("product", this.productService.getProductById(id));
        return "client/product/detail";
    }
}
