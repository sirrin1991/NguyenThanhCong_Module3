package model.service;

import model.service.common.EmailException;

import java.util.regex.Pattern;

public class Validation {
    private static final String NAME = "^[A-Z][a-z]*(\\ [A-Z][a-z]*)*$";
    private static final String EMAIL = "^[a-z]+([\\_\\.]?[a-z\\d]+)*@[a-z]{3,7}\\.[a-z]{3}$";
    public static boolean validateName(String string) {
        return Pattern.matches(NAME, string);
    }
    public static boolean validateEmail(String string) {
        try {
            if (Pattern.matches(EMAIL, string)) {
                return true;
            } else {
                throw new EmailException("Invalid format (ex : abc@abc.abc)");
            }
        } catch (EmailException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }
}
