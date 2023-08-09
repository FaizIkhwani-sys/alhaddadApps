import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class RegisterAgentStokisState extends ChangeNotifier
    with
        TextControllerMixin,
        UserNameMixin,
        PasswordMixin,
        PhoneMixin,
        NameMixin,
        EmailMixin {
  void validateAll() {
    validateName();
    validateUserName();
    validatePhone();
    validateEmail();
    validatePassword();
  }

  bool _termsAndCondition = false;
  bool get termsAndCondition => _termsAndCondition;
  set termsAndCondition(bool value) {
    _termsAndCondition = value;
    notifyListeners();
  }
}
