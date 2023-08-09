import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMembershipPage extends StatelessWidget {
  final String bearerToken;

  const AddMembershipPage({required this.bearerToken, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => QRScanState(),
      child: AppWebViewPage(
        appBarTitle: 'Add Membership',
        url: "https://alhaddad-admin.myrichappsproject.tk/membership?noHeader=1",
        hasBackButton: true,
        bearerToken: bearerToken,
      ),
    );
  }
}
