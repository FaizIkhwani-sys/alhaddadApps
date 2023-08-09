import 'package:apps_al_haddad/al_haddad.dart';

class RegisterRepository extends BaseRepository {
  Future postUsers(String? username, String? password, String? email) async {
    final response =
        await apiHelper.postRequest(hostUrl: baseApiUrl, path: "users", data: {
      "username": "$username",
      "password": "$password",
      "email": "$email",
    });
    if (response == null) return null;
    print(response);
    return response;
  }

  Future postProfil(String? userId, String? namaPenuh, String? noTel) async {
    final response =
        await apiHelper.postRequest(hostUrl: baseApiUrl, path: "profil", data: {
      "users_id": "$userId",
      "namaPenuh": "$namaPenuh",
      "noTel": "+6$noTel",
    });
    if (response == null) return null;
    print(response);
    return response;
  }
}
