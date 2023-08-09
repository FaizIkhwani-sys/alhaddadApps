import 'package:flutter/material.dart';
import 'dart:math';
import 'package:apps_al_haddad/al_haddad.dart';

class AdminUtamaState extends ChangeNotifier {
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

  List<JumlahSalesBulanan>? _jumlahSalesBulanan = [];
  List<JumlahSalesBulanan>? get jumlahSalesBulanan => _jumlahSalesBulanan;

  List<JumlahSalesBulanan>? _jumlahSalesHarian;
  List<JumlahSalesBulanan>? get jumlahSalesHarian => _jumlahSalesHarian;

  List<JumlahSalesBulanan>? _jumlahProdukTerjual = [];
  List<JumlahSalesBulanan>? get jumlahProdukTerjual => _jumlahProdukTerjual;

  List<OnlineOrderBulanan>? _onlineOrderBulanan;
  List<OnlineOrderBulanan>? get onlineOrderBulanan => _onlineOrderBulanan;

  List<GetSalesHarianByMonth>? _salesHarianByMonth;
  List<GetSalesHarianByMonth>? get salesHarianByMonth => _salesHarianByMonth;

  Future getJumlahJualanBulanan() async {
    try {
      _isLoading = true;
      final response = await _statsRepo.getJumlahJualanBulanan();

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

  Future getJumlahProdukTerjual() async {
    try {
      _isLoading = true;
      final response = await _statsRepo.getJumlahProdukTerjual();

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

  Future getTotalSalesHarian() async {
    try {
      _isLoading = true;
      final response = await _statsRepo.getTotalSalesHarian();

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

  Future getTotalOnlineOrder() async {
    try {
      _isLoading = true;
      final response = await _statsRepo.getTotalOnlineOrder();

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

  Future getAll() async {
    await getJumlahJualanBulanan();
    await getTotalOnlineOrder();
    await getSalesHarianByMonth();
    await getJumlahProdukTerjual();
    await getTotalSalesHarian();
  }

  List<String> tarikh = [
    "1 May",
    "2 May",
    "3 May",
    "4 May",
    "5 May",
    "6 May",
    "7 May",
    "8 May",
    "9 May",
    "10 May",
  ];

  List<int> value = [
    35,
    40,
    20,
    15,
    10,
    32,
    39,
    42,
    50,
    35,
  ];
  //
  final List<SalesData> data = [
    SalesData('1 May', 35),
    SalesData('2 May', 40),
    SalesData('3 May', 20),
    SalesData('4 May', 15),
    SalesData('5 May', 10),
    SalesData('6 May', 32),
    SalesData('7 May', 39),
    SalesData('8 May', 42),
  ];
}

class SalesData {
  SalesData(this.days, this.sales);

  final String days;
  final double sales;
}
