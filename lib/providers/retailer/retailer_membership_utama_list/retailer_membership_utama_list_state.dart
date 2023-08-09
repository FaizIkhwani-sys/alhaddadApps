import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetailerMembershipUtamaListState extends ChangeNotifier {
  final _membershipRepo = MembershipRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Membership>? _membershipList;
  List<Membership>? get membershipList => _membershipList;

  List<Membership>? _retailerBigList;
  List<Membership>? get retailerBigList => _retailerBigList;

  List<Membership>? _retailerMediumList;
  List<Membership>? get retailerMediumList => _retailerMediumList;

  List<Membership>? _retailerSmallList;
  List<Membership>? get retailerSmallList => _retailerSmallList;

  List<Membership>? _allMembersList;
  List<Membership>? get allMembersList => _allMembersList;

  String? _searchAgent;
  String? get searchAgent => _searchAgent;
  set searchAgent(String? value) {
    _searchAgent = value;
    getMembership(value!);
    notifyListeners();
  }

  String? _searchRetailerBig;
  String? get searchRetailerBig => _searchRetailerBig;
  set searchRetailerBig(String? value) {
    _searchRetailerBig = value;
    getRetailerBig(value!);
    notifyListeners();
  }

  String? _searchRetailerMedium;
  String? get searchRetailerMedium => _searchRetailerMedium;
  set searchRetailerMedium(String? value) {
    _searchRetailerMedium = value;
    getRetailerMedium(value!);
    notifyListeners();
  }

  String? _searchRetailerSmall;
  String? get searchRetailerSmall => _searchRetailerSmall;
  set searchRetailerSmall(String? value) {
    _searchRetailerSmall = value;
    getRetailerSmall(value!);
    notifyListeners();
  }

  String? _bearer;
  String? get bearer => _bearer;
  set bearer(String? value) {
    _bearer = value;
    notifyListeners();
  }

  Future getMembership(String search) async {
    try {
      _isLoading = true;
      final response = await _membershipRepo.getRetailerMembership(search);

      if (response != null) {
        _membershipList = response;
      }
    } catch (e) {
      _membershipList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getRetailerBig(String search) async {
    try {
      _isLoading = true;
      final response = await _membershipRepo.getRetailerBig(search);

      if (response != null) {
        _retailerBigList = response;
      }
    } catch (e) {
      _retailerBigList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getRetailerMedium(String search) async {
    try {
      _isLoading = true;
      final response = await _membershipRepo.getRetailerMedium(search);

      if (response != null) {
        _retailerMediumList = response;
      }
    } catch (e) {
      _retailerMediumList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getRetailerSmall(String search) async {
    try {
      _isLoading = true;
      final response = await _membershipRepo.getRetailerSmall(search);

      if (response != null) {
        _retailerSmallList = response;
      }
    } catch (e) {
      _retailerSmallList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getAllMembers(String search) async {
    try {
      _isLoading = true;
      final response = await _membershipRepo.getAllMembers(search);

      if (response != null) {
        _allMembersList = response;
      }
    } catch (e) {
      _allMembersList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getBearer() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _bearer = _prefs.getString('BearerToken');

      print("sini dey $_bearer");
    } finally {
      notifyListeners();
    }
  }
}
