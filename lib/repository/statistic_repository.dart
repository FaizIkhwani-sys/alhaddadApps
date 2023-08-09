import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticRepository extends BaseRepository {
  Future<List<JumlahSalesBulanan>?> getJumlahJualanBulanan() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/jumlahSalesBulanan',
        accessToken: bearerToken);

    if (response == null) return null;
    List list = response["jumlahSalesBulanan"];
    List<JumlahSalesBulanan> jumlahSalesBulanan =
        list.map((e) => JumlahSalesBulanan.fromJson(e)).toList();

    return jumlahSalesBulanan;
  }

  Future<List<JumlahSalesBulanan>?> getRetailerJumlahJualanBulanan() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profilId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/rJualanBulanan',
        accessToken: bearerToken,
        queryParameters: {"profileId": profilId!});

    if (response == null) return null;
    List list = response["rJualanBulanan"];
    List<JumlahSalesBulanan> jumlahSalesBulanan =
        list.map((e) => JumlahSalesBulanan.fromJson(e)).toList();

    return jumlahSalesBulanan;
  }

  Future<List<JumlahSalesBulanan>?> getJumlahProdukTerjual() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/totalProdukTerjual',
        accessToken: bearerToken);

    if (response == null) return null;
    List list = response["totalProdukTerjual"];
    List<JumlahSalesBulanan> totalProdukTerjual =
        list.map((e) => JumlahSalesBulanan.fromJson(e)).toList();

    return totalProdukTerjual;
  }

  Future<List<JumlahSalesBulanan>?> getTotalSalesHarian() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/jumlahJualanHarian',
        accessToken: bearerToken);

    if (response == null) return null;
    List list = response["jumlahJualanHarian"];
    List<JumlahSalesBulanan> jumlahJualanHarian =
        list.map((e) => JumlahSalesBulanan.fromJson(e)).toList();

    return jumlahJualanHarian;
  }

  Future<List<JumlahSalesBulanan>?> getRetailerTotalSalesHarian() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profilId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/rSalesHarini',
        accessToken: bearerToken,
        queryParameters: {"profileId": profilId!});

    if (response == null) return null;
    List list = response["rSalesHarini"];
    List<JumlahSalesBulanan> jumlahJualanHarian =
        list.map((e) => JumlahSalesBulanan.fromJson(e)).toList();

    return jumlahJualanHarian;
  }

  Future<List<OnlineOrderBulanan>?> getTotalOnlineOrder() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/onlineOrderBulanan',
        accessToken: bearerToken);

    if (response == null) return null;
    List list = response["onlineOrderBulanan"];
    List<OnlineOrderBulanan> onlineOrderBulanan =
        list.map((e) => OnlineOrderBulanan.fromJson(e)).toList();

    return onlineOrderBulanan;
  }

  Future<List<OnlineOrderBulanan>?> getRetailerTotalOnlineOrder() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profilId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/rOnlineOrder',
        accessToken: bearerToken,
        queryParameters: {"profileId": profilId!});

    if (response == null) return null;
    List list = response["rOnlineOrder"];
    List<OnlineOrderBulanan> onlineOrderBulanan =
        list.map((e) => OnlineOrderBulanan.fromJson(e)).toList();

    return onlineOrderBulanan;
  }

  Future<List<GetSalesHarianByMonth>?> getSalesHarianByMonth() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/getSalesHarianByMonth',
        accessToken: bearerToken);

    print('sini');

    if (response == null) return null;
    List list = response["getSalesHarianByMonth"];
    List<GetSalesHarianByMonth> getSalesHarianByMonth =
        list.map((e) => GetSalesHarianByMonth.fromJson(e)).toList();

    return getSalesHarianByMonth;
  }

  Future<List<Retailer>?> getRetailer() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/retailer',
        accessToken: bearerToken);

    if (response == null) return null;
    List list = response["retailer"];
    List<Retailer> retailerList =
        list.map((e) => Retailer.fromJson(e)).toList();

    return retailerList;
  }

  Future<List<Ecommerce>?> getEcommerce(String search) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/ecommerce',
        queryParameters: {
          "search": search,
        },
        accessToken: bearerToken);

    if (response == null) return null;
    List list = response["ecommerce"];
    List<Ecommerce> ecommerceList =
        list.map((e) => Ecommerce.fromJson(e)).toList();

    return ecommerceList;
  }

  Future<List<CukaiBulanan>?> getRetailerCukaiBulanan() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profilId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/rCukaiBulanan',
        accessToken: bearerToken,
        queryParameters: {"profileId": profilId!});

    if (response == null) return null;
    List list = response["rCukaiBulanan"];
    List<CukaiBulanan> cukaiBulanan =
        list.map((e) => CukaiBulanan.fromJson(e)).toList();

    return cukaiBulanan;
  }

  Future<List<MonthlySales>?> getRetailerMonthlySales() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');
    String? profilId = _prefs.getString('profileId');

    final response = await APIHelper().getRequestWithToken(
        hostUrl: baseApiUrl,
        path: 'dynamic/rMonthlySales',
        accessToken: bearerToken,
        queryParameters: {"profileId": profilId!});

    if (response == null) return null;
    List list = response["rMonthlySales"];
    List<MonthlySales> monthlySales =
        list.map((e) => MonthlySales.fromJson(e)).toList();

    return monthlySales;
  }
}
