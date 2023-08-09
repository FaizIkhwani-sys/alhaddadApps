import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceWebView extends StatelessWidget {
  final String baseURL;
  final String lat;
  final String long;

  const AttendanceWebView(
      {required this.baseURL, required this.lat, required this.long, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => QRScanState(),
      child: AppWebViewPage(
        appBarTitle: 'Attendance',
        url: baseURL + "?location=$lat,$long",
        hasBackButton: true,
      ),
    );
  }
}
