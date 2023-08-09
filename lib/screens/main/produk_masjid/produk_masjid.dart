import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class ProdukMasjidPage extends StatelessWidget {
  const ProdukMasjidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWebViewPage(
      hasBackButton: true,
      appBarTitle: 'Wadi Al Haddad',
      url: getUrlProdukMasjid(),
    );
  }
}

String getUrlProdukMasjid() {
  String url = '${BASE_URL_CUSTOMAPP}produk.php';

  return url;
}
