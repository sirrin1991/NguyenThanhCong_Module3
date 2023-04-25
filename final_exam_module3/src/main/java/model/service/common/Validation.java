package model.service.common;

import java.util.regex.Pattern;

public class Validation {
    private static final String NAME= "^[A-Z][a-z]*(\\ [A-Z][a-z]*)*$";
    private static final String QUANTITY = "^[1-9]+\\d*$";
    private static final String ALL_MONEY = "^(([1-9]+\\d*)|0)\\.?\\d{1,2}$";

    public static boolean validateName(String string) {
        return Pattern.matches(NAME, string);
    }
    public static boolean validateQuantity(String string) {
        return Pattern.matches(QUANTITY, string);
    }
    public static boolean validateAllMoney(String string) {
        return Pattern.matches(ALL_MONEY, string);
    }
}
