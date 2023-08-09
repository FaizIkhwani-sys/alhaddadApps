import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

mixin UserNameMixin on ChangeNotifier {
  String? _userName;
  String? get userName => _userName;
  set userName(String? value) {
    _userName = value;
    validateUserName();
  }

  String? _userNameError = '';
  String? get userNameError => _userNameError;
  bool get userNameHasError => !_userNameError.isNullOrWhiteSpace;

  void validateUserName() {
    try {
      _userNameError = null;
      if (userName.isNullOrWhiteSpace) {
        _userNameError = 'Username is needed.';
        return;
      }
      // if (userName!.length < 12) {
      //   _userNameError = 'No. kad pengenalan tidak sah';
      //   return;
      // }
    } finally {
      notifyListeners();
    }
  }
}
