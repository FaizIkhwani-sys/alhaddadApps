import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SliderRepository extends BaseRepository {
  Future<List<SliderModel>?> getSlider(String type) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/slider',
          queryParameters: {"type": type},
          accessToken: bearerToken);

      if (response == null) return null;
      List list = response["slider"];
      List<SliderModel> sliderList =
          list.map((e) => SliderModel.fromJson(e)).toList();

      return sliderList;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/slider',
          queryParameters: {"type": type, "guestMode": "1"},
          accessToken: bearerToken);

      if (response == null) return null;
      List list = response["slider"];
      List<SliderModel> sliderList =
          list.map((e) => SliderModel.fromJson(e)).toList();

      return sliderList;
    }
  }

  Future<List<SliderModel>?> getProductCategory() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? bearerToken = _prefs.getString('BearerToken');

    if (bearerToken != null) {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/productCategory',
          accessToken: bearerToken);

      if (response == null) return null;
      List list = response["productCategory"];
      List<SliderModel> productCategory =
          list.map((e) => SliderModel.fromJson(e)).toList();

      return productCategory;
    } else {
      final response = await APIHelper().getRequestWithToken(
          hostUrl: baseApiUrl,
          path: 'dynamic/productCategory',
          queryParameters: {"guestMode": "1"});

      if (response == null) return null;
      List list = response["productCategory"];
      List<SliderModel> productCategory =
          list.map((e) => SliderModel.fromJson(e)).toList();

      return productCategory;
    }
  }
}
