import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'package:flutter/services.dart';

final List<Map<String, dynamic>> page = [
  {
    'page': UtamaPage(),
    'title': 'Al Haddad Team',
  },
  {
    'page': TransactionPage(),
    'title': 'Transactions',
  },
  {
    'page': Container(),
    'title': 'Scan & Pay',
  },
  {
    'page': NotificationPage(),
    'title': 'Notification',
  },
  {
    'page': ProfilePage(),
    'title': 'My Account',
  }
];

final List<Map<String, dynamic>> pageHide = [
  {
    'page': UtamaPage(),
    'title': 'Al Haddad Team',
  },
  {
    'page': TransactionPage(),
    'title': 'Transactions',
  },
  // {
  //   'page': LatestNewsPage(),
  //   'title': 'Scan & Pay',
  // },
  {
    'page': NotificationPage(),
    'title': 'Notification',
  },
  {
    'page': ProfilePage(),
    'title': 'My Account',
  }
];
