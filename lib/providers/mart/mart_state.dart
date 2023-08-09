import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MartState extends ChangeNotifier {
  final _productsRepo = ProductsRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Products>? _productsList;
  List<Products>? get productsList => _productsList;

  //page mart_page
  Future getProducts() async {
    try {
      _isLoading = true;
      final response = await _productsRepo.getMartProducts();

      if (response != null) {
        _productsList = response;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
