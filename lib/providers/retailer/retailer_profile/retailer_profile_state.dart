import 'package:apps_al_haddad/repository/admin_profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class RetailerProfileState extends ChangeNotifier {
  final _adminProfileRepo = AdminProfileRepository();
  final _productRepo = ProductsRepository();
  final _pointsRepo = PointsRepository();
  final _profileRepo = ProfileRepository();
  final _usersRepo = UsersRepository();

  List<UpLine>? _upLine;
  List<UpLine>? get upLine => _upLine;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _message = '';
  String get message => _message;

  bool _isClicked = false;
  bool get isClicked => _isClicked;
  set isClicked(bool value) {
    _isClicked = value;
    notifyListeners();
  }

  String _points = '';
  String get points => _points;
  set points(String value) {
    _points = value;
    getTotalHibah();
    validatePoints();
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
    getRetailerStockAll(value!);
    notifyListeners();
  }

  String? _searchSales;
  String? get searchSales => _searchSales;
  set searchSales(String? value) {
    _searchSales = value;
    getSales(value!);
    notifyListeners();
  }

  List<Users>? _usersList;
  List<Users>? get usersList => _usersList;

  List<GetUserPoints>? _totalHibah;
  List<GetUserPoints>? get totalHibah => _totalHibah;

  List<GetUserPoints>? _dailyHibah;
  List<GetUserPoints>? get dailyHibah => _dailyHibah;

  List<GetUserPoints>? _weeklyHibah;
  List<GetUserPoints>? get weeklyHibah => _weeklyHibah;

  List<GetUserPoints>? _monthlyHibah;
  List<GetUserPoints>? get monthlyHibah => _monthlyHibah;

  List<AdminProfile>? _adminProfile;
  List<AdminProfile>? get adminProfile => _adminProfile;

  List<Terlaris>? _terlarisAll;
  List<Terlaris>? get terlarisAll => _terlarisAll;

  List<Terlaris>? _terlarisLimit;
  List<Terlaris>? get terlarisLimit => _terlarisLimit;

  List<Stock>? _stockLimit;
  List<Stock>? get stockLimit => _stockLimit;

  List<RetailerStock>? _retailerStockAll;
  List<RetailerStock>? get retailerStockAll => _retailerStockAll;

  List<Sales>? _sales;
  List<Sales>? get sales => _sales;

  List<Jualan>? _jualan;
  List<Jualan>? get jualan => _jualan;

  List<SumPoints>? _currentPoints;
  List<SumPoints>? get currentPoints => _currentPoints;

  List<Profile>? _profile;
  List<Profile>? get profile => _profile;

  List<RequestPayment>? _requestPayment;
  List<RequestPayment>? get requestPayment => _requestPayment;

  String _pointsError = '';
  String get pointsError => _pointsError;
  bool get pointsHasError => !_pointsError.isNullOrWhiteSpace;

  validatePoints() {
    try {
      _pointsError = '';
      if (points.isNullOrWhiteSpace) {
        _pointsError = '*required';
        return;
      }

      if (double.parse(_points) > (double.parse(_totalHibah![0].point!) - 10)) {
        _pointsError = 'Minimum balance must be RM10';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  Future getUsers() async {
    try {
      _isLoading = true;
      final response = await _usersRepo.getUsers(adminProfile![0].usersId!);

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

  Future getRetailerProfile() async {
    try {
      _isLoading = true;
      final response = await _adminProfileRepo.getRetailerProfile();

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

  Future getUpLine() async {
    try {
      _isLoading = true;
      final response = await _profileRepo.getUpLine(adminProfile![0].refId!);

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

  Future getRetailerStockAll(String search) async {
    try {
      _isLoading = true;
      final response = await _productRepo.getRetailerStockAll(search);

      if (response != null) {
        _retailerStockAll = response;
      }
    } catch (e) {
      _retailerStockAll = null;
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

  Future getJualanRetailer(String search) async {
    try {
      _isLoading = true;
      final response = await _productRepo.getJualanRetailer(search);

      if (response != null) {
        _jualan = response;
      }
    } catch (e) {
      _jualan = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getSumPoints() async {
    try {
      _isLoading = true;
      final response = await _pointsRepo.getSumPoints();

      if (response != null) {
        _currentPoints = response;
      }
    } catch (e) {
      _currentPoints = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getRequestPayment() async {
    try {
      _isLoading = true;
      final response = await _pointsRepo.getRequestPayment();

      if (response != null) {
        _requestPayment = response;
      }
    } catch (e) {
      _requestPayment = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getProfile() async {
    try {
      _isLoading = true;
      final response = await _profileRepo.getProfile('');

      if (response != null) {
        _profile = response;
      }
    } catch (e) {
      _profile = null;
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

  Future getDailyHibah() async {
    try {
      _isLoading = true;

      final response = await _pointsRepo.getDailyHibah();

      if (response != null) {
        _dailyHibah = response;
      }
    } catch (e) {
      _dailyHibah = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getWeeklyHibah() async {
    try {
      _isLoading = true;

      final response = await _pointsRepo.getWeeklyHibah();

      if (response != null) {
        _weeklyHibah = response;
      }
    } catch (e) {
      _weeklyHibah = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getMonthlyHibah() async {
    try {
      _isLoading = true;

      final response = await _pointsRepo.getMonthlyHibah();

      if (response != null) {
        _monthlyHibah = response;
      }
    } catch (e) {
      _monthlyHibah = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future postLoyalty(String points) async {
    try {
      _isLoading = true;

      final response = await _pointsRepo.postLoyalty(points);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future postRequestPoint(BuildContext context) async {
    try {
      final response = await _pointsRepo.postRequestPoint(points);
      if (response != null) {
        _message = response['msg'];
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: Colors.transparent,
              child: AppAlertDialog(
                alertDialogType: AlertDialogType.success,
                title: "Success",
                subtitle: '',
                description: message,
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
    } catch (error) {
      if (error is APIException) {
        _message = error.errorMessage();
        showDialog(
          context: context,
          builder: (_) {
            return AppAlertDialog(
              alertDialogType: AlertDialogType.warning,
              title: "Fail",
              subtitle: '',
              description: message,
              actionButtons: [
                ActionButton(
                  label: 'Back',
                  color: secondaryColor,
                  onTap: () {
                    AppRoute.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    } finally {
      notifyListeners();
    }
  }

  Future getAll() async {
    getTerlarisLimit();
    getStockLimit();
  }

  getProfilePage() async {
    await getRetailerProfile();
    await getUsers();
    await getUpLine();
  }

  getAllRequestPayment() async {
    await getTotalHibah();
    await getDailyHibah();
    await getWeeklyHibah();
    await getMonthlyHibah();
    await getRequestPayment();
  }
}
