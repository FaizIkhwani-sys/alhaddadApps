import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersRepository extends BaseRepository {
  Future<List<Users>?> getUsers(String userIdScan) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    print('user id kosong ? $userIdScan');

    if (userIdScan == '') {
      String? usersId = _prefs.getString('userId');

      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getUsers',
          accessToken: bearerToken,
          queryParameters: {"usersId": usersId!});

      if (response == null) return null;
      List list = response["getUsers"];
      List<Users> users = list.map((e) => Users.fromJson(e)).toList();

      print(response);

      return users;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getUsers',
          accessToken: bearerToken,
          queryParameters: {"usersId": userIdScan});

      if (response == null) return null;
      List list = response["getUsers"];
      List<Users> users = list.map((e) => Users.fromJson(e)).toList();

      print(response);

      return users;
    }
  }
}
