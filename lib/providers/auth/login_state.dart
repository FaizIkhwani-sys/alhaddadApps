import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

enum StatusUser {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class LogInPageState extends ChangeNotifier with UserNameMixin, PasswordMixin {



  StatusUser _registeredInStatus = StatusUser.NotRegistered;
  StatusUser get registeredInStatus => _registeredInStatus;
  set registeredInStatus(StatusUser value) {
    _registeredInStatus = value;
    notifyListeners();
  }

  StatusUser _loggedInStatus = StatusUser.NotLoggedIn;
  StatusUser get loggedInStatus => _loggedInStatus;
  set loggedInStatus(StatusUser value) {
    _loggedInStatus = value;
    notifyListeners();
  }

  String? _jenisUser;
  String? get jenisUser => _jenisUser;

  String? _androidVersion;
  String? get androidVersion => _androidVersion;
  set androidVersion(String? value) {
    _androidVersion = value;
    notifyListeners();
  }

  String? _iOSVersion;
  String? get iOSVersion => _iOSVersion;
  set iOSVersion(String? value) {
    _iOSVersion = value;
    notifyListeners();
  }

  String? _bearerToken;
  String? get bearerToken => _bearerToken;
  set bearerToken(String? value) {
    _bearerToken = value;
    notifyListeners();
  }

  version() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (Platform.isAndroid) {
      androidVersion = _prefs.getString('androidVersion');
      print('sini androidVersion login $androidVersion');
    } else if (Platform.isIOS) {
      iOSVersion = _prefs.getString('iOSVersion');
    }
  }

  void validateAll() {
    validateUserName();
    validatePassword();
  }

  Future<Map<String, dynamic>?> login(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? firebaseToken = prefs.getString('firebaseToken');
      // print("firebase login: $firebaseToken");
      // print("username: $userName");
      // print("password: $password");

      var result;
      if (userName!.contains("admin")) {
        _jenisUser = "2";
      } else {
        _jenisUser = "1";
      }

      _loggedInStatus = StatusUser.Authenticating;
      notifyListeners();
      final response = await APIHelper()
          .postRequest(hostUrl: baseApiUrl, path: 'login', data: {
        "username": "$userName",
        "password": "$password",
        "jenisUser": "$jenisUser",
        "firebase_token": "$firebaseToken",
      });
      print('response login state $response');
      if (response != null) {
        var responseData = response["login"];
        await getSetString(responseData);

        var userData = responseData[0];
        print("userdata: $userData");
        //
        UserLogin authUser = UserLogin.fromJson(userData);
        //
        UserSharedPreferences().saveUser(authUser);

        _loggedInStatus = StatusUser.LoggedIn;
        notifyListeners();

        result = {'status': true, 'message': 'Successful', 'user': authUser};
        print(result);
      } else {
        _loggedInStatus = StatusUser.NotLoggedIn;
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
      notifyListeners();
    }
  }

  getSetString(var responseData) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    _prefs.setString("BearerToken", responseData[0]["token"]);
    _prefs.setString("userName", responseData[0]["ID Pengguna"]);
    _prefs.setString("jenisUser", responseData[0]["jenisUser"]);
    _prefs.setString("userId", responseData[0]["ID"]);
    _prefs.setString("profileId", responseData[0]["ID Profil"]);
    _prefs.setString("idJenisStokis", responseData[0]["ID Jenis Stokis"]);

    bearerToken = _prefs.getString('BearerToken');

    print('bearer login $bearerToken');


    print('login punya bearer ${_prefs.getString('BearerToken')}');
    print('login punya userName ${_prefs.getString('userName')}');
    print('login punya jenisUser ${_prefs.getString('jenisUser')}');
    print('login punya userId ${_prefs.getString('userId')}');
    print('login punya profileId ${_prefs.getString('profileId')}');
    print('login punya idJenisStokis ${_prefs.getString('idJenisStokis')}');
  }
}
