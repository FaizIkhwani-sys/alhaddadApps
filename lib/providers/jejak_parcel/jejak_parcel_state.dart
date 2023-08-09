import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JejakParcelState extends ChangeNotifier {
  final _ordersRepo = OrdersRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Tracking>? _orderTracking;
  List<Tracking>? get orderTracking => _orderTracking;

  Future getOrdersTracking() async {
    try {
      _isLoading = true;
      final response = await _ordersRepo.getOrdersTracking();

      if (response != null) {
        _orderTracking = response;
      }
    } catch (e) {
      _orderTracking = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
