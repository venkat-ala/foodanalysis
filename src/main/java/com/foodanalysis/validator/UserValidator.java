package com.foodanalysis.validator;

import static org.apache.commons.lang3.StringUtils.isNotEmpty;
import static org.springframework.validation.ValidationUtils.rejectIfEmptyOrWhitespace;

import org.apache.commons.validator.EmailValidator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.foodanalysis.model.User;

@SuppressWarnings("deprecation")
@Component
public class UserValidator implements Validator {

  @Override
  public boolean supports(Class<?> cls) {
    return User.class.isAssignableFrom(cls);
  }

  @Override
  public void validate(Object target, Errors errors) {
    rejectIfEmptyOrWhitespace(errors, "name", "err_first_name", "Name is Required");
    rejectIfEmptyOrWhitespace(errors, "email", "err_email", "Email is required");
    rejectIfEmptyOrWhitespace(errors, "passwordString", "err_pass_req", "Password is required");
    rejectIfEmptyOrWhitespace(errors, "confirmPasswordString", "err_conf_pass_req",
        "Confirm Password is required");
    User user = (User) target;
    if (user.getAge().equals("NONE")) {
      errors.rejectValue("age", "err_age", "Age is Required");
    }
    if (!EmailValidator.getInstance().isValid(user.getEmail())) {
      errors.rejectValue("email", "err_email_invalid", "Invalid email");
    }
    if (isNotEmpty(user.getPhone())
        && (!isValidNumber(user.getPhone()) || user.getPhone().length() != 10)) {
      errors.rejectValue("phone", "err_phone", "Invalid  phone");
    }

    if (user.getPasswordString() != null
        && !user.getPasswordString().equals(user.getConfirmPasswordString())) {
      errors.rejectValue("passwordString", "err_pass_mismatch",
          "Password and Confirm Password mismatch");
    } else if (user.getPasswordString() != null && user.getPasswordString().length() < 5) {
      errors.rejectValue("passwordString", "err_pass_len",
          "Password should be atleast 5 character.");
    }
  }

  private static boolean isValidNumber(String number) {
    return number.matches("[0-9]+");
  }


}
