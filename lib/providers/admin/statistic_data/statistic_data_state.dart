
import 'dart:math';

import 'package:flutter/material.dart';

class StatisticDataState extends ChangeNotifier{
  List<String> namaMenu = [
    "Product",
    "Sales",
    "Employee",
  ];

  List<IconData> iconMenuHomeAdmin = [
    Icons.monetization_on_outlined,
    Icons.bookmark_border,
    Icons.check_box,
  ];

  final random = Random();

  List<String> titleContoh = [
    "Sales Minggu Ini.",
    "Produk Terlaris Minggu Ini.",
    "Qahwa Mart Sales.",
  ];
}