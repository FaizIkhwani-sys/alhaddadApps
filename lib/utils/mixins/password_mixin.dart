import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

mixin PasswordMixin on ChangeNotifier {
  String? _password;
  String? get password => _password;
  set password(String? value) {
    _password = value;
    validatePassword();
  }

  String? _confirmPassword = '';
  String? get confirmPassword => _confirmPassword;
  set confirmPassword(String? value) {
    _confirmPassword = value;
    validateConfirmPassword();
  }

  String? _passwordError = '';
  String? get passwordError => _passwordError;
  bool get passwordHasError => !_passwordError.isNullOrWhiteSpace;

  String? _confirmPasswordError = '';
  String? get confirmPasswordError => _confirmPasswordError;
  bool get confirmPasswordHasError => !_confirmPasswordError.isNullOrWhiteSpace;

  void validatePassword() {
    try {
      _passwordError = null;
      if (password.isNullOrWhiteSpace) {
        _passwordError = '*required';
      }
    } finally {
      notifyListeners();
    }
  }

  void validateConfirmPassword() {
    try {
      _confirmPasswordError = null;
      if (confirmPassword.isNullOrWhiteSpace) {
        _confirmPasswordError = '*required';
      } else if (confirmPassword != password) {
        _confirmPasswordError = 'password do not match';
      }
    } finally {
      notifyListeners();
    }
  }
}
