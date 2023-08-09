import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PointsRepository extends BaseRepository {
  Future<List<SumPoints>?> getSumPoints() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/sumPoints',
        accessToken: bearerToken,
        queryParameters: {
          "profileId": profileId!,
        });

    if (response == null) return null;
    List list = response["sumPoints"];
    List<SumPoints> sumPoints = list.map((e) => SumPoints.fromJson(e)).toList();

    return sumPoints;
  }

  //getUserPoints Baru
  Future<List<GetUserPoints>?> getUserPoints(String noKP) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getUserPoints',
          accessToken: bearerToken,
          queryParameters: {
            "noPengenalan": noKP,
          });

      if (response == null) return null;
      List list = response["getUserPoints"];
      List<GetUserPoints> sumPoints =
          list.map((e) => GetUserPoints.fromJson(e)).toList();

      return sumPoints;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getUserPoints',
          queryParameters: {"noPengenalan": noKP, "guestMode": "1"});

      if (response == null) return null;
      List list = response["getUserPoints"];
      List<GetUserPoints> sumPoints =
          list.map((e) => GetUserPoints.fromJson(e)).toList();

      return sumPoints;
    }
  }

  Future<List<RequestPayment>?> getRequestPayment() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/requestPayment',
        accessToken: bearerToken,
        queryParameters: {
          "profileId": profileId!,
        });

    if (response == null) return null;
    List list = response["requestPayment"];
    List<RequestPayment> sumPoints =
        list.map((e) => RequestPayment.fromJson(e)).toList();

    return sumPoints;
  }

  Future<List<Loyalty>?> getLoyalty() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getLoyalty',
        accessToken: bearerToken,
        queryParameters: {
          "profileId": profileId!,
        });

    if (response == null) return null;
    List list = response["getLoyalty"];
    List<Loyalty> loyalty = list.map((e) => Loyalty.fromJson(e)).toList();

    return loyalty;
  }

  Future postRequestPoint(String amount) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? profileId = _prefs.getString('profileId');
    String? bearerToken = _prefs.getString('BearerToken');

    print('profile $profileId');
    print('profile $amount');

    final response = await apiHelper.postRequestWithToken(
        hostUrl: baseApiUrl,
        path: "requestPayment",
        accessToken: bearerToken,
        data: {"profil_id": "$profileId", "amount": "$amount", "pymode": "1"});
    if (response == null) return null;
    print('res sini $response');
    return response;
  }

  Future postLoyalty(String points) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await apiHelper.postRequestWithToken(
        hostUrl: baseApiUrl,
        path: "loyalty",
        accessToken: bearerToken,
        data: {
          "profil_id": "$profileId",
          "hpoint": "-$points",
          "remarks": "Permohonan Hibah",
        });
    if (response == null) return null;
    print(response);
    return response;
  }

  Future<List<GetUserPoints>?> getTotalHibah() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getUserPoints',
        accessToken: bearerToken,
        queryParameters: {
          "id_profil": profileId!,
        });

    if (response == null) return null;
    List list = response["getUserPoints"];
    List<GetUserPoints> sumPoints =
        list.map((e) => GetUserPoints.fromJson(e)).toList();

    return sumPoints;
  }

  Future<List<GetUserPoints>?> getDailyHibah() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getUserPoints',
        accessToken: bearerToken,
        queryParameters: {"id_profil": profileId!, "tempoh": "2"});

    if (response == null) return null;
    List list = response["getUserPoints"];
    List<GetUserPoints> sumPoints =
        list.map((e) => GetUserPoints.fromJson(e)).toList();

    return sumPoints;
  }

  Future<List<GetUserPoints>?> getWeeklyHibah() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getUserPoints',
        accessToken: bearerToken,
        queryParameters: {"id_profil": profileId!, "tempoh": "3"});

    if (response == null) return null;
    List list = response["getUserPoints"];
    List<GetUserPoints> sumPoints =
        list.map((e) => GetUserPoints.fromJson(e)).toList();

    return sumPoints;
  }

  Future<List<GetUserPoints>?> getMonthlyHibah() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getUserPoints',
        accessToken: bearerToken,
        queryParameters: {"id_profil": profileId!, "tempoh": "4"});

    if (response == null) return null;
    List list = response["getUserPoints"];
    List<GetUserPoints> sumPoints =
        list.map((e) => GetUserPoints.fromJson(e)).toList();

    return sumPoints;
  }
}
