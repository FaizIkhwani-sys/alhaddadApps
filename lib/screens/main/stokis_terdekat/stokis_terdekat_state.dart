import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:haversine_distance/haversine_distance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StokisTerdekatState extends ChangeNotifier {
  final _premisRepo = PremisRepository();
  final _stokisTerdekatRepo = StokisTerdekatRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Premis>? _premisList;
  List<Premis>? get premisList => _premisList;

  List<StokisTerdekat>? _stokisTerdekatList;
  List<StokisTerdekat>? get stokisTerdekatList => _stokisTerdekatList;

  String _lat = " ";
  String get lat => _lat;

  String _long = " ";
  String get long => _long;

  getLocation() async {
    try {
      final location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _lat = location.latitude.toString();
      _long = location.longitude.toString();
    } finally {
      notifyListeners();
    }
  }

  Future getPremis() async {
    try {
      _isLoading = true;
      final response = await _premisRepo.getPremis();

      if (response != null) {
        _premisList = response;
      }
    } catch (e) {
      _premisList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getStokisTerdekat() async {
    try {
      _isLoading = true;
      final response = await _stokisTerdekatRepo.getStokisTerdekat();

      if (response != null) {
        _stokisTerdekatList = response;
      }
    } catch (e) {
      _stokisTerdekatList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getAll() async {
    getStokisTerdekat();
  }
}
