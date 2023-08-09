import 'package:apps_al_haddad/repository/admin_profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class AdminProfileState extends ChangeNotifier {
  final _adminProfileRepo = AdminProfileRepository();
  final _productRepo = ProductsRepository();
  final _transactionRepo = TransactionRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isClicked = false;
  bool get isClicked => _isClicked;
  set isClicked(bool value) {
    _isClicked = value;
    notifyListeners();
  }

  String? _searchTerlaris;
  String? get searchTerlaris => _searchTerlaris;
  set searchTerlaris(String? value) {
    _searchTerlaris = value;
    getTerlarisAll(value!);
    notifyListeners();
  }

  String? _searchStock;
  String? get searchStock => _searchStock;
  set searchStock(String? value) {
    _searchStock = value;
    getStockAll(value!);
    notifyListeners();
  }

  String? _searchSales;
  String? get searchSales => _searchSales;
  set searchSales(String? value) {
    _searchSales = value;
    getSales(value!);
    notifyListeners();
  }

  List<AdminProfile>? _adminProfile;
  List<AdminProfile>? get adminProfile => _adminProfile;

  List<Terlaris>? _terlarisAll;
  List<Terlaris>? get terlarisAll => _terlarisAll;

  List<Terlaris>? _terlarisLimit;
  List<Terlaris>? get terlarisLimit => _terlarisLimit;

  List<Stock>? _stockLimit;
  List<Stock>? get stockLimit => _stockLimit;

  List<Stock>? _stockAll;
  List<Stock>? get stockAll => _stockAll;

  List<Sales>? _sales;
  List<Sales>? get sales => _sales;

  List<PaymentRequest>? _paymentRequest;
  List<PaymentRequest>? get paymentRequest => _paymentRequest;

  updateDone(BuildContext context, String requestId) async {
    try {
      _isLoading = true;

      final response = await _transactionRepo.updateDone(requestId);

      if (response != null) {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: Colors.transparent,
              child: AppAlertDialog(
                alertDialogType: AlertDialogType.success,
                title: "Congratulation",
                subtitle: '',
                description: "Transaction Success",
                actionButtons: [
                  ActionButton(
                    label: 'Back',
                    color: secondaryColor,
                    onTap: () {
                      AppRoute.pop(context);
                      AppRoute.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  updateReject(BuildContext context, String requestId) async {
    try {
      _isLoading = true;

      final response = await _transactionRepo.updateReject(requestId);

      if (response != null) {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: Colors.transparent,
              child: AppAlertDialog(
                alertDialogType: AlertDialogType.success,
                title: "Congratulation",
                subtitle: '',
                description: "Done",
                actionButtons: [
                  ActionButton(
                    label: 'Back',
                    color: secondaryColor,
                    onTap: () {
                      AppRoute.pop(context);
                      AppRoute.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getAdminProfile() async {
    try {
      _isLoading = true;
      final response = await _adminProfileRepo.getAdminProfile();

      if (response != null) {
        _adminProfile = response;
      }
    } catch (e) {
      _adminProfile = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getPaymentRequest() async {
    try {
      _isLoading = true;
      final response = await _transactionRepo.getPaymentRequest();

      if (response != null) {
        _paymentRequest = response;
      }
    } catch (e) {
      _paymentRequest = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getTerlarisAll(String search) async {
    try {
      _isLoading = true;
      final response = await _productRepo.getTerlarisAll(search);

      if (response != null) {
        _terlarisAll = response;
      }
    } catch (e) {
      _terlarisAll = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getTerlarisLimit() async {
    try {
      _isLoading = true;
      final response = await _productRepo.getTerlarisLimit();

      if (response != null) {
        _terlarisLimit = response;
      }
    } catch (e) {
      _terlarisLimit = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getStockLimit() async {
    try {
      _isLoading = true;
      final response = await _productRepo.getStockLimit();

      if (response != null) {
        _stockLimit = response;
      }
    } catch (e) {
      _stockLimit = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getStockAll(String search) async {
    try {
      _isLoading = true;
      final response = await _productRepo.getStockAll(search);

      if (response != null) {
        _stockAll = response;
      }
    } catch (e) {
      _stockAll = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getSales(String search) async {
    try {
      _isLoading = true;
      final response = await _productRepo.getSales(search);

      if (response != null) {
        _sales = response;
      }
    } catch (e) {
      _sales = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getAll() async {
    getTerlarisLimit();
    getStockLimit();
  }
}
