import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

final List<Map<String, dynamic>> pageAdmin = [
  {
    'page': AdminUtamaPage(),
    'title': 'Utama',
  },
  {
    'page': MembershipUtamaListPage(),
    'title': 'Membership',
  },
  {
    'page': SendNotificationPage(),
    'title': 'Membership',
  },
  {
    'page': LaporanJualanPage(),
    'title': 'Sales Management',
  },
  {
    'page': AdminProfilePage(),
    'title': 'Profile',
  },
];

final List<Map<String, dynamic>> pageRetailer = [
  {
    'page': RetailerUtamaPage(),
    'title': 'Retailer',
  },
  {
    'page': RetailerNotificationPage(),
    'title': 'Notification',
  },
  {
    'page': RetailerMembershipUtamaListPage(),
    'title': 'Retailer Membership',
  },
  {
    'page': RetailerProfilePage(),
    'title': 'Profile',
  },
];
