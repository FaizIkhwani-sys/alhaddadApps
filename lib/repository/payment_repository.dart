import 'package:apps_al_haddad/al_haddad.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentRepository extends BaseRepository {
  Future<List<ToyyibKey>?> getToyyibKey() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getToyyibKey',
        accessToken: bearerToken,
      );

      if (response == null) return null;
      List list = response["getToyyibKey"];
      List<ToyyibKey> toyyibKey =
          list.map((e) => ToyyibKey.fromJson(e)).toList();

      print(response);

      return toyyibKey;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getToyyibKey',
          queryParameters: {"guestMode": "1"});

      if (response == null) return null;
      List list = response["getToyyibKey"];
      List<ToyyibKey> toyyibKey =
          list.map((e) => ToyyibKey.fromJson(e)).toList();

      print(response);

      return toyyibKey;
    }
  }

  Future<List<ToyyibKey>?> getCatCode() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getCatCode',
        accessToken: bearerToken,
      );

      if (response == null) return null;
      List list = response["getCatCode"];
      List<ToyyibKey> catCode = list.map((e) => ToyyibKey.fromJson(e)).toList();

      print(response);

      return catCode;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCatCode',
          queryParameters: {"guestMode": "1"});

      if (response == null) return null;
      List list = response["getCatCode"];
      List<ToyyibKey> catCode = list.map((e) => ToyyibKey.fromJson(e)).toList();

      print(response);

      return catCode;
    }
  }

  Future postToyyib(
      String? toyyibKey,
      String? catCode,
      String? name,
      String? email,
      String? phone,
      double? amaunDalamSen,
      String? idProfil) async {
    print(
        "harga toyyib $toyyibKey $catCode $amaunDalamSen $name $email $phone");
    var uri = Uri.parse("https://toyyibpay.com/index.php/api/createBill");
    var request = http.MultipartRequest('POST', uri)
      ..fields['userSecretKey'] = "$toyyibKey"
      ..fields['categoryCode'] = "$catCode"
      ..fields['billName'] = "Payment testing"
      ..fields['billDescription'] = "Products Payment"
      ..fields["billPriceSetting"] = "1"
      ..fields["billPayorInfo"] = "1"
      ..fields["billAmount"] = "$amaunDalamSen"
      ..fields["billReturnUrl"] =
          "https://alhaddad.myrichappsproject.tk/paymentStatus.php?mode=1&inApp=1"
      ..fields["billCallbackUrl"] =
          "https://alhaddad.myrichappsproject.tk/paymentStatus.php?mode=2&inApp=1"
      ..fields["billExternalReferenceNo"] = "$idProfil"
      ..fields["billTo"] = "$name"
      ..fields["billEmail"] = "$email"
      ..fields["billPhone"] = "$phone"
      ..fields["billSplitPayment"] = "0"
      ..fields["billSplitPaymentArgs"] = ""
      ..fields["billPaymentChannel"] = "0"
      ..fields["billContentEmail"] = "Payment successful"
      ..fields["billChargeToCustomer"] = "1";
    var response = await request.send();

    if (response.statusCode == 200) {
      final respStr = await http.Response.fromStream(response);
      print('resp sini ${respStr.body}');
      return jsonDecode(respStr.body);
    }
  }

  Future simpanOrders(String noKadPengenalan) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');
    String? profileId = _prefs.getString('profileId');

    final response = await apiHelper.postRequestWithToken(
        hostUrl: baseApiUrl,
        path: "simpanOrder",
        accessToken: bearerToken,
        data: {
          "profileId": "$profileId",
          "noPengenalan": "$noKadPengenalan",
          "orders_id": "$orderId",
          // "premis_id": "$premisId",
          // "product_id": "$productId",
          // "kuantiti": "$quantity",
          // "harga": "$price",
        });
    if (response == null) return null;
    print("simpan oler $response");
    return response;
  }
}
