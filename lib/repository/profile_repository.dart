import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository extends BaseRepository {
  Future<List<Profile>?> getProfile(String profileIdScan) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      if (profileIdScan == '') {
        String? profileId = _prefs.getString('profileId');

        final response = await APIHelper().getRequestWithToken(
            hostUrl: baseApiUrl,
            path: 'dynamic/getProfile',
            accessToken: bearerToken,
            queryParameters: {"profileId": profileId!});

        if (response == null) return null;
        List list = response["getProfile"];
        List<Profile> profile = list.map((e) => Profile.fromJson(e)).toList();

        print('lai lai $response');

        return profile;
      } else {
        String? bearerToken = _prefs.getString('BearerToken');

        final response = await APIHelper().getRequestWithToken(
            hostUrl: baseApiUrl,
            path: 'dynamic/getProfile',
            accessToken: bearerToken,
            queryParameters: {"profileId": profileIdScan});

        if (response == null) return null;
        List list = response["getProfile"];
        List<Profile> profile = list.map((e) => Profile.fromJson(e)).toList();

        print('getProfile response $response');

        return profile;
      }
    } else {
      if (profileIdScan == '') {
        String? profileId = _prefs.getString('profileId');

        final response = await APIHelper().getRequestWithToken(
            hostUrl: baseApiUrl,
            path: 'dynamic/getProfile',
            queryParameters: {"profileId": profileId!, "guestMode": "1"});

        if (response == null) return null;
        List list = response["getProfile"];
        List<Profile> profile = list.map((e) => Profile.fromJson(e)).toList();

        print('betul $response');

        return profile;
      } else {
        final response = await APIHelper().getRequestWithToken(
            hostUrl: baseApiUrl,
            path: 'dynamic/getProfile',
            queryParameters: {"profileId": profileIdScan, "guestMode": "1"});

        if (response == null) return null;
        List list = response["getProfile"];
        List<Profile> profile = list.map((e) => Profile.fromJson(e)).toList();

        print('satu ni ja lagi $response');

        return profile;
      }
    }
  }

  Future<List<UpLine>?> getUpLine(String refId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getUpline',
        accessToken: bearerToken,
        queryParameters: {"refId": refId});

    if (response == null) return null;
    List list = response["getUpline"];
    List<UpLine> profile = list.map((e) => UpLine.fromJson(e)).toList();

    print('getUpLine $response');

    return profile;
  }

  Future updateProfile(String namaPenuh, String dob, String noTel) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? profileId = _prefs.getString('profileId');
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "profil/$profileId",
        accessToken: bearerToken,
        data: {
          "namaPenuh": "$namaPenuh",
          "tarikhLahir": "$dob",
          "noTel": "$noTel",
        });
    if (response == null) return null;
    print('updateProfile $response');
    return response;
  }

  Future updateBankDetails(String bankName, String accountNumber) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? profileId = _prefs.getString('profileId');
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "profil/$profileId",
        accessToken: bearerToken,
        data: {"namaBank": "$bankName", "bankAccount": "$accountNumber"});
    if (response == null) return null;
    print('updateBankDetails $response');
    return response;
  }

  Future updateUsers(String username, String email) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? usersId = _prefs.getString('userId');
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "users/$usersId",
        accessToken: bearerToken,
        data: {
          "username": "$username",
          "email": "$email",
        });
    if (response == null) return null;
    print('updateUsers $response');
    return response;
  }

  Future updateAddress(String alamat, String alamat2, String alamat3,
      String postcode, String bandar, String idNegeri, String idDaerah) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? profileId = _prefs.getString('profileId');
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "profil/$profileId",
        accessToken: bearerToken,
        data: {
          "alamat": "$alamat",
          "alamat2": "$alamat2",
          "alamat3": "$alamat3",
          "poskod": "$postcode",
          "bandar": "$bandar",
          "pilihanDaerah": "$idDaerah",
          "pilihanNegeri": "$idNegeri",
        });
    if (response == null) return null;
    print('updateAddress $response');
    return response;
  }

  Future updateOrderAddress(String alamat, String alamat2, String alamat3,
      String postcode, String bandar, String idNegeri, String idDaerah) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? orderId = _prefs.getString('orderId');
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orders/$orderId",
        accessToken: bearerToken,
        data: {
          "alamat": "$alamat",
          "alamat2": "$alamat2",
          "alamat3": "$alamat3",
          "poskod": "$postcode",
          "bandar": "$bandar",
          "negeri": "$idNegeri",
          "daerah": "$idDaerah",
        });
    if (response == null) return null;
    print('updateOrderAddress $response');
    return response;
  }
}
