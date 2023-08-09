import 'package:flutter/cupertino.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class UserProvider extends ChangeNotifier {
  UserLogin _user = UserLogin();

  UserLogin get user => _user;

  void setUser(UserLogin user) {
    _user = user;
    notifyListeners();
  }
}

class AdminProvider extends ChangeNotifier {
  AdminLogin _user = AdminLogin();

  AdminLogin get user => _user;

  void setUser(AdminLogin user) {
    _user = user;
    notifyListeners();
  }
}
