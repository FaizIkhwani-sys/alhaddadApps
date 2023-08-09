import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

mixin PhoneMixin on ChangeNotifier {
  String _phone = '';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
    validatePhone();
  }

  String? _phoneError = '';
  String? get phoneError => _phoneError;
  bool get phoneHasError => !_phoneError.isNullOrWhiteSpace;

  void validatePhone() {
    try {
      _phoneError = null;
      if (phone.isNullOrWhiteSpace) {
        _phoneError = 'No. telefon perlu diisi';
      } else if (!phone.isPhoneNumber) {
        _phoneError = 'No. telefon tidak sah';
      }
    } finally {
      notifyListeners();
    }
  }
}
