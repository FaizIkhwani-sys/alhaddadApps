import 'package:flutter/material.dart';

import '../../utils/mixins/username_mixin.dart';

class ForgotPasswordPageState extends ChangeNotifier with UserNameMixin {
  void validateAll() {
    validateUserName();
  }

  Future forgotPassword() async {}
}
