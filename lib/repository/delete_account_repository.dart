import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAccountRepository extends BaseRepository {
  // email dari table users
  Future<List<UserDelete>?> getUsersEmail(String email) async {
    final _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.getRequestWithToken(
        hostUrl: baseApiUrl,
        accessToken: bearerToken,
        path: "getUsersEmail",
        queryParameters: {"email": email});
    if (response == null) return null;
    List list = response["getUsersEmail"];
    List<UserDelete> users = list.map((e) => UserDelete.fromJson(e)).toList();

    return users;
  }

  // email dari table deleteAccount
  Future<List<EmailDelete>?> getEmailDelete() async {
    final _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.getRequestWithToken(
      hostUrl: baseApiUrl,
      accessToken: bearerToken,
      path: "dynamic/getEmailDelete",
    );
    if (response == null) return null;
    List list = response["getEmailDelete"];
    List<EmailDelete> users = list.map((e) => EmailDelete.fromJson(e)).toList();

    return users;
  }

  Future postDeleteAccount(String email, String reason) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? idUser = _prefs.getString("userId");
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.postRequestWithToken(
        hostUrl: baseApiUrl,
        path: "deleteAccount",
        accessToken: bearerToken,
        data: {
          "idUser": idUser!,
          "email": email,
          "reasonDelete": reason,
        });
    if (response == null) return null;
    return response;
  }
}
