import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsRepository extends BaseRepository {
  Future<List<Products>?> getProducts(String premisId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getProducts',
        queryParameters: {
          "premisId": premisId,
        },
        accessToken: bearerToken,
      );

      if (response == null) return null;
      List list = response["getProducts"];
      List<Products> productsList =
          list.map((e) => Products.fromJson(e)).toList();

      return productsList;
    } else {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getProducts',
        queryParameters: {"premisId": premisId, "guestMode": "1"},
      );

      if (response == null) return null;
      List list = response["getProducts"];
      List<Products> productsList =
          list.map((e) => Products.fromJson(e)).toList();

      return productsList;
    }
  }

  Future<List<ProductId>?> getProductBarcode(String barcode) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/getProductBarcode',
      queryParameters: {"barcode": "$barcode"},
      accessToken: bearerToken,
    );

    if (response == null) return null;
    List list = response["getProductBarcode"];
    List<ProductId> productsList =
        list.map((e) => ProductId.fromJson(e)).toList();

    return productsList;
  }

  Future<List<ProductByCategory>?> getProductByCategory(
      String categoryId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/productByCategory',
        queryParameters: {"categoryId": categoryId},
        accessToken: bearerToken,
      );

      if (response == null) return null;
      List list = response["productByCategory"];
      List<ProductByCategory> productsList =
          list.map((e) => ProductByCategory.fromJson(e)).toList();

      return productsList;
    } else {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/productByCategory',
        queryParameters: {"categoryId": categoryId, "guestMode": "1"},
      );

      if (response == null) return null;
      List list = response["productByCategory"];
      List<ProductByCategory> productsList =
          list.map((e) => ProductByCategory.fromJson(e)).toList();

      return productsList;
    }
  }

  Future<List<Setting>?> getSetting() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      print('getSST ada');
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getSST',
        accessToken: bearerToken,
      );

      if (response == null) return null;
      List list = response["getSST"];
      List<Setting> setting = list.map((e) => Setting.fromJson(e)).toList();

      return setting;
    } else {
      print('getSST tiada');
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl, path: 'dynamic/getSST?guestMode=1');

      if (response == null) return null;
      List list = response["getSST"];
      List<Setting> setting = list.map((e) => Setting.fromJson(e)).toList();

      return setting;
    }
  }

  Future<List<Products>?> getMartProducts() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/getMartProducts',
      accessToken: bearerToken,
    );

    if (response == null) return null;
    List list = response["getMartProducts"];
    List<Products> martProductsList =
        list.map((e) => Products.fromJson(e)).toList();

    return martProductsList;
  }

  Future<List<SingleProduct>?> getSingleProduct(String idProduct) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getSingleProduct',
        accessToken: bearerToken,
        queryParameters: {"idProduct": idProduct},
      );

      if (response == null) return null;
      List list = response["getSingleProduct"];
      List<SingleProduct> singleProductsList =
          list.map((e) => SingleProduct.fromJson(e)).toList();

      return singleProductsList;
    } else {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getSingleProduct',
        queryParameters: {"idProduct": idProduct, "guestMode": "1"},
      );

      if (response == null) return null;
      List list = response["getSingleProduct"];
      List<SingleProduct> singleProductsList =
          list.map((e) => SingleProduct.fromJson(e)).toList();

      return singleProductsList;
    }
  }

  Future<List<SingleProduct>?> getSingleProductScan(String idProduct) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/getSingleProductScan',
      accessToken: bearerToken,
      queryParameters: {"idProduct": idProduct},
    );

    if (response == null) return null;
    List list = response["getSingleProductScan"];
    List<SingleProduct> singleProductsList =
        list.map((e) => SingleProduct.fromJson(e)).toList();

    return singleProductsList;
  }

  Future<List<OrderId>?> getOrderId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getOrderId',
          accessToken: bearerToken,
          queryParameters: {"profileId": profileId!});
      if (response == null) return null;
      List list = response["getOrderId"];
      List<OrderId> orderId = list.map((e) => OrderId.fromJson(e)).toList();

      return orderId;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/getOrderId',
          queryParameters: {"profileId": profileId!, "guestMode": "1"});
      if (response == null) return null;
      List list = response["getOrderId"];
      List<OrderId> orderId = list.map((e) => OrderId.fromJson(e)).toList();

      return orderId;
    }
  }

  Future<List<OrderId>?> getOrderIdWithPremis(String premisId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profileId = _prefs.getString('profileId');

    print('premisId $premisId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getOrderId',
        accessToken: bearerToken,
        queryParameters: {"profileId": profileId!, "premisId": premisId});
    if (response == null) return null;
    List list = response["getOrderId"];
    List<OrderId> orderId = list.map((e) => OrderId.fromJson(e)).toList();

    return orderId;
  }

  Future<List<Terlaris>?> getTerlarisAll(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/terlaris',
      accessToken: bearerToken,
      queryParameters: {
        "search": search,
      },
    );
    if (response == null) return null;
    List list = response["terlaris"];
    List<Terlaris> terlaris = list.map((e) => Terlaris.fromJson(e)).toList();

    return terlaris;
  }

  Future<List<Terlaris>?> getTerlarisLimit() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/terlaris',
        accessToken: bearerToken,
        queryParameters: {"limit": '5'});
    if (response == null) return null;
    List list = response["terlaris"];
    List<Terlaris> terlaris = list.map((e) => Terlaris.fromJson(e)).toList();

    return terlaris;
  }

  Future<List<Stock>?> getStockLimit() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/stock',
        accessToken: bearerToken,
        queryParameters: {"limit": '5'});
    if (response == null) return null;
    List list = response["stock"];
    List<Stock> stock = list.map((e) => Stock.fromJson(e)).toList();

    return stock;
  }

  Future<List<Stock>?> getStockAll(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/stock',
      accessToken: bearerToken,
      queryParameters: {
        "search": search,
      },
    );
    if (response == null) return null;
    List list = response["stock"];
    List<Stock> stockAll = list.map((e) => Stock.fromJson(e)).toList();

    return stockAll;
  }

  Future<List<RetailerStock>?> getRetailerStockAll(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profilId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/rStok',
      accessToken: bearerToken,
      queryParameters: {"search": search, "profileId": profilId!},
    );
    if (response == null) return null;
    List list = response["rStok"];
    List<RetailerStock> stockAll =
        list.map((e) => RetailerStock.fromJson(e)).toList();

    return stockAll;
  }

  Future<List<Sales>?> getSales(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/sales',
      accessToken: bearerToken,
      queryParameters: {
        "search": search,
      },
    );
    if (response == null) return null;
    List list = response["sales"];
    List<Sales> sales = list.map((e) => Sales.fromJson(e)).toList();

    return sales;
  }

  Future<List<Jualan>?> getJualanRetailer(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profilId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
      hostUrl: baseApiUrl,
      path: 'dynamic/rJualan',
      accessToken: bearerToken,
      queryParameters: {"search": search, "profileId": profilId!},
    );
    if (response == null) return null;
    List list = response["rJualan"];
    List<Jualan> sales = list.map((e) => Jualan.fromJson(e)).toList();

    return sales;
  }

  Future<List<ProductOrderDetails>?> getProductOrderDetails(
      String productId, String premisId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? orderId = _prefs.getString('orderId');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getProductOrderDetails',
        accessToken: bearerToken,
        queryParameters: {
          "productId": productId,
          "premisId": premisId,
          "orderId": orderId!
        },
      );
      if (response == null) return null;
      List list = response["getProductOrderDetails"];
      List<ProductOrderDetails> sales =
          list.map((e) => ProductOrderDetails.fromJson(e)).toList();

      return sales;
    } else {
      final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getProductOrderDetails',
        queryParameters: {
          "productId": productId,
          "premisId": premisId,
          "orderId": orderId!,
          "guestMode": "1"
        },
      );
      if (response == null) return null;
      List list = response["getProductOrderDetails"];
      List<ProductOrderDetails> sales =
          list.map((e) => ProductOrderDetails.fromJson(e)).toList();

      return sales;
    }
  }
}
