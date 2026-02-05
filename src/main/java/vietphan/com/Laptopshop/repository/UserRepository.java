package vietphan.com.laptopshop.repository;

import vietphan.com.laptopshop.domain.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User user); 
    
    void deleteById(Long id);
    
    List<User> findByEmail(String email);
}
