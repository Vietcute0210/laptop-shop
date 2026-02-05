package vietphan.com.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vietphan.com.laptopshop.domain.Product;
import vietphan.com.laptopshop.service.ProductService;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        model.addAttribute("products", this.productService.getAllProducts());
        return "admin/product/show";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(Model model, @ModelAttribute("newProduct") Product newProduct,
            @RequestParam(name = "productFile", required = false) MultipartFile productFile) {
        this.productService.saveProduct(newProduct, productFile);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable("id") long id) {
        model.addAttribute("product", this.productService.getProductById(id));
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable("id") long id) {
        Product pr = new Product();
        pr.setId(id);
        model.addAttribute("newProduct", pr);
        model.addAttribute("product", this.productService.getProductById(id));
        return "admin/product/delete";
    }               

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product product) {
        this.productService.deleteProductById(product.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable("id") long id) {
        Product pr = this.productService.getProductById(id);
        model.addAttribute("product", pr);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model, @ModelAttribute("product") Product product,
            @RequestParam(name = "productFile", required = false) MultipartFile productFile) {
        this.productService.updateProduct(product, productFile);
        return "redirect:/admin/product";
    }
}