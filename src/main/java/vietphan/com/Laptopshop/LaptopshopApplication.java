package vietphan.com.laptopshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// @SpringBootApplication
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import vietphan.com.laptopshop.repository.RoleRepository;
import vietphan.com.laptopshop.domain.Role;

@SpringBootApplication(exclude =
org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class LaptopshopApplication {

	public static void main(String[] args) {
		SpringApplication.run(LaptopshopApplication.class, args);
	}

	@Bean
	public CommandLineRunner init(RoleRepository roleRepository) {
		return args -> {
			if (roleRepository.count() == 0) {
				Role userRole = new Role();
				userRole.setName("USER");
				userRole.setDescription("User role");
				roleRepository.save(userRole);

				Role adminRole = new Role();
				adminRole.setName("ADMIN");
				adminRole.setDescription("Admin role");
				roleRepository.save(adminRole);
			}
		};
	}
}
