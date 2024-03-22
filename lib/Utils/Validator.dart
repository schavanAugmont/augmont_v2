class Validator {
  static const String buyHome = "BuyHome";

  static bool validateMobileNumber({required String number}) {
    if (number.isEmpty) {
      return false;
    } else if (number.length < 10) {
      return false;
    } else if (!RegExp(r'^[6-9]{1}[0-9]{9}$').hasMatch(number.trim())) {
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

  static bool validateEmailAddress(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    print('$emailValid email');
    return emailValid;
  }
}
