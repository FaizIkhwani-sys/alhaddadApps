import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class RetailerLaporanJualanState extends ChangeNotifier {
  final _statRepo = StatisticRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isClicked = false;
  bool get isClicked => _isClicked;
  set isClicked(bool value) {
    _isClicked = value;
    notifyListeners();
  }

  String? _search;
  String? get search => _search;
  set search(String? value) {
    _search = value;
    getEcommerce(value!);
    notifyListeners();
  }

  List<Retailer>? _retailList;
  List<Retailer>? get retailList => _retailList;

  List<Ecommerce>? _ecommerceList;
  List<Ecommerce>? get ecommerceList => _ecommerceList;

  Future getRetailer() async {
    try {
      _isLoading = true;
      final response = await _statRepo.getRetailer();

      if (response != null) {
        _retailList = response;
      }
    } catch (e) {
      _retailList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getEcommerce(String search) async {
    try {
      _isLoading = true;
      final response = await _statRepo.getEcommerce(search);

      if (response != null) {
        _ecommerceList = response;
      }
    } catch (e) {
      _ecommerceList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
