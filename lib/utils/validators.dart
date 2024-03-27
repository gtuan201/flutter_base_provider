import 'constants.dart';

class Validators {
  Validators._();

  static bool isEmpty(String? s) {
    if (s == null) return true;
    return s == Constants.EMPTY_STRING;
  }

  static bool isEmptyTime(DateTime? s) {
    if (s == null) return true;
    return false;
  }

  static bool isEmail(String email) {
    if (isEmpty(email)) {
      return false;
    }

    final emailRegexp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegexp.hasMatch(email);
  }

  static bool isSpecialChartPassword(String password) {
    if (isEmpty(password)) {
      return false;
    }
    final validCharacters = RegExp(r'^[a-zA-Z0-9@]+$');
    return validCharacters.hasMatch(password);
  }

  static bool isValidPassword(String password) {
    if (isEmpty(password)) {
      return false;
    }

    if (password.length < 6) {
      return password.length >= Constants.MINIMUM_PASSWORD_LENGTH;
    }

    return password.length >= Constants.MINIMUM_PASSWORD_LENGTH;
  }

  static bool isValidPhone(String phone) {
    if (isEmpty(phone)) {
      return false;
    }

    final phoneRegexp =
        RegExp(r'^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');
    return phone.length >= Constants.MINIMUM_PHONE_LENGTH &&
        phoneRegexp.hasMatch(phone);
  }
}
