import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrackingWebView extends StatelessWidget {
  final String trackingNo;

  const TrackingWebView({required this.trackingNo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => QRScanState(),
      child: AppWebViewPage(
        appBarTitle: 'Jejak Parcel',
        url: "https://www.tracking.my/track/$trackingNo",
        hasBackButton: true,
      ),
    );
  }
}
