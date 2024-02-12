import 'package:flutter/material.dart';
class ValidationUtil {
  String? validatePassword(BuildContext context, String password) {
    if (!validateNotEmpty(password)) {
      return "password_required";
    }
    if (password.length < 8 || password.length > 15) {
      return 'password_must_be_8_or_15_char';
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
       'password_must_contain_upper_case';
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      'password_must_contain_lower_case';
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      'password_must_contain_number';
    }

    if (!password.contains(RegExp(r'[!@#\$%^&*()_\-+={}[\]|;:"<>,.?/]'))) {
      'password_must_contain_special_char';
    }

    // for (int i = 0; i < password.length - 1; i++) {
    //   if (password[i] == password[i + 1]) {
    //     return getLangStr(context, 'password_must_not_repeat');
    //   }
    // }

    return null;
  }

  bool validateNotEmpty(String? text) => text?.trim().isNotEmpty ?? false;

  bool validateEmail(String? email) => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(email ?? "");

  bool validateMobile(String? mobile) {
    String pattern =
        r'^(?:0|94|\+94|0094)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|91)(0|2|3|4|5|7|9)|7(0|1|2|4|5|6|7|8)\d)\d{6}$';
    return RegExp(pattern).hasMatch(mobile ?? "");
  }

  bool validateNic(String? nic) =>
      RegExp(r"^([0-9]{9}[x|X|v|V]|[0-9]{12})$").hasMatch(nic ?? "");

  bool validateUsername(String? username) =>
      RegExp(r'^([a-zA-Z0-9])+$').hasMatch(username ?? "");

  bool validateTwoNames(String? text) =>
      RegExp(r'^([a-zA-Z]+) ([a-zA-Z]+)').hasMatch(text ?? "");

  bool validateAmount(String? amount) {
    if (amount?.trim().isEmpty ?? true) {
      return false;
    }

    amount = amount!.replaceAll(',', '');

    if ((double.tryParse(amount) ?? 0) <= 0) {
      return false;
    }
    return true;
  }

}