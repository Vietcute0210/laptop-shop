package vietphan.com.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vietphan.com.laptopshop.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

}
