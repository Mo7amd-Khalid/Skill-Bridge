abstract class GetStrengthOfPassword {

  static bool  hasUppercase(String password) => RegExp(r'[A-Z]').hasMatch(password);

  static bool hasLowercase(String password) => RegExp(r'[a-z]').hasMatch(password);

  static bool hasDigit(String password) => RegExp(r'[0-9]').hasMatch(password);

  static bool hasSpecialCharacter(String password) =>
      RegExp(r'[^A-Za-z0-9]').hasMatch(password);

  static bool hasMinLength(String password) => password.length >= 8;

  static int strength(String password) =>
      [
        hasUppercase(password),
        hasLowercase(password),
        hasDigit(password),
        hasSpecialCharacter(password),
        hasMinLength(password),
      ]
          .where((rule) => rule)
          .length;

}