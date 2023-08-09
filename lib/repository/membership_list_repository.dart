import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MembershipListRepository extends BaseRepository {
  Future<List<MembershipList>?> getMembershipList() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? profileId = _prefs.getString('profileId');
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().postRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getMembershipList',
        accessToken: bearerToken,
        queryParameters: {
          "profileId": profileId!
        });

    if (response == null) return null;
    List list = response["getMembershipList"];
    List<MembershipList> membershipList =
        list.map((e) => MembershipList.fromJson(e)).toList();

    print(response);

    return membershipList;
  }
}
