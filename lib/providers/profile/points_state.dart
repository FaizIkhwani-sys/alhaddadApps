import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PointsState extends ChangeNotifier {
  final _pointsRepo = PointsRepository();
  final _profileRepo = ProfileRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _message = '';
  String get message => _message;

  List<GetUserPoints>? _getUserPoints;
  List<GetUserPoints>? get getUserPoints => _getUserPoints;

  List<GetUserPoints>? _totalHibah;
  List<GetUserPoints>? get totalHibah => _totalHibah;

  List<GetUserPoints>? _dailyHibah;
  List<GetUserPoints>? get dailyHibah => _dailyHibah;

  List<GetUserPoints>? _weeklyHibah;
  List<GetUserPoints>? get weeklyHibah => _weeklyHibah;

  List<GetUserPoints>? _monthlyHibah;
  List<GetUserPoints>? get monthlyHibah => _monthlyHibah;

  List<Profile>? _profileList;
  List<Profile>? get profileList => _profileList;

  List<Loyalty>? _loyalty;
  List<Loyalty>? get loyalty => _loyalty;

  String _pointsError = '';
  String get pointsError => _pointsError;
  bool get pointsHasError => !_pointsError.isNullOrWhiteSpace;

  String _points = '';
  String get points => _points;
  set points(String value) {
    _points = value;
    getTotalHibah();
    validatePoints();
    notifyListeners();
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

  Future getLoyalty() async {
    try {
      _isLoading = true;
      final response = await _pointsRepo.getLoyalty();

      if (response != null) {
        _loyalty = response;
      }
    } catch (e) {
      _loyalty = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  validatePoints() {
    try {
      _pointsError = '';
      if (points.isNullOrWhiteSpace) {
        _pointsError = '*required';
        return;
      }

      if (double.parse(_points) > (double.parse(totalHibah![0].point!) - 10)) {
        _pointsError = 'Minimum balance must be RM10';
        return;
      }
    } finally {
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
    await getProfile();
    await getTotalHibah();
    await getDailyHibah();
    await getWeeklyHibah();
    await getMonthlyHibah();
    await getLoyalty(); // hibah history
  }
}
