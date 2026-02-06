package vietphan.com.laptopshop.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vietphan.com.laptopshop.domain.Role;
import vietphan.com.laptopshop.domain.User;
import vietphan.com.laptopshop.domain.dto.RegisterDTO;
import vietphan.com.laptopshop.repository.RoleRepository;
import vietphan.com.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public String handleHello() {
        return "hello from service";
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User handleUserCreation(User user, MultipartFile avatarFile) {
        if (user.getRole() != null) {
            Role r = this.roleRepository.findById(user.getRole().getId()).orElse(null);
            if (r != null) {
                user.setRole(r);
            }
        }

        // Handle avatar file upload
        if (avatarFile != null && !avatarFile.isEmpty()) {
            try {
                String fileName = UUID.randomUUID().toString() + "_" + avatarFile.getOriginalFilename();
                Path uploadDir = Paths.get("src/main/webapp/resources/images/avatars");
                if (!Files.exists(uploadDir)) {
                    Files.createDirectories(uploadDir);
                }
                Files.copy(avatarFile.getInputStream(), uploadDir.resolve(fileName), StandardCopyOption.REPLACE_EXISTING);
                user.setAvatar(fileName);
            } catch (IOException e) {
                // Log the exception (e.g., using SLF4J or System.err)
                System.err.println("Failed to upload avatar file: " + e.getMessage());
            }
        }

        String hashPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);

        return this.userRepository.save(user);
    }

    public User getUserById(Long id) {
        return this.userRepository.findById(id).orElse(null);
    }

    public User updateUser(User user, MultipartFile avatarFile) {
        User existingUser = this.userRepository.findById(user.getId()).orElse(null);
        if (existingUser != null) {
            existingUser.setFullName(user.getFullName());
            existingUser.setAddress(user.getAddress());
            existingUser.setPhone(user.getPhone());

            // Cập nhật role
            if (user.getRole() != null) {
                Role r = this.roleRepository.findById(user.getRole().getId()).orElse(null);
                if (r != null) {
                    existingUser.setRole(r);
                }
            }

            // cập nhật avt
            if (avatarFile != null && !avatarFile.isEmpty()) {
                try {
                    String fileName = UUID.randomUUID().toString() + "_" + avatarFile.getOriginalFilename();
                    Path uploadDir = Paths.get("src/main/webapp/resources/images/avatars");
                    if (!Files.exists(uploadDir)) {
                        Files.createDirectories(uploadDir);
                    }
                    Files.copy(avatarFile.getInputStream(), uploadDir.resolve(fileName), StandardCopyOption.REPLACE_EXISTING);
                    existingUser.setAvatar(fileName);
                } catch (IOException e) {
                    System.err.println("Failed to update avatar file: " + e.getMessage());
                }
            }

            return this.userRepository.save(existingUser);
        }
        return null;
    }

    public void deleteUserById(Long id) {
        this.userRepository.deleteById(id);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setEmail(registerDTO.getEmail());
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setPassword(registerDTO.getPassword());
        user.setRole(this.getRoleByName("USER"));
        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }
}
