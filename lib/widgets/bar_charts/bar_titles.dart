import 'package:apps_al_haddad/al_haddad.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../model/admin/bar_data.dart';

class BarTitles {
  static SideTitles getTopBottomTitles() => SideTitles(
    showTitles: true,
    getTextStyles: (value) =>
    const TextStyle(color: Colors.white, fontSize: 10),
    margin: 10,
    getTitles: (double id) => BarData.barData
        .firstWhere((element) => element.id == id.toInt())
        .name,
  );

  static SideTitles getSideTitles() => SideTitles(
    showTitles: true,
    getTextStyles: (value) =>
    const TextStyle(color: Colors.white, fontSize: 10),
    rotateAngle: 90,
    interval: BarData.interval.toDouble(),
    margin: 10,
    reservedSize: 30,
    getTitles: (double value) => value == 0 ? '0' : '${value.toInt()}k',
  );
}