import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminProfileRepository extends BaseRepository {
  Future<List<AdminProfile>?> getAdminProfile() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? profileId = _prefs.getString('userId');
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getAdminProfile',
        accessToken: bearerToken,
        queryParameters: {"profileId": profileId!});

    if (response == null) return null;
    List list = response["getAdminProfile"];
    List<AdminProfile> adminProfile =
        list.map((e) => AdminProfile.fromJson(e)).toList();

    print(response);

    return adminProfile;
  }

  Future<List<AdminProfile>?> getRetailerProfile() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? profileId = _prefs.getString('userId');
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getRetailerProfile',
        accessToken: bearerToken,
        queryParameters: {"profileId": profileId!});

    if (response == null) return null;
    List list = response["getRetailerProfile"];
    List<AdminProfile> retailerProfile =
        list.map((e) => AdminProfile.fromJson(e)).toList();

    print(response);

    return retailerProfile;
  }
}
