import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MembershipListState extends ChangeNotifier {
  final _membershipListRepo = MembershipListRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<MembershipList>? _membershipList;
  List<MembershipList>? get membershipList => _membershipList;

  String? _bearer;
  String? get bearer => _bearer;
  set bearer(String? value) {
    _bearer = value;
    notifyListeners();
  }

  Future getMembershipList() async {
    try {
      _isLoading = true;
      final response = await _membershipListRepo.getMembershipList();

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

  Future getBearer() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    _bearer = _prefs.getString('BearerToken');
  }
}
