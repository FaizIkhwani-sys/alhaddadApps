import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class DeleteAccountState extends ChangeNotifier with EmailMixin, PasswordMixin {
  final _deleteAccRepo = DeleteAccountRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool? _resp = false;
  bool? get resp => _resp;

  List<Profile>? _checkAccount;
  List<Profile>? get checkAccount => _checkAccount;

  List<UserDelete>? _users;
  List<UserDelete>? get users => _users;

  String? _reason = '';
  String? get reason => _reason;
  set reason(String? value) {
    _reason = value;
    validateReason();
  }

  String? _reasonError = '';
  String? get reasonError => _reasonError;
  bool get reasonHasError => !_reasonError.isNullOrWhiteSpace;

  void validateReason() {
    try {
      _reasonError = null;
      if (reason.isNullOrWhiteSpace) {
        _reasonError = '*required';
      }
    } finally {
      notifyListeners();
    }
  }

  // Future getUsers() async {
  //   try {
  //     _isLoading = true;
  //     final response = await _deleteAccRepo.getUsers();
  //     if (response != null) {
  //       _users = response;
  //     }
  //   } catch (e) {
  //     _users = null;
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  postDeleteAccount(BuildContext context) async {
    try {
      _isLoading = true;
      final response = await _deleteAccRepo.postDeleteAccount(email, reason!);
      if (response != null) {
        _resp = true;
      }
    } catch (e) {
      _resp = false;
    } finally {
      _isLoading = false;
      if (resp == true) {
        AppModal.showInformation(context, "Alert",
            "Account deletion request has been send. Please wait for approval. The account deletion process will take up to 7 days and we will notify you by email, after that you will not be able to login anymore.",
            onTap: () {
          AppRoute.pop(context);
          AppRoute.pop(context);
        });
      } else {
        AppModal.showInformation(
            context, "Alert", "Please check your email and password.",
            onTap: () {
          AppRoute.pop(context);
        });
      }
      notifyListeners();
    }
  }

  Future getAll() async {
    await getEmail();
  }

  validateAll() async {
    validateEmail();
    validateConfirmPassword();
    validatePassword();
    validateReason();
  }
}
