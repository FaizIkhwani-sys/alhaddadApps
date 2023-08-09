import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class SettingState extends ChangeNotifier {
  final _settingRepo = SettingRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Setting>? _cartButton;
  List<Setting>? get cartButton => _cartButton;

  List<Setting>? _transactionButton;
  List<Setting>? get transactionButton => _transactionButton;

  List<Setting>? _addToCartButton;
  List<Setting>? get addToCartButton => _addToCartButton;

  List<Setting>? _quantityButton;
  List<Setting>? get quantityButton => _quantityButton;

  List<Setting>? _androidVersion;
  List<Setting>? get androidVersion => _androidVersion;

  List<Setting>? _iosVersion;
  List<Setting>? get iosVersion => _iosVersion;

  List<Setting>? _loginAdminButton;
  List<Setting>? get loginAdminButton => _loginAdminButton;

  List<Setting>? _signUpButton;
  List<Setting>? get signUpButton => _signUpButton;

  List<Setting>? _signUpURL;
  List<Setting>? get signUpURL => _signUpURL;

  List<Setting>? _privacyURL;
  List<Setting>? get privacyURL => _privacyURL;

  Future getCartButton() async {
    try {
      _isLoading = true;
      final response = await _settingRepo.getSetting('cartButton');

      if (response != null) {
        _cartButton = response;
      }
    } catch (e) {
      _cartButton = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getTransactionButton() async {
    try {
      _isLoading = true;
      final response = await _settingRepo.getSetting('transactionButton');

      if (response != null) {
        _transactionButton = response;
      }
    } catch (e) {
      _transactionButton = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getAddToCartButton() async {
    try {
      _isLoading = true;
      final response = await _settingRepo.getSetting('addToCartButton');

      if (response != null) {
        _addToCartButton = response;
      }
    } catch (e) {
      _addToCartButton = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getQuantityButton() async {
    try {
      _isLoading = true;
      final response = await _settingRepo.getSetting('quantityButton');

      if (response != null) {
        _quantityButton = response;
      }
    } catch (e) {
      _quantityButton = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getAndroidVersion() async {
    try {
      _isLoading = true;
      final response = await _settingRepo.getSettingPublic('androidVersion');

      if (response != null) {
        _androidVersion = response;
      }
    } catch (e) {
      _androidVersion = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getIOSVersion() async {
    try {
      _isLoading = true;
      final response = await _settingRepo.getSettingPublic('iOSVersion');

      if (response != null) {
        _iosVersion = response;
      }
    } catch (e) {
      _iosVersion = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getLoginAdminButton() async {
    try {
      _isLoading = true;
      final response = await _settingRepo.getSettingPublic('loginAdminButton');

      if (response != null) {
        _loginAdminButton = response;
      }
    } catch (e) {
      _loginAdminButton = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getSignUpButton() async {
    try {
      _isLoading = true;
      final response = await _settingRepo.getSettingPublic('signUpButton');

      if (response != null) {
        _signUpButton = response;
      }
    } catch (e) {
      _signUpButton = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getSignUpURL() async {
    try {
      _isLoading = true;
      final response = await _settingRepo.getSettingPublic('signUpURL');

      if (response != null) {
        _signUpURL = response;
      }
    } catch (e) {
      _signUpURL = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getPrivacyURL() async {
    try {
      _isLoading = true;
      final response = await _settingRepo.getSettingPublic('privacyURL');

      if (response != null) {
        _privacyURL = response;
      }
    } catch (e) {
      _privacyURL = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getUtamaAll() async {
    try {
      _isLoading = true;
      await getAndroidVersion();
      await getIOSVersion();
      await getCartButton();
      await getTransactionButton();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
