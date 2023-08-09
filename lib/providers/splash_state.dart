import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class SplashPageState extends ChangeNotifier {
  final _ordersRepo = OrdersRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _bearerToken;
  String? get bearerToken => _bearerToken;

  String? _userName;
  String? get userName => _userName;

  String? _jenisUser;
  String? get jenisUser => _jenisUser;

  String? _token;
  String? get token => _token;

  String? _email;
  String? get email => _email;

  String _lat = " ";
  String get lat => _lat;

  String _long = " ";
  String get long => _long;

  List<Orders1>? _order;
  List<Orders1>? get order => _order;

  getLocation() async {
    try {
      final location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _lat = location.latitude.toString();
      _long = location.longitude.toString();

      _prefs.setString('lat', location.latitude.toString());
      _prefs.setString('long', location.longitude.toString());

      print('https://alhaddad-admin.myrichappsproject.tk/api' +
          '?location=$_lat,$_long');
    } finally {
      notifyListeners();
    }
  }

  locationPermission() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
  }

  void initApp(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = prefs.getBool('seen') ?? false;
    await prefs.remove('orderId');
    _bearerToken = prefs.getString("BearerToken");
    _userName = prefs.getString("userName");
    _jenisUser = prefs.getString("jenisUser");
    _email = prefs.getString('userEmail');
    _token = await FirebaseMessaging.instance.getToken();
    await prefs.setString("firebaseToken", "$token");
    print('init sini');
    await getOrders();
    print("fbToken $token");
    print("userName: $userName");
    print("jenisUser: $jenisUser");
    print("bearerToken splash $bearerToken");
    print("email: $email");

    if (userName != null) {
      if (jenisUser == '1') {
        AppRoute.pushAndRemoveUntil(context, HomePage(bearerToken: bearerToken,));
      } else if (jenisUser == '2') {
        AppRoute.pushAndRemoveUntil(context, AdminHomePage());
      }
    } else {
      AppRoute.pushAndRemoveUntil(context, LogInPage());
    }
  }

  Future getOrders() async {
    try {
      _isLoading = true;
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      final response = await _ordersRepo.getOrders();

      if (response != null) {
        _order = response;
        _prefs.setString('orderId', _order![0].id!);
        print('splash order');
      }
    } catch (e) {
      _order = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
