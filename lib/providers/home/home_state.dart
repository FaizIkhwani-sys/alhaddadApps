import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class HomePageState extends ChangeNotifier {
  final _profileRepo = ProfileRepository();
  final _productRepo = ProductsRepository();
  final _notiRepo = NotificationRepository();
  final _orderRepo = OrdersRepository();
  final _cartRepo = CartRepository();
  final _usersRepo = UsersRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Profile>? _profileList;
  List<Profile>? get profileList => _profileList;

  List<OrderId>? _orderId;
  List<OrderId>? get orderId => _orderId;

  List<OrderId>? _orderIdScan;
  List<OrderId>? get orderIdScan => _orderIdScan;

  List<NewNoti>? _newNotiList;
  List<NewNoti>? get newNotiList => _newNotiList;

  List<UpLine>? _upLine;
  List<UpLine>? get upLine => _upLine;

  List<Users>? _usersList;
  List<Users>? get usersList => _usersList;

  String? _userId;
  String? get userId => _userId;
  set userId(String? value) {
    _userId = value;
    notifyListeners();
  }

  String? _idJenisStokis;
  String? get idJenisStokis => _idJenisStokis;
  set idJenisStokis(String? value) {
    _idJenisStokis = value;
    notifyListeners();
  }

  String? _androidVersion;
  String? get androidVersion => _androidVersion;
  set androidVersion(String? value) {
    _androidVersion = value;
    notifyListeners();
  }

  String? _iOSVersion;
  String? get iOSVersion => _iOSVersion;
  set iOSVersion(String? value) {
    _iOSVersion = value;
    notifyListeners();
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  String? _bearerToken;
  String? get bearerToken => _bearerToken;
  set bearerToken(String? value) {
    _bearerToken = value;
    notifyListeners();
  }

  getVersion() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (Platform.isAndroid) {
      androidVersion = _prefs.getString('androidVersion');
      print('sini androidVersion home $androidVersion');
    } else if (Platform.isIOS) {
      iOSVersion = _prefs.getString('iOSVersion');
    }
  }

  Future getProfile() async {
    try {
      _isLoading = true;
      final response = await _profileRepo.getProfile('');

      if (response != null) {
        _profileList = response;
      }
    } catch (e) {
      _profileList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getUsers() async {
    try {
      _isLoading = true;
      final response = await _usersRepo.getUsers(profileList![0].usersId!);

      if (response != null) {
        _usersList = response;
      }
    } catch (e) {
      _usersList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getUpLine() async {
    try {
      _isLoading = true;
      final response = await _profileRepo.getUpLine(profileList![0].refId!);

      if (response != null) {
        _upLine = response;
      }
    } catch (e) {
      _upLine = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getOrderId() async {
    try {
      _isLoading = true;

      SharedPreferences _prefs = await SharedPreferences.getInstance();
      final response = await _productRepo.getOrderId();

      if (response != null) {
        _orderId = response;
        _prefs.setString('orderId', _orderId![0].id!);
        print('order home ${_orderId![0].id!}');
      }
    } catch (e) {
      _orderId = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getOrderIdScan() async {
    try {
      _isLoading = true;

      final response = await _orderRepo.getOrderIdScan();

      if (response != null) {
        _orderIdScan = response;
      }
    } catch (e) {
      _orderIdScan = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future deleteOrder(BuildContext context) async {
    try {
      final response = await _cartRepo.deleteOrder(orderIdScan![0].id!);
    } finally {
      AppRoute.push(context, ScanAndPayPage());
      notifyListeners();
    }
  }

  Future getNewNoti() async {
    try {
      final response = await _notiRepo.getNewNotification();

      if (response != null) {
        _newNotiList = response;
        print('sini you ${_newNotiList!.length}');
      }
    } catch (e) {
      _newNotiList = null;
      print('no new noti');
    } finally {
      notifyListeners();
    }
  }

  getAll() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    // bearerToken = _prefs.getString("BearerToken");
    await getVersion();
    await getNewNoti();
    idJenisStokis = _prefs.getString('idJenisStokis');
    await getOrderId();
  }

  getBearerToken() async {}

  getProfilePage() async {
    await getProfile();
    await getUpLine();
    await getUsers();
  }

  Future getPreScan(BuildContext context) async {
    try {
      await getOrderIdScan();
      if (_orderIdScan != null) {
        AppModal.showInformation(context, "Alert",
            "Your item(s) in cart will be deleted. Are you sure to proceed?",
            btnTitle: 'Yes', onTap: () async {
          await deleteOrder(context);
        });
      } else if (_orderIdScan == null) {
        AppRoute.push(context, ScanAndPayPage());
      }
    } finally {
      notifyListeners();
    }
  }
}
