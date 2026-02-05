package vietphan.com.laptopshop.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vietphan.com.laptopshop.domain.Product;
import vietphan.com.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository){
        this.productRepository = productRepository;
    }

    public List<Product> getAllProducts(){
        return this.productRepository.findAll();
    }

    public Product saveProduct(Product product, MultipartFile productFile){
        if(productFile != null && !productFile.isEmpty()){
            try{
                String fileName = UUID.randomUUID().toString() + "_" + productFile.getOriginalFilename();
                // Define the path to save the uploaded file
                Path uploadDir = Paths.get("src/main/webapp/resources/images/products");
                if(!Files.exists(uploadDir)){
                    Files.createDirectories(uploadDir);
                } 
                Files.copy(productFile.getInputStream(), uploadDir.resolve(fileName), StandardCopyOption.REPLACE_EXISTING);
                product.setImage(fileName);
            } catch (IOException e) {
                System.err.println("Failed to save product image: " + e.getMessage());
            }
        }
        return this.productRepository.save(product);
    }

    public Product getProductById(long id){
        return this.productRepository.findById(id).orElse(null);
    }

    public void deleteProductById(long id){
        this.productRepository.deleteById(id);
    }

    public Product updateProduct(Product product, MultipartFile productFile) {
        Product existingProduct = this.productRepository.findById(product.getId()).orElse(null);
        if (existingProduct != null) {
            existingProduct.setName(product.getName());
            existingProduct.setPrice(product.getPrice());
            existingProduct.setShortDesc(product.getShortDesc());
            existingProduct.setDetailDesc(product.getDetailDesc());
            existingProduct.setQuantity(product.getQuantity());
            existingProduct.setSold(product.getSold());
            existingProduct.setFactory(product.getFactory());
            existingProduct.setTarget(product.getTarget());

            // Handle image update
            if (productFile != null && !productFile.isEmpty()) {
                try {
                    String fileName = UUID.randomUUID().toString() + "_" + productFile.getOriginalFilename();
                    Path uploadDir = Paths.get("src/main/webapp/resources/images/products");
                    if (!Files.exists(uploadDir)) {
                        Files.createDirectories(uploadDir);
                    }
                    Files.copy(productFile.getInputStream(), uploadDir.resolve(fileName), StandardCopyOption.REPLACE_EXISTING);
                    existingProduct.setImage(fileName);
                } catch (IOException e) {
                    System.err.println("Failed to update product image: " + e.getMessage());
                }
            }

            return this.productRepository.save(existingProduct);
        }
        return null;
    }
}
