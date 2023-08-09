import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModeAppsRepository extends BaseRepository {
  Future<List<ModeApps>?> getNegeri() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/modeApps',
      accessToken: bearerToken,
    );

    if (response == null) return null;
    List list = response["modeApps"];
    List<ModeApps> modeApps = list.map((e) => ModeApps.fromJson(e)).toList();

    return modeApps;
  }
}
