import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingRepository extends BaseRepository {
  Future<List<Setting>?> getSetting(String parameter) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      print('getSetting ada');
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getAppsSetting',
          accessToken: bearerToken,
          queryParameters: {"parameter": "$parameter"});

      if (response == null) return null;
      List list = response["getAppsSetting"];
      List<Setting> setting = list.map((e) => Setting.fromJson(e)).toList();

      return setting;
    } else {
      print('getSetting tiada');
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getAppsSetting',
          queryParameters: {"parameter": "$parameter", "guestMode": "1"});

      if (response == null) return null;
      List list = response["getAppsSetting"];
      List<Setting> setting = list.map((e) => Setting.fromJson(e)).toList();

      return setting;
    }
  }

  Future<List<Setting>?> getSettingPublic(String parameter) async {
    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/settings',
        queryParameters: {"parameter": "$parameter", "catSetting": "597"});

    if (response == null) return null;
    List list = response["settings"];
    List<Setting> setting = list.map((e) => Setting.fromJson(e)).toList();

    return setting;
  }
}
