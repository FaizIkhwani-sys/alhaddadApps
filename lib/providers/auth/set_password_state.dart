import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class SetPasswordPageState extends ChangeNotifier
    with EmailMixin, PasswordMixin {
  void validateAll() {
    validateEmail();
    validatePassword();
  }
}
