import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:path/path.dart';

class TermsAndConditionPage extends StatelessWidget {
  final String? url;

  const TermsAndConditionPage({this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWebViewPage(
      hasBackButton: true,
      appBarTitle: 'Terms and Condition',
      url: termaSyarat(url!),
    );
  }
}

String termaSyarat(String link) {
  String url = link;

  return url;
}
