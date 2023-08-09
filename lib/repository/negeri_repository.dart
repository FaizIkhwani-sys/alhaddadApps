import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NegeriRepository extends BaseRepository {
  Future<List<Pilihan>?> getNegeri() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getNegeri',
        accessToken: bearerToken,
      );

      if (response == null) return null;
      List list = response["getNegeri"];
      List<Pilihan> negeriList = list.map((e) => Pilihan.fromJson(e)).toList();

      return negeriList;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getNegeri',
          queryParameters: {"guestMode": "1"});

      if (response == null) return null;
      List list = response["getNegeri"];
      List<Pilihan> negeriList = list.map((e) => Pilihan.fromJson(e)).toList();

      return negeriList;
    }
  }

  Future<List<Pilihan>?> getCurrentNegeri(String currentID) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCurrentNegeri',
          accessToken: bearerToken,
          queryParameters: {
            "currentID": currentID,
          });

      if (response == null) return null;
      List list = response["getCurrentNegeri"];
      List<Pilihan> currentNegeri =
          list.map((e) => Pilihan.fromJson(e)).toList();

      return currentNegeri;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCurrentNegeri',
          queryParameters: {"currentID": currentID, "guestMode": "1"});

      if (response == null) return null;
      List list = response["getCurrentNegeri"];
      List<Pilihan> currentNegeri =
          list.map((e) => Pilihan.fromJson(e)).toList();

      return currentNegeri;
    }
  }
}
