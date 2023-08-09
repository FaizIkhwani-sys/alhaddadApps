import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';

class BarData {
  static int interval = 5;

  static List<DataBar> barData = [
    DataBar(
      id: 0,
      name: 'Mon',
      y: 15,
      color: Color(0xff19bfff),
    ),
    DataBar(
      name: 'Tue',
      id: 1,
      y: 12,
      color: Color(0xffff4d94),
    ),
    DataBar(
      name: 'Wed',
      id: 2,
      y: 11,
      color: Color(0xff2bdb90),
    ),
    DataBar(
      name: 'Thu',
      id: 3,
      y: 10,
      color: Color(0xffffdd80),
    ),
    DataBar(
      name: 'Fri',
      id: 4,
      y: 5,
      color: Color(0xff2bdb90),
    ),
    DataBar(
      name: 'Sat',
      id: 5,
      y: 17,
      color: Color(0xffffdd80),
    ),
    DataBar(
      name: 'Sun',
      id: 6,
      y: 5,
      color: Color(0xffff4d94),
    ),
  ];
}
