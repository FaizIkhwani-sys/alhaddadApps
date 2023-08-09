import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class MembershipUtamaListState extends ChangeNotifier {
  final _membershipRepo = MembershipRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Membership>? _membershipList;
  List<Membership>? get membershipList => _membershipList;

  List<Membership>? _retailerList;
  List<Membership>? get retailerList => _retailerList;

  List<Membership>? _allMembersList;
  List<Membership>? get allMembersList => _allMembersList;

  String? _searchAgent;
  String? get searchAgent => _searchAgent;
  set searchAgent(String? value) {
    _searchAgent = value;
    getMembership(value!);
    notifyListeners();
  }

  String? _searchRetailer;
  String? get searchRetailer => _searchRetailer;
  set searchRetailer(String? value) {
    _searchRetailer = value;
    getRetailer(value!);
    notifyListeners();
  }

  Future getMembership(String search) async {
    try {
      _isLoading = true;
      final response = await _membershipRepo.getMembership(search);

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

  Future getRetailer(String search) async {
    try {
      _isLoading = true;
      final response = await _membershipRepo.getRetailer(search);

      if (response != null) {
        _retailerList = response;
      }
    } catch (e) {
      _retailerList = null;
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
}
