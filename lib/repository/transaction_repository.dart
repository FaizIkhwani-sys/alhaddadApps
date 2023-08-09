import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionRepository extends BaseRepository {
  Future<List<Orders1>?> getTransaction() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getTransaction',
        accessToken: bearerToken,
        queryParameters: {"profileId": profileId!});

    if (response == null) return null;
    List list = response["getTransaction"];
    List<Orders1> stokisTerdekatList =
        list.map((e) => Orders1.fromJson(e)).toList();

    return stokisTerdekatList;
  }

  Future<List<PaymentRequest>?> getPaymentRequest() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getPaymentRequest',
        accessToken: bearerToken);

    if (response == null) return null;
    List list = response["getPaymentRequest"];
    List<PaymentRequest> paymentRequest =
        list.map((e) => PaymentRequest.fromJson(e)).toList();

    return paymentRequest;
  }

  Future updateDone(String requestId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "requestPayment/$requestId",
        accessToken: bearerToken,
        data: {
          "status": "1",
        });
    if (response == null) return null;
    print('oh ada lagi $response');
    return response;
  }

  Future updateReject(String requestId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "requestPayment/$requestId",
        accessToken: bearerToken,
        data: {
          "status": "3",
        });
    if (response == null) return null;
    print('ok last $response');
    return response;
  }
}
