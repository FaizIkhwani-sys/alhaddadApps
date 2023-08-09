import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressRepository extends BaseRepository {
  Future<List<Address>?> getAddress() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getAddress',
          accessToken: bearerToken,
          queryParameters: {
            "orderId": orderId!,
          });

      if (response == null) return null;
      List list = response["getAddress"];
      List<Address> address = list.map((e) => Address.fromJson(e)).toList();

      return address;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getAddress',
          queryParameters: {"orderId": orderId!, "guestMode": "1"});

      if (response == null) return null;
      List list = response["getAddress"];
      List<Address> address = list.map((e) => Address.fromJson(e)).toList();

      return address;
    }
  }

  Future updateGuestDeliveryInformation(
      String name,
      String phone,
      String email,
      String address,
      String poskod,
      String bandar,
      String idDaerah,
      String idNegeri) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? orderId = _prefs.getString('orderId');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orders/$orderId",
        queryParameters: {
          "guestMode": "1"
        },
        data: {
          "namaPenuh": "$name",
          "noTel": "$phone",
          "email": "$email",
          "alamat": "$address",
          "poskod": "$poskod",
          "bandar": "$bandar",
          "negeri": "$idNegeri",
          "daerah": "$idDaerah",
        });
    if (response == null) return null;
    print('updateOrderAddress $response');
    return response;
  }
}
