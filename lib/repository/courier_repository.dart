import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourierRepository extends BaseRepository {
  Future<List<Courier>?> getCourier() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCourier',
          accessToken: bearerToken);

      if (response == null) return null;
      List list = response["getCourier"];
      List<Courier> courier = list.map((e) => Courier.fromJson(e)).toList();

      return courier;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCourier',
          queryParameters: {"guestMode": "1"});

      if (response == null) return null;
      List list = response["getCourier"];
      List<Courier> courier = list.map((e) => Courier.fromJson(e)).toList();

      return courier;
    }
  }

  Future<List<ShippingRates>?> getShippingRates(String weight, String premisId,
      String negeriPenerima, String courierId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getShippingRates',
          accessToken: bearerToken,
          queryParameters: {
            "weight": weight,
            "premisId": premisId,
            "negeriPenerima": negeriPenerima,
            "courierId": courierId
          });

      if (response == null) return null;
      List list = response["getShippingRates"];
      List<ShippingRates> courier =
          list.map((e) => ShippingRates.fromJson(e)).toList();

      return courier;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getShippingRates',
          queryParameters: {
            "weight": weight,
            "premisId": premisId,
            "negeriPenerima": negeriPenerima,
            "courierId": courierId,
            "guestMode": "1"
          });

      if (response == null) return null;
      List list = response["getShippingRates"];
      List<ShippingRates> courier =
          list.map((e) => ShippingRates.fromJson(e)).toList();

      return courier;
    }
  }

  Future<List<Weight>?> getWeight(String premisId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    print('getWeight $orderId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getWeight',
          accessToken: bearerToken,
          queryParameters: {"orderId": orderId!, "premisId": premisId});

      if (response == null) return null;
      List list = response["getWeight"];
      List<Weight> courier = list.map((e) => Weight.fromJson(e)).toList();

      return courier;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getWeight',
          queryParameters: {
            "orderId": orderId!,
            "premisId": premisId,
            "guestMode": "1"
          });

      if (response == null) return null;
      List list = response["getWeight"];
      List<Weight> courier = list.map((e) => Weight.fromJson(e)).toList();

      return courier;
    }
  }

  Future updateShippingRate(String shippingRate) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    print('shipping orderId $orderId');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orders/$orderId",
        accessToken: bearerToken,
        data: {"shippingCost": "$shippingRate"});
    if (response == null) return null;
    print('update shipping rate response $response');
    return response;
  }

  Future updateNewCashGiven(
      String grandTotal, cashGiven, String shippingCost) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    print('update new cash given $orderId');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orders/$orderId",
        accessToken: bearerToken,
        data: {
          "grandTotal":
              "${double.parse(grandTotal) + double.parse(shippingCost)}",
          "cashGiven": "${double.parse(cashGiven) + double.parse(shippingCost)}"
        });
    if (response == null) return null;
    print('updateNewCashGiven $response');
    return response;
  }
}
