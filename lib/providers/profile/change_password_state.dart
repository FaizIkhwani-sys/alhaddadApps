import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class ChangePasswordPageState extends ChangeNotifier with PasswordMixin {
  String? _newPassword;
  String? get newPassword => _newPassword;
  set newPassword(String? value) {
    _newPassword = value;
    validateNewPassword();
  }

  String? _newPasswordError = '';
  String? get newPasswordError => _newPasswordError;
  bool get newPasswordHasError => !_newPasswordError.isNullOrWhiteSpace;

  void validateNewPassword() {
    try {
      _newPasswordError = null;
      if (newPassword.isNullOrWhiteSpace) {
        _newPasswordError = 'Kata laluan baru perlu diisi';
      }
    } finally {
      notifyListeners();
    }
  }

  void validateAll() {
    validatePassword();
    validateNewPassword();
  }
}
