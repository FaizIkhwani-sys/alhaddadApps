import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DaerahRepository extends BaseRepository {
  Future<List<Pilihan>?> getDaerah(String idNegeri) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getDaerah',
          accessToken: bearerToken,
          queryParameters: {
            "idNegeri": idNegeri,
          });

      if (response == null) return null;
      List list = response["getDaerah"];
      List<Pilihan> daerahList = list.map((e) => Pilihan.fromJson(e)).toList();

      return daerahList;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getDaerah',
          queryParameters: {"idNegeri": idNegeri, "guestMode": "1"});

      if (response == null) return null;
      List list = response["getDaerah"];
      List<Pilihan> daerahList = list.map((e) => Pilihan.fromJson(e)).toList();

      return daerahList;
    }
  }

  Future<List<Pilihan>?> getCurrentDaerah(String currentID) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCurrentDaerah',
          accessToken: bearerToken,
          queryParameters: {"currentID": currentID});

      if (response == null) return null;
      List list = response["getCurrentDaerah"];
      List<Pilihan> currentNegeri =
          list.map((e) => Pilihan.fromJson(e)).toList();

      return currentNegeri;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCurrentDaerah',
          queryParameters: {"currentID": currentID, "guestMode": "1"});

      if (response == null) return null;
      List list = response["getCurrentDaerah"];
      List<Pilihan> currentNegeri =
          list.map((e) => Pilihan.fromJson(e)).toList();

      return currentNegeri;
    }
  }
}
