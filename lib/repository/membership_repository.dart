import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MembershipRepository extends BaseRepository {
  Future<List<Membership>?> getMembership(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/getMembership',
      queryParameters: {
        "search": search,
      },
      accessToken: bearerToken,
    );

    if (response == null) return null;
    List list = response["getMembership"];
    List<Membership> membershipList =
        list.map((e) => Membership.fromJson(e)).toList();

    return membershipList;
  }

  Future<List<Membership>?> getRetailerMembership(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profilId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/r_getMembership',
      queryParameters: {
        "search": search,
        "profileId": profilId!,
      },
      accessToken: bearerToken,
    );

    if (response == null) return null;
    List list = response["r_getMembership"];
    List<Membership> membershipList =
        list.map((e) => Membership.fromJson(e)).toList();

    return membershipList;
  }

  Future<List<Membership>?> getRetailer(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/getRetailer',
      queryParameters: {
        "search": search,
      },
      accessToken: bearerToken,
    );

    if (response == null) return null;
    List list = response["getRetailer"];
    List<Membership> retailerList =
        list.map((e) => Membership.fromJson(e)).toList();

    return retailerList;
  }

  Future<List<Membership>?> getRetailerBig(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profilId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/r_getRetailerBig',
      queryParameters: {
        "search": search,
        "profileId": profilId!,
      },
      accessToken: bearerToken,
    );

    if (response == null) return null;
    List list = response["r_getRetailerBig"];
    List<Membership> retailerList =
        list.map((e) => Membership.fromJson(e)).toList();

    return retailerList;
  }

  Future<List<Membership>?> getRetailerMedium(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profilId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/r_getRetailerMedium',
      queryParameters: {
        "search": search,
        "profileId": profilId!,
      },
      accessToken: bearerToken,
    );

    if (response == null) return null;
    List list = response["r_getRetailerMedium"];
    List<Membership> retailerList =
        list.map((e) => Membership.fromJson(e)).toList();

    return retailerList;
  }

  Future<List<Membership>?> getRetailerSmall(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profilId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/r_getRetailerSmall',
      queryParameters: {
        "search": search,
        "profileId": profilId!,
      },
      accessToken: bearerToken,
    );

    if (response == null) return null;
    List list = response["r_getRetailerSmall"];
    List<Membership> retailerList =
        list.map((e) => Membership.fromJson(e)).toList();

    return retailerList;
  }

  Future<List<Membership>?> getAllMembers(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/getAllMembers',
      queryParameters: {
        "search": search,
      },
      accessToken: bearerToken,
    );

    if (response == null) return null;
    List list = response["getAllMembers"];
    List<Membership> allMembersList =
        list.map((e) => Membership.fromJson(e)).toList();

    return allMembersList;
  }
}
