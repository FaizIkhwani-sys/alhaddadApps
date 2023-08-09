import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersRepository extends BaseRepository {
  Future<List<Orders1>?> getOrders() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');
    String? fbToken = _prefs.getString('firebaseToken');

    if (bearerToken != null) {
      print('order ada bearer');
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getOrders',
          accessToken: bearerToken,
          queryParameters: {"profileId": profileId!});

      print('get order ada $profileId');

      if (response == null) return null;
      List list = response["getOrders"];
      List<Orders1> order = list.map((e) => Orders1.fromJson(e)).toList();

      return order;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getOrdersGuest',
          queryParameters: {"fbToken": fbToken!, "guestMode": "1"});


      if (response == null) return null;
      List list = response["getOrdersGuest"];
      List<Orders1> order = list.map((e) => Orders1.fromJson(e)).toList();

      return order;
    }
  }

  Future<List<OrderId>?> getOrderIdList() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getOrderIdList',
        accessToken: bearerToken,
        queryParameters: {"profileId": profileId!});

    print('profileId $profileId');

    if (response == null) return null;
    List list = response["getOrderIdList"];
    List<OrderId> orderIdList = list.map((e) => OrderId.fromJson(e)).toList();

    return orderIdList;
  }

  Future<List<OrderId>?> getOrderListWithPremisId(
      String premisId, String orderIdList) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    // String? orderIdList = _prefs.getString('orderIdList');

    print('orderIdList# $orderIdList');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getOrderListWithPremisId',
        accessToken: bearerToken,
        queryParameters: {
          "premisId": premisId,
          "orderId": orderIdList,
        });

    print('orderIdList## $orderIdList');

    if (response == null) return null;
    List list = response["getOrderListWithPremisId"];
    List<OrderId> order = list.map((e) => OrderId.fromJson(e)).toList();

    return order;
  }

  Future<List<OrderId>?> getOrderIdScan() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getOrderIdScan',
        accessToken: bearerToken,
        queryParameters: {"profileId": profileId!});

    print(profileId);

    if (response == null) return null;
    List list = response["getOrderIdScan"];
    List<OrderId> order = list.map((e) => OrderId.fromJson(e)).toList();

    return order;
  }

  Future<List<OrderId>?> getOrderIdMall() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getOrderIdMall',
        accessToken: bearerToken,
        queryParameters: {"profileId": profileId!});

    print(profileId);

    if (response == null) return null;
    List list = response["getOrderIdMall"];
    List<OrderId> order = list.map((e) => OrderId.fromJson(e)).toList();

    return order;
  }

  Future<List<Tracking>?> getOrdersTracking() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getOrdersTracking',
        accessToken: bearerToken,
        queryParameters: {
          "profileId": profileId!,
        },
      );
      // nanti ubah status jadi = 1 (dah tukar jadi 509 = berjaya)

      if (response == null) return null;
      List list = response["getOrdersTracking"];
      List<Tracking> orderTracking =
          list.map((e) => Tracking.fromJson(e)).toList();

      return orderTracking;
    } else {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getOrdersTracking',
        queryParameters: {"profileId": profileId!, "guestMode": "1"},
      );
      // nanti ubah status jadi = 1 (dah tukar jadi 509 = berjaya)

      if (response == null) return null;
      List list = response["getOrdersTracking"];
      List<Tracking> orderTracking =
          list.map((e) => Tracking.fromJson(e)).toList();

      return orderTracking;
    }
  }

  Future<List<SubTotal>?> getSubTotal() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    print('halo $orderId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getSubTotal',
          accessToken: bearerToken,
          queryParameters: {"orderId": orderId!});

      if (response == null) return null;
      List list = response["getSubTotal"];
      List<SubTotal> sumSubTotal =
          list.map((e) => SubTotal.fromJson(e)).toList();

      return sumSubTotal;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getSubTotal',
          queryParameters: {"orderId": orderId!, "guestMode": "1"});

      if (response == null) return null;
      List list = response["getSubTotal"];
      List<SubTotal> sumSubTotal =
          list.map((e) => SubTotal.fromJson(e)).toList();

      return sumSubTotal;
    }
  }

  Future<List<SubTotal>?> getSubTotalList(String orderId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    // String? orderId = _prefs.getString('orderId');

    print('halo $orderId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getSubTotal',
        accessToken: bearerToken,
        queryParameters: {"orderId": orderId});

    if (response == null) return null;
    List list = response["getSubTotal"];
    List<SubTotal> sumSubTotal = list.map((e) => SubTotal.fromJson(e)).toList();

    return sumSubTotal;
  }

  Future<List<CashGiven>?> getCashGiven() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    print('halo cash $orderId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCashGiven',
          accessToken: bearerToken,
          queryParameters: {"orderId": orderId!});

      if (response == null) return null;
      List list = response["getCashGiven"];
      List<CashGiven> sumSubTotal =
          list.map((e) => CashGiven.fromJson(e)).toList();

      return sumSubTotal;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getCashGiven',
          queryParameters: {"orderId": orderId!, "guestMode": "1"});

      if (response == null) return null;
      List list = response["getCashGiven"];
      List<CashGiven> sumSubTotal =
          list.map((e) => CashGiven.fromJson(e)).toList();

      print('get cash $response');

      return sumSubTotal;
    }
  }

  Future<List<OrderCost>?> getOrderCost() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    print('halo $orderId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getOrderCost',
        accessToken: bearerToken,
        queryParameters: {"orderId": orderId!});

    if (response == null) return null;
    List list = response["getOrderCost"];
    List<OrderCost> orderCost = list.map((e) => OrderCost.fromJson(e)).toList();

    return orderCost;
  }

  Future<List<OrderDetails>?> getOrderDetailsId(String productId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getOrderDetailsId',
        accessToken: bearerToken,
        queryParameters: {
          "orderId": orderId!,
          "productId": productId,
        });

    if (response == null) return null;
    List list = response["getOrderDetailsId"];
    List<OrderDetails> orderDetailsId =
        list.map((e) => OrderDetails.fromJson(e)).toList();

    return orderDetailsId;
  }

  Future<List<OrderDetailsAll>?> getOrderDetails(String orderId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    // String? orderId = _prefs.getString('orderId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getOrderDetails',
        accessToken: bearerToken,
        queryParameters: {
          "orderId": orderId,
        });

    if (response == null) return null;
    List list = response["getOrderDetails"];
    List<OrderDetailsAll> orderDetailsId =
        list.map((e) => OrderDetailsAll.fromJson(e)).toList();

    return orderDetailsId;
  }

  Future postOrders(
      String premisId,
      String alamat,
      String alamat2,
      String alamat3,
      String bandar,
      String poskod,
      String noTel,
      String idDaerah,
      String idNegeri,
      String saleType) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? profileId = _prefs.getString('profileId');
    String? bearerToken = _prefs.getString('BearerToken');
    String? email = _prefs.getString('userEmail');
    String? fbToken = _prefs.getString('firebaseToken');

    if (bearerToken != null) {
      final response = await apiHelper.postRequestWithToken(
          hostUrl: baseApiUrl,
          path: "orders",
          accessToken: bearerToken,
          data: {
            "premis_id": "$premisId",
            "profil_id": "$profileId",
            "alamat": "$alamat",
            "alamat2": "$alamat2",
            "alamat3": "$alamat3",
            "bandar": "$bandar",
            "poskod": "$poskod",
            "noTel": "$noTel",
            "email": "$email",
            "daerah": "$idDaerah",
            "negeri": "$idNegeri",
            "saleType": "$saleType",
          });
      if (response == null) return null;
      print(response);
      return response;
    } else {
      final response = await apiHelper.postRequestWithToken(
          hostUrl: baseApiUrl,
          path: "orders?guestMode=1",
          data: {
            "premis_id": "$premisId",
            "firebase_token": fbToken!,
            "saleType": "$saleType",
          });
      if (response == null) return null;
      print(response);
      return response;
    }
  }

  Future postOrdersList(
      String premisId,
      String alamat,
      String alamat2,
      String alamat3,
      String bandar,
      String poskod,
      String noTel,
      String idDaerah,
      String idNegeri,
      String saleType) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? profileId = _prefs.getString('profileId');
    String? bearerToken = _prefs.getString('BearerToken');
    String? email = _prefs.getString('userEmail');

    final response = await apiHelper.postRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orders",
        accessToken: bearerToken,
        data: {
          "premis_id": "$premisId",
          "profil_id": "$profileId",
          "alamat": "$alamat",
          "alamat2": "$alamat2",
          "alamat3": "$alamat3",
          "bandar": "$bandar",
          "poskod": "$poskod",
          "noTel": "$noTel",
          "email": "$email",
          "daerah": "$idDaerah",
          "negeri": "$idNegeri",
          "saleType": "$saleType",
        });
    if (response == null) return null;
    print(response);
    return response;
  }

  Future postOrderDetails(
      String premisId, String productId, String quantity, String price) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    if (bearerToken != null) {
      final response = await apiHelper.postRequestWithToken(
          hostUrl: baseApiUrl,
          path: "orderDetails",
          accessToken: bearerToken,
          data: {
            "premis_id": "$premisId",
            "orders_id": "$orderId",
            "product_id": "$productId",
            "kuantiti": "$quantity",
            "harga": "$price",
          });
      if (response == null) return null;
      print(response);
      return response;
    } else {
      final response = await apiHelper.postRequestWithToken(
          hostUrl: baseApiUrl,
          path: "orderDetails?guestMode=1",
          data: {
            "premis_id": "$premisId",
            "orders_id": "$orderId",
            "product_id": "$productId",
            "kuantiti": "$quantity",
            "harga": "$price",
          });
      if (response == null) return null;
      print(response);
      return response;
    }
  }

  Future postOrderDetailsList(String premisId, String productId,
      String quantity, String price, String orderId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    // String? orderId = _prefs.getString('orderId');

    final response = await apiHelper.postRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orderDetails",
        accessToken: bearerToken,
        data: {
          "premis_id": "$premisId",
          "orders_id": "$orderId",
          "product_id": "$productId",
          "kuantiti": "$quantity",
          "harga": "$price",
        });
    if (response == null) return null;
    print(response);
    return response;
  }

  Future updateProductQuantity(String premisId, String productId, int quantity,
      double price, String orderDetailsId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await apiHelper.postRequestWithToken(
          hostUrl: baseApiUrl,
          path: "orderDetails/$orderDetailsId",
          accessToken: bearerToken,
          data: {
            "kuantiti": "$quantity",
            "harga": "$price",
          });
      if (response == null) return null;
      print(response);
      return response;
    } else {
      final response = await apiHelper.postRequestWithToken(
          hostUrl: baseApiUrl,
          path: "orderDetails/$orderDetailsId?guestMode=1",
          data: {
            "kuantiti": "$quantity",
            "harga": "$price",
          });
      if (response == null) return null;
      print(response);
      return response;
    }
  }

  Future updateProductQuantityList(String premisId, String productId,
      int quantity, double price, String orderDetailsId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await apiHelper.postRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orderDetails/$orderDetailsId",
        accessToken: bearerToken,
        data: {
          "kuantiti": "$quantity",
          "harga": "$price",
        });
    if (response == null) return null;
    print(response);
    return response;
  }

  Future updateOrderDetails(
      String cashGiven,
      shippingCost,
      String pointsDeduct,
      String grandTotal,
      String noIc,
      String namaPenuh,
      String noTel,
      String billCode) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orders/$orderId",
        accessToken: bearerToken,
        data: {
          "grandTotal": "$grandTotal",
          "cashGiven": "$cashGiven",
          "shippingCost": "$shippingCost",
          "pointsDeduct": "$pointsDeduct",
          "status": "509",
          "noPengenalan": "$noIc",
          "namaPenuh": "$namaPenuh",
          "noTel": "$noTel",
          "billCode": "$billCode"
        });
    if (response == null) return null;
    print(response);
    return response;
  }

  Future updateAlamat() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orders/$orderId",
        accessToken: bearerToken,
        data: {
          "alamat": "",
          "alamat2": "",
          "alamat3": "",
          "bandar": "",
          "poskod": "",
          // "negeri": "0",
          // "daerah": "0",
        });
    if (response == null) return null;
    print(response);
    return response;
  }

  Future updateSubTotal(String subTotal, String cukai) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    print(orderId);

    if (bearerToken != null) {
      final response = await apiHelper.updateRequestWithToken(
          hostUrl: baseApiUrl,
          path: "orders/$orderId",
          accessToken: bearerToken,
          data: {
            "subTotal": "$subTotal",
            "grandTotal":
                "${(double.parse(subTotal) * (double.parse(cukai) / 100)) + double.parse(subTotal)}",
            "cukai": "$cukai",
            "cashGiven":
                "${(double.parse(subTotal) * (double.parse(cukai) / 100)) + double.parse(subTotal)}",
          });
      if (response == null) return null;
      print(response);
      return response;
    } else {
      // confirm balik dengan abang dus pasai orderId boleh ka guna fbToken untuk update
      final response = await apiHelper.updateRequestWithToken(
          hostUrl: baseApiUrl,
          path: "orders/$orderId?guestMode=1",
          accessToken: bearerToken,
          data: {
            "subTotal": "$subTotal",
            "grandTotal":
                "${(double.parse(subTotal) * (double.parse(cukai) / 100)) + double.parse(subTotal)}",
            "cukai": "$cukai",
            "cashGiven":
                "${(double.parse(subTotal) * (double.parse(cukai) / 100)) + double.parse(subTotal)}",
          });
      if (response == null) return null;
      print(response);
      return response;
    }
  }

  Future updateSubTotalList(
      String subTotal, String cukai, String orderId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    // String? orderId = _prefs.getString('orderId');

    print(orderId);

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orders/$orderId",
        accessToken: bearerToken,
        data: {
          "subTotal": "$subTotal",
          "grandTotal":
              "${(double.parse(subTotal) * (double.parse(cukai) / 100)) + double.parse(subTotal)}",
          "cukai": "$cukai",
          "cashGiven":
              "${(double.parse(subTotal) * (double.parse(cukai) / 100)) + double.parse(subTotal)}",
        });
    if (response == null) return null;
    print(response);
    return response;
  }

  Future updateCashGiven(String cashGiven) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    print(orderId);

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orders/$orderId",
        accessToken: bearerToken,
        data: {"cashGiven": "$cashGiven"});
    if (response == null) return null;
    print(response);
    return response;
  }

  Future updatePointsDeduct(String points) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    print(orderId);

    final response = await apiHelper.updateRequestWithToken(
        hostUrl: baseApiUrl,
        path: "orders/$orderId",
        accessToken: bearerToken,
        data: {
          "pointsDeduct": "$points",
        });
    if (response == null) return null;
    print(response);
    return response;
  }

  Future postLoyalty(String points) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');
    String? profileId = _prefs.getString('profileId');

    final response = await apiHelper.postRequestWithToken(
        hostUrl: baseApiUrl,
        path: "loyalty",
        accessToken: bearerToken,
        data: {
          "profil_id": "$profileId",
          "orders_id": "$orderId",
          "hpoint": "-$points",
          "remarks": "Belian Produk",
        });
    if (response == null) return null;
    print(response);
    return response;
  }
}
