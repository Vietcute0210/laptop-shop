package vietphan.com.laptopshop.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class StrongPasswordValidator implements ConstraintValidator<StrongPassword, String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        // null values should be handled by @NotNull or @NotEmpty if required
        if (value == null || value.isEmpty()) {
            return true;
        }

        // Regex for: at least 8 characters, one uppercase, one lowercase, one number, and one special character
        return value.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$");
    }
}
