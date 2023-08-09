import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class LogInAdminState extends ChangeNotifier with PasswordMixin {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;
  Status get loggedInStatus => _loggedInStatus;
  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  void validateAll() {
    validateUserName();
    validatePassword();
  }

  String? _userName;
  String? get userName => _userName;
  set userName(String? value) {
    _userName = value;
    validateUserName();
    notifyListeners();
  }

  String? _jenisUser;
  String? get jenisUser => _jenisUser;

  String? _userNameError = '';
  String? get userNameError => _userNameError;
  bool get userNameHasError => !_userNameError.isNullOrWhiteSpace;

  void validateUserName() {
    try {
      _userNameError = null;
      if (userName.isNullOrWhiteSpace) {
        _userNameError = 'Nama pengguna perlu diisi';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  //utils>user_shared_preference.dart

  Future<Map<String, dynamic>?> login(BuildContext context) async {
    try {
      _isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? firebaseToken = prefs.getString('firebaseToken');
      print("firebase login: $firebaseToken");
      print("username: $userName");
      print("password: $password");

      var result;
      if (userName!.contains("admin")) {
        _jenisUser = "2";
      } else {
        _jenisUser = "1";
      }

      _loggedInStatus = Status.Authenticating;
      notifyListeners();
      final response = await APIHelper()
          .postRequest(hostUrl: baseApiUrl, path: 'login', data: {
        "username": "$userName",
        "password": "$password",
        "jenisUser": "$jenisUser",
        "firebase_token": "$firebaseToken",
      });
      if (response != null) {
        print('response login admin $response');
        var responseData = response["login"];
        prefs.setString("BearerToken", responseData[0]["token"]);
        prefs.setString("userName", responseData[0]["ID Pengguna"]);
        prefs.setString("jenisUser", responseData[0]["jenisUser"]);
        prefs.setString("idJenisAkses", responseData[0]["ID Jenis Akses"]);
        prefs.setString("userId", responseData[0]["ID"]);
        // prefs.setString("profileId", responseData[0]["ID Profil"]);

        print('id admin ${prefs.getString("userId")}');
        print('id admin ${prefs.getString("profileId")}');

        print("hat ni  $responseData");
        print("BearerToken ${prefs.getString("BearerToken")}");

        var userData = responseData[0];
        print("userdata: $userData");
        //
        AdminLogin authUser = AdminLogin.fromJson(userData);
        //
        AdminSharedPreferences().saveUser(authUser);

        _loggedInStatus = Status.LoggedIn;
        notifyListeners();

        result = {'status': true, 'message': 'Successful', 'user': authUser};
        print(result);
      } else {
        _loggedInStatus = Status.NotLoggedIn;
        notifyListeners();
        result = {
          'status': false,
          'message': json.decode(response.body)['error']
        };
      }
      return result;
    } catch (e) {
      print(e);
      showDialog(
        useSafeArea: true,
        context: context,
        builder: (_) => AppAlertDialog(
          alertDialogType: AlertDialogType.warning,
          title: 'SORRY',
          subtitle: 'Username or Password do not match',
          // description: 'Sila kemaskini maklumat anda.',
          actionButtons: [
            ActionButton(
              label: 'BACK',
              onTap: () => {
                AppRoute.pop(context),
              },
              color: primaryColor,
            ),
          ],
        ),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
