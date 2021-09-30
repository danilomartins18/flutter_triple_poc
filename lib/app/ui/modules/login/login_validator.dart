import 'package:flutter/material.dart';
import 'package:flutter_triple_poc/app/core/constants/regex_constants.dart';

class LoginValidator {
  String? validateEmail(String email, BuildContext context) {
    if (email.isEmpty) return "O e-mail é obrigatório.";
    if (!RegExp(EMAILREGEX).hasMatch(email.trim())) return "O e-mail é inválido.";

    return null;
  }

  String? validatePassword(String password, BuildContext context) {
    if (password.isEmpty) return "A senha é obrigatória.";
    if (password.length < 5) return "A senha é inválida.";

    return null;
  }
}
