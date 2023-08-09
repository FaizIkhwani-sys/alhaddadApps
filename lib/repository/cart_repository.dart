import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository extends BaseRepository {
  Future<List<Cart>?> getCart() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCart',
          accessToken: bearerToken,
          queryParameters: {
            "orderId": orderId!,
          });

      if (response == null) return null;
      List list = response["getCart"];
      List<Cart> cartList = list.map((e) => Cart.fromJson(e)).toList();

      return cartList;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCart',
          queryParameters: {"orderId": orderId!, "guestMode": "1"});

      if (response == null) return null;
      List list = response["getCart"];
      List<Cart> cartList = list.map((e) => Cart.fromJson(e)).toList();

      print('getcart null $response');

      return cartList;
    }
  }

  Future<List<Cart>?> getCartList(String orderId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    // String? orderId = _prefs.getString('orderId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCart',
          accessToken: bearerToken,
          queryParameters: {
            "orderId": orderId,
          });

      if (response == null) return null;
      List list = response["getCart"];
      List<Cart> cartList = list.map((e) => Cart.fromJson(e)).toList();

      return cartList;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCart',
          accessToken: bearerToken,
          queryParameters: {"orderId": orderId, "guestMode": "1"});

      if (response == null) return null;
      List list = response["getCart"];
      List<Cart> cartList = list.map((e) => Cart.fromJson(e)).toList();

      return cartList;
    }
  }

  Future updateQuantity(
      String orderDetailsId, String quantity, String price) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await apiHelper.updateRequestWithToken(
          hostUrl: baseApiUrl,
          path: "orderDetails/$orderDetailsId",
          accessToken: bearerToken,
          data: {
            "kuantiti": "$quantity",
            "harga": "$price",
          });
      if (response == null) return null;
      print('update quantity response ada $response');
      return response;
    } else {
      final response = await apiHelper.updateRequestWithToken(
          hostUrl: baseApiUrl,
          path: "orderDetails/$orderDetailsId?guestMode=1",
          data: {
            "kuantiti": "$quantity",
            "harga": "$price",
          });
      if (response == null) return null;
      print('update quantity response $response');
      return response;
    }
  }

  Future updateSubTotal(String subTotal) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orders/$orderId",
        accessToken: bearerToken,
        data: {
          "subTotal": "$subTotal",
        });
    if (response == null) return null;
    print('update subtotal response $response');
    return response;
  }

  Future deleteCartProduct(String idOrderDetails) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await apiHelper.deleteRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orderDetails/$idOrderDetails",
        accessToken: bearerToken,
      );
      if (response == null) return null;
      print('repo $response');
      return response;
    } else {
      final response = await apiHelper.deleteRequestWithToken(
          hostUrl: baseApiUrl,
          path: "orderDetails/$idOrderDetails",
          queryParameters: {"guestMode": "1"});
      if (response == null) return null;
      print('repo $response');
      return response;
    }
  }

  Future deleteOrder(String orderId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.deleteRequestWithToken(
      hostUrl: baseApiUrl,
      path: "orders/$orderId",
      accessToken: bearerToken,
    );
    if (response == null) return null;
    print('repo $response');
    return response;
  }
}
