import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GenderRepository extends BaseRepository {
  Future<List<Pilihan>?> getGender() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().postRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getGender',
        accessToken: bearerToken,
    );
    if (response == null) return null;
    List list = response["getGender"];
    List<Pilihan> gender = list.map((e) => Pilihan.fromJson(e)).toList();

    print(response);

    return gender;
  }
}
