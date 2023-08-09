import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class CheckMembershipPageState extends ChangeNotifier with UserNameMixin {
  void validateAll() {
    validateUserName();
  }
}
