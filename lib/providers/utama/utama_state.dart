import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class UtamaState extends ChangeNotifier {
  final _pointsRepo = PointsRepository();
  final _sliderRepo = SliderRepository();
  final _profileRepo = ProfileRepository();
  final _productRepo = ProductsRepository();
  final _orderRepo = OrdersRepository();
  final _cartRepo = CartRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _currentNews = 0;
  int get currentNews => _currentNews;
  set currentNews(int value) {
    _currentNews = value;
    notifyListeners();
  }

  int _promotion = 0;
  int get promotion => _promotion;
  set promotion(int value) {
    _promotion = value;
    notifyListeners();
  }

  String? _bearerToken;
  String? get bearerToken => _bearerToken;
  set bearerToken(String? value) {
    _bearerToken = value;
    notifyListeners();
  }

  List<SumPoints>? _sumPoints;
  List<SumPoints>? get sumPoints => _sumPoints;

  List<SliderModel>? _sliderList;
  List<SliderModel>? get sliderList => _sliderList;

  List<SliderModel>? _promotionList;
  List<SliderModel>? get promotionList => _promotionList;

  List<SliderModel>? _productCategoryList;
  List<SliderModel>? get productCategory => _productCategoryList;

  List<GetUserPoints>? _getUserPoints;
  List<GetUserPoints>? get getUserPoints => _getUserPoints;

  List<Profile>? _profileList;
  List<Profile>? get profileList => _profileList;

  List<ProductByCategory>? _productByCategoryList;
  List<ProductByCategory>? get productByCategoryList => _productByCategoryList;

  List<OrderId>? _orderIdMall;
  List<OrderId>? get orderIdMall => _orderIdMall;

  List<GetUserPoints>? _totalHibah;
  List<GetUserPoints>? get totalHibah => _totalHibah;

  Future getOrderIdMall() async {
    try {
      _isLoading = true;

      final response = await _orderRepo.getOrderIdMall();

      if (response != null) {
        _orderIdMall = response;
      }
    } catch (e) {
      _orderIdMall = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future deleteOrder(BuildContext context) async {
    try {
      final response = await _cartRepo.deleteOrder(orderIdMall![0].id!);
    } finally {
      AppRoute.push(context, ChoosePremisPage());
      notifyListeners();
    }
  }

  Future getSumPoints() async {
    try {
      _isLoading = true;

      final response = await _pointsRepo.getSumPoints();

      if (response != null) {
        _sumPoints = response;
      }
    } catch (e) {
      _sumPoints = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getTotalHibah() async {
    try {
      _isLoading = true;

      final response = await _pointsRepo.getTotalHibah();

      if (response != null) {
        _totalHibah = response;
      }
    } catch (e) {
      _totalHibah = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //getSumPoints baru
  getAllUserPoints() async {
    await getProfile();
    await userPoint();
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

  Future userPoint() async {
    try {
      _isLoading = true;

      final response =
          await _pointsRepo.getUserPoints(profileList![0].noPengenalan!);

      if (response != null) {
        _getUserPoints = response;
      }
    } catch (e) {
      _getUserPoints = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getSlider(String type) async {
    try {
      _isLoading = true;

      final response = await _sliderRepo.getSlider(type);

      if (response != null) {
        _sliderList = response;
      }
    } catch (e) {
      _sliderList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getPromotion(String type) async {
    try {
      _isLoading = true;

      final response = await _sliderRepo.getSlider(type);

      if (response != null) {
        _promotionList = response;
      }
    } catch (e) {
      _promotionList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getProductCategory() async {
    try {
      _isLoading = true;

      final response = await _sliderRepo.getProductCategory();

      if (response != null) {
        _productCategoryList = response;
      }
    } catch (e) {
      _productCategoryList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getProductByCategory(String categoryId) async {
    try {
      _isLoading = true;

      final response = await _productRepo.getProductByCategory(categoryId);

      if (response != null) {
        _productByCategoryList = response;
      }
    } catch (e) {
      _productByCategoryList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  getAll() async {
    try {
      _isLoading = true;
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      await getTotalHibah();
      await getSlider("599");
      await getPromotion("600");
      await getProductCategory();
      bearerToken = _prefs.getString('BearerToken');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
