import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminSharedPreferences {
  Future<bool> saveUser(AdminLogin user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userName', "${user.iDPengguna}");
    prefs.setString('jenisUser', "${user.jenisUser}");
    prefs.setString('token', "${user.fbToken}");

    return prefs.commit();
  }

  Future<AdminLogin> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");
    String? jenisUser = prefs.getString("jenisUser");
    String? userName = prefs.getString("userName");

    // print("$userId $nama $email $phone  $noIc");

    return AdminLogin(
      jenisUser: jenisUser,
      iDPengguna: userName,
      fbToken: token,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userName');
    prefs.remove('jenisUser');
    prefs.remove('token');
    prefs.remove("BearerToken");
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = "${prefs.getString("token")}";
    return token;
  }
}

class UserSharedPreferences {
  Future<bool> saveUser(UserLogin user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userName', "${user.iDPengguna}");
    prefs.setString('jenisUser', "${user.jenisUser}");
    prefs.setString('token', "${user.fbToken}");
    prefs.setString('userEmail', "${user.eMel}");

    return prefs.commit();
  }

  Future<UserLogin> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");
    String? jenisUser = prefs.getString("jenisUser");
    String? userName = prefs.getString("userName");

    // print("$userId $nama $email $phone  $noIc");

    return UserLogin(
      jenisUser: jenisUser,
      iDPengguna: userName,
      fbToken: token,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userName');
    prefs.remove('jenisUser');
    prefs.remove('token');
    prefs.remove("BearerToken");
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = "${prefs.getString("token")}";
    return token;
  }
}
