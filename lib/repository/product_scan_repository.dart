import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductScanRepository extends BaseRepository {
  Future<List<ProductScan>?> getProductScan(String barcode) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/products',
        accessToken: bearerToken,
        queryParameters: {"barcode": "$barcode"});

    if (response == null) return null;
    List list = response["products"];
    List<ProductScan> productsList =
        list.map((e) => ProductScan.fromJson(e)).toList();

    return productsList;
  }
}
