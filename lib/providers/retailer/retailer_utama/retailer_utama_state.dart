import 'package:flutter/material.dart';
import 'dart:math';
import 'package:apps_al_haddad/al_haddad.dart';

class RetailerUtamaState extends ChangeNotifier {
  final random = Random();
  final _statsRepo = StatisticRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isPositiveChange = false;

  bool get isPositiveChange => _isPositiveChange;

  set isPositiveChange(bool value) {
    _isPositiveChange = value;
    notifyListeners();
  }

  List<JumlahSalesBulanan>? _jumlahSalesBulanan;
  List<JumlahSalesBulanan>? get jumlahSalesBulanan => _jumlahSalesBulanan;

  List<JumlahSalesBulanan>? _jumlahSalesHarian;
  List<JumlahSalesBulanan>? get jumlahSalesHarian => _jumlahSalesHarian;

  List<CukaiBulanan>? _jumlahProdukTerjual;
  List<CukaiBulanan>? get jumlahProdukTerjual => _jumlahProdukTerjual;

  List<OnlineOrderBulanan>? _onlineOrderBulanan;
  List<OnlineOrderBulanan>? get onlineOrderBulanan => _onlineOrderBulanan;

  List<GetSalesHarianByMonth>? _salesHarianByMonth;
  List<GetSalesHarianByMonth>? get salesHarianByMonth => _salesHarianByMonth;

  List<MonthlySales>? _monthlySales;
  List<MonthlySales>? get monthlySales => _monthlySales;

  Future getRetailerJumlahJualanBulanan() async {
    try {
      _isLoading = true;
      final response = await _statsRepo.getRetailerJumlahJualanBulanan();

      if (response != null) {
        _jumlahSalesBulanan = response;
      }
    } catch (e) {
      _jumlahSalesBulanan = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getRetailerCukaiBulanan() async {
    try {
      _isLoading = true;
      final response = await _statsRepo.getRetailerCukaiBulanan();

      if (response != null) {
        _jumlahProdukTerjual = response;
      }
    } catch (e) {
      _jumlahProdukTerjual = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getRetailerTotalSalesHarian() async {
    try {
      _isLoading = true;
      final response = await _statsRepo.getRetailerTotalSalesHarian();

      if (response != null) {
        _jumlahSalesHarian = response;
      }
    } catch (e) {
      _jumlahSalesHarian = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getRetailerTotalOnlineOrder() async {
    try {
      _isLoading = true;
      final response = await _statsRepo.getRetailerTotalOnlineOrder();

      if (response != null) {
        _onlineOrderBulanan = response;
      }
    } catch (e) {
      _onlineOrderBulanan = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getSalesHarianByMonth() async {
    try {
      _isLoading = true;
      final response = await _statsRepo.getSalesHarianByMonth();

      if (response != null) {
        _salesHarianByMonth = response;
      }
    } catch (e) {
      _salesHarianByMonth = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getRetailerMonthlySales() async {
    try {
      _isLoading = true;
      final response = await _statsRepo.getRetailerMonthlySales();

      if (response != null) {
        _monthlySales = response;
      }
    } catch (e) {
      _monthlySales = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getAll() async {
    await getRetailerJumlahJualanBulanan();
    await getRetailerTotalOnlineOrder();
    await getSalesHarianByMonth();
    await getRetailerCukaiBulanan();
    await getRetailerTotalSalesHarian();
    await getRetailerMonthlySales();
  }
}
