import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';

import '../../utils/mixins/mixins.dart';

class RegisterPageState extends ChangeNotifier
    with
        TextControllerMixin,
        UserNameMixin,
        PasswordMixin,
        PhoneMixin,
        NameMixin,
        EmailMixin {
  String? _studentType;
  String? get studentType => _studentType;
  set studentType(String? value) {
    _studentType = value;
    notifyListeners();
  }

  bool _termsAndCondition = false;
  bool get termsAndCondition => _termsAndCondition;
  set termsAndCondition(bool value) {
    _termsAndCondition = value;
    notifyListeners();
  }

  void validateAll() {
    validateName();
    validateUserName();
    validatePhone();
    validateEmail();
    validatePassword();
  }

  final _registerRepo = RegisterRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _userId;
  String? get userId => _userId;

  Future register(BuildContext context) async {
    try {
      _isLoading = true;
      final response = await _registerRepo.postUsers(userName, password, email);
      if (response != null) {
        _userId = response['insertRecord']['last_id'];
        final response2 = await _registerRepo.postProfil(userId, name, phone);
        if (response2 != null) {
          await showDialog(
            useSafeArea: true,
            context: context,
            builder: (_) => AppAlertDialog(
              alertDialogType: AlertDialogType.success,
              title: 'Tahniah',
              subtitle: 'Anda telah berjaya mendaftar.',
              // description: 'Sila kemaskini maklumat anda.',
              actionButtons: [
                ActionButton(
                  label: 'Log Masuk',
                  onTap: () =>
                      AppRoute.pushAndRemoveUntil(context, LogInPage()),
                  color: successColor,
                ),
              ],
            ),
          );
        }
      }
    } catch (e) {
      print(e);
      _isLoading = false;
      showDialog(
        useSafeArea: true,
        context: context,
        builder: (_) => AppAlertDialog(
          alertDialogType: AlertDialogType.warning,
          title: 'Pemberitahuan',
          subtitle:
              'Pendaftaran tidak berjaya, sila semak maklumat anda semula.',
          // description: 'Sila kemaskini maklumat anda.',
          actionButtons: [
            ActionButton(
              label: 'Tutup',
              onTap: () => {
                AppRoute.pop(context),
                AppRoute.pop(context),
              },
              color: warningColor,
            ),
          ],
        ),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
