import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PremisRepository extends BaseRepository {
  Future<List<Premis>?> getPremis() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/getPremis',
      accessToken: bearerToken,
    );

    if (response == null) return null;
    List list = response["getPremis"];
    List<Premis> premisList = list.map((e) => Premis.fromJson(e)).toList();

    print('getPremis $response');

    return premisList;
  }

  Future<List<PremisOrderDetails>?> getPremisOrderDetails(
      String premisId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getPremisOrderDetails',
          accessToken: bearerToken,
          queryParameters: {"orderId": orderId!, "premisId": premisId});

      if (response == null) return null;
      List list = response["getPremisOrderDetails"];
      List<PremisOrderDetails> premisList =
          list.map((e) => PremisOrderDetails.fromJson(e)).toList();

      print('getPremisOrderDetails $response');

      return premisList;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getPremisOrderDetails',
          queryParameters: {
            "orderId": orderId!,
            "premisId": premisId,
            "guestMode": "1"
          });

      if (response == null) return null;
      List list = response["getPremisOrderDetails"];
      List<PremisOrderDetails> premisList =
          list.map((e) => PremisOrderDetails.fromJson(e)).toList();

      print('jangan buat perangai $response');

      return premisList;
    }
  }

  Future<List<PremisAll>?> getPremisAll() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getPremisAll',
        accessToken: bearerToken,
      );

      if (response == null) return null;
      List list = response["getPremisAll"];
      List<PremisAll> premisAllList =
          list.map((e) => PremisAll.fromJson(e)).toList();

      print('tolong la keluar $response');

      return premisAllList;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getPremisAll',
          queryParameters: {"guestMode": "1"});

      if (response == null) return null;
      List list = response["getPremisAll"];
      List<PremisAll> premisAllList =
          list.map((e) => PremisAll.fromJson(e)).toList();

      print('buat lagi $response');

      return premisAllList;
    }
  }

  Future<List<OrderDetailsPremis>?> getOrderDetailsPremis() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    print('getOrderDetailsPremis $orderId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getOrderDetailsPremis',
          accessToken: bearerToken,
          queryParameters: {"orderId": "$orderId"});

      if (response == null) return null;
      List list = response["getOrderDetailsPremis"];
      List<OrderDetailsPremis> premisAllList =
          list.map((e) => OrderDetailsPremis.fromJson(e)).toList();

      print('tolong la keluar $response');

      return premisAllList;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getOrderDetailsPremis',
          queryParameters: {"orderId": "$orderId", "guestMode": "1"});

      if (response == null) return null;
      List list = response["getOrderDetailsPremis"];
      List<OrderDetailsPremis> premisAllList =
          list.map((e) => OrderDetailsPremis.fromJson(e)).toList();

      return premisAllList;
    }
  }
}
