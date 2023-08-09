import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StokisTerdekatRepository extends BaseRepository {
  Future<List<StokisTerdekat>?> getStokisTerdekat() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? lat = _prefs.getString('lat');
    String? long = _prefs.getString('long');

    print('location lat $lat');
    print('location long $long');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getStokisTerdekat',
          accessToken: bearerToken,
          queryParameters: {
            "lat": "${lat!}",
            "long": "${long!}",
          });

      if (response == null) return null;
      List list = response["getStokisTerdekat"];
      List<StokisTerdekat> stokisTerdekatList =
          list.map((e) => StokisTerdekat.fromJson(e)).toList();

      return stokisTerdekatList;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getStokisTerdekat',
          queryParameters: {
            "lat": "${lat!}",
            "long": "${long!}",
            "guestMode": "1"
          });

      if (response == null) return null;
      List list = response["getStokisTerdekat"];
      List<StokisTerdekat> stokisTerdekatList =
          list.map((e) => StokisTerdekat.fromJson(e)).toList();

      return stokisTerdekatList;
    }
  }
}
