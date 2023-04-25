package common;

import java.util.regex.Pattern;

public class Validation {
    private static final String NAME_OR_ADDRESS = "^([\\p{Lu}][\\p{Ll}]{1,8})(\\s([\\p{Lu}]|[\\p{Lu}][\\p{Ll}]{1,10})){0,5}$";
    private static final String EMAIL = "^[a-z]+([\\_\\.]?[a-z\\d]+)*@[a-z]{3,7}\\.[a-z]{3}$";
    private static final String FORMAT_DATE = "^\\d{2}\\-\\d{2}\\-\\d{4}$";
    private static final String DATE ="^((18|19|20)[0-9]{2}[\\-.](0[13578]|1[02])[\\-.](0[1-9]|[12][0-9]|3[01]))|(18|19|20)[0-9]{2}[\\-.](0[469]|11)[\\-.](0[1-9]|[12][0-9]|30)|(18|19|20)[0-9]{2}[\\-.](02)[\\-.](0[1-9]|1[0-9]|2[0-8])|(((18|19|20)(04|08|[2468][048]|[13579][26]))|2000)[\\-.](02)[\\-.]29$";
//    private static final String DATE_DD_MM_YYYY ="^(?:(?:31(/|-|.)(?:0?[13578]|1[02]))\\1|(?:(?:29|30)(/|-|.)(?:0?[13-9]|1[0-2])\\2))(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$|^(?:29(/|-|.)0?2\\3(?:(?:(?:1[6-9]|[2-9]\\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\\d|2[0-8])(/|-|.)(?:(?:0?[1-9])|(?:1[0-2]))\\4(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$";
    public static boolean validateNameOrAddress(String string) {
        return Pattern.matches(NAME_OR_ADDRESS, string);
    }
    public static boolean validateEmail(String string) {
        return Pattern.matches(EMAIL, string);
    }
    public static boolean validateFormatDate(String string){
        return Pattern.matches(FORMAT_DATE,string);
    }
    public static boolean validateDate(String string){
        return Pattern.matches(DATE,string);
    }
}
