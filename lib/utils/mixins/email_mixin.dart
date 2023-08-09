import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:intl/intl.dart';

mixin EmailMixin on ChangeNotifier {
  final _deleteAccRepo = DeleteAccountRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<EmailDelete>? _emailList = [];
  List<EmailDelete>? get emailList => _emailList;

  List<UserDelete>? _userEmail = [];
  List<UserDelete>? get userEmail => _userEmail;

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    // getUsersEmail(value);
    validateEmail();
  }

  String? _emailFromDB;
  String? get emailFromDB => _emailFromDB;
  set emailFromDB(String? value) {
    _emailFromDB = value;
    notifyListeners();
  }

  String? _emailError = '';
  String? get emailError => _emailError;
  bool get emailHasError => !_emailError.isNullOrWhiteSpace;

  void validateEmail() {
    try {
      _emailError = null;
      if (email.isNullOrWhiteSpace) {
        _emailError = '*required';
        return;
      }
      if (!email.isEmail) {
        _emailError = 'Unauthorised email';
        return;
      }
      for (int i = 0; i < emailList!.length; i++) {
        if (email == _emailList![i].email) {
          _emailError =
              'Request for deleting account with this email has been issued on ${DateFormat('dd-MM-yyyy').format(DateTime.parse(emailList![i].createdAt!))}.';
          return;
        }
      }
      // if (userEmail == null) {
      //   _emailError = 'No record found';
      // }
    } finally {
      notifyListeners();
    }
  }

  Future getEmail() async {
    try {
      final response = await _deleteAccRepo.getEmailDelete();
      if (response != null) {
        _emailList = response;
      }
    } catch (e) {
      _emailList = [];
    } finally {
      notifyListeners();
    }
  }

  Future getUsersEmail(String email) async {
    try {
      _isLoading = true;
      final response = await _deleteAccRepo.getUsersEmail(email);
      if (response != null) {
        _userEmail = response;
      }
    } catch (e) {
      _userEmail = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
