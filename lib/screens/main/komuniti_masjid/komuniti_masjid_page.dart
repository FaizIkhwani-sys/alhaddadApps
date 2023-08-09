import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class KomunitiMasjidPage extends StatelessWidget {
  const KomunitiMasjidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWebViewPage(
      hasBackButton: true,
      appBarTitle: 'Al Haddad Farm Village',
      url: getUrlKomuniti(),
    );
  }
}

String getUrlKomuniti() {
  String url =
      'https://customapp.gomasjidpro.com';

  return url;
}
