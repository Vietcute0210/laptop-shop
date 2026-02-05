package vietphan.com.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class ItemController {
    
    @GetMapping("/product/{id}")
    public String getMethodName(@PathVariable("id") Long id) {
        return "client/product/detail";
    }
}
