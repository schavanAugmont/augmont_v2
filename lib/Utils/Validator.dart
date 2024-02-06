class Validator {
  static const String buyHome = "BuyHome";

  static bool validateMobileNumber({required String number}) {
    if (number.isEmpty) {
      return false;
    } else if (number.length < 10) {
      return false;
    }
    return true;
  }

  static bool validateOtp(String pin) {
    if (pin.isEmpty) {
      return false;
    } else if (pin.length < 6) {
      return false;
    }
    return true;
  }
}
