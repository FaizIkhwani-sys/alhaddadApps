import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class AddressSettingState extends ChangeNotifier with TextControllerMixin {
  final _profileRepo = ProfileRepository();
  final _negeriRepo = NegeriRepository();
  final _daerahRepo = DaerahRepository();
  final _ordersRepo = OrdersRepository();

  String _message = '';
  String get message => _message;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Profile>? _profileList;
  List<Profile>? get profileList => _profileList;

  List<Pilihan>? _negeriList;
  List<Pilihan>? get negeriList => _negeriList;

  List<Pilihan>? _currentNegeri;
  List<Pilihan>? get currentNegeri => _currentNegeri;

  List<Pilihan>? _daerahList;
  List<Pilihan>? get daerahList => _daerahList;

  List<Pilihan>? _currentDaerah;
  List<Pilihan>? get currentDaerah => _currentDaerah;

  List<Orders1>? _order;
  List<Orders1>? get order => _order;

  String _address = '';
  String get address => _address;
  set address(String value) {
    _address = value;
    notifyListeners();
  }

  String _address2 = '';
  String get address2 => _address2;
  set address2(String value) {
    _address2 = value;
    notifyListeners();
  }

  String _address3 = '';
  String get address3 => _address3;
  set address3(String value) {
    _address3 = value;
    notifyListeners();
  }

  String _postcode = '';
  String get postcode => _postcode;
  set postcode(String value) {
    _postcode = value;
    notifyListeners();
  }

  String _bandar = '';
  String get bandar => _bandar;
  set bandar(String value) {
    _bandar = value;
    notifyListeners();
  }

  Pilihan? _negeri;
  Pilihan? get negeri => _negeri;
  set negeri(Pilihan? value) {
    _negeri = value;
    _daerahList = null;
    idNegeri = negeri!.id!.toString();
    getDaerah(idNegeri);
    validateNegeri();
    notifyListeners();
  }

  String _idNegeri = '';
  String get idNegeri => _idNegeri;
  set idNegeri(String value) {
    _idNegeri = value;
    notifyListeners();
  }

  Pilihan? _daerah;
  Pilihan? get daerah => _daerah;
  set daerah(Pilihan? value) {
    _daerah = value;
    idDaerah = daerah!.id!.toString();
    validateDaerah();
    notifyListeners();
  }

  String _idDaerah = '';
  String get idDaerah => _idDaerah;
  set idDaerah(String value) {
    _idDaerah = value;
    notifyListeners();
  }

  String _addressError = '';
  String get addressError => _addressError;
  bool get addressHasError => !_addressError.isNullOrWhiteSpace;

  String _postcodeError = '';
  String get postcodeError => _postcodeError;
  bool get postcodeHasError => !_postcodeError.isNullOrWhiteSpace;

  String _bandarError = '';
  String get bandarError => _bandarError;
  bool get bandarHasError => !_bandarError.isNullOrWhiteSpace;

  String _negeriError = '';
  String get negeriError => _negeriError;
  bool get negeriHasError => !_negeriError.isNullOrWhiteSpace;

  String _daerahError = '';
  String get daerahError => _daerahError;
  bool get daerahHasError => !_daerahError.isNullOrWhiteSpace;

  validateAddress() {
    try {
      _addressError = '';
      if (address.isNullOrWhiteSpace) {
        _addressError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validatePostcode() {
    try {
      _postcodeError = '';
      if (postcode.isNullOrWhiteSpace) {
        _postcodeError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateBandar() {
    try {
      _bandarError = '';
      if (bandar.isNullOrWhiteSpace) {
        _bandarError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateNegeri() {
    try {
      _negeriError = '';
      if (idNegeri.isNullOrWhiteSpace) {
        _negeriError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateDaerah() {
    try {
      _daerahError = '';
      if (idDaerah.isNullOrWhiteSpace) {
        _daerahError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  Future getProfile() async {
    try {
      _isLoading = true;
      final response = await _profileRepo.getProfile('');

      if (response != null) {
        _profileList = response;

        if (profileList![0].pilihanNegeri != '') {
          await getCurrentNegeri(profileList![0].pilihanNegeri!);
          idNegeri = profileList![0].pilihanNegeri!;
          await getDaerah(idNegeri);
          if (profileList![0].pilihanDaerah != '') {
            await getCurrentDaerah(profileList![0].pilihanDaerah!);
            idDaerah = profileList![0].pilihanDaerah!;
          }
        }
      }
    } catch (e) {
      _profileList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getNegeri() async {
    try {
      _isLoading = true;

      final response = await _negeriRepo.getNegeri();

      if (response != null) {
        _negeriList = response;
      }
    } catch (e) {
      _negeriList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getCurrentNegeri(String currentID) async {
    try {
      final response = await _negeriRepo.getCurrentNegeri(currentID);

      if (response != null) {
        _currentNegeri = response;
      }
    } catch (e) {
      _currentNegeri = null;
    } finally {
      notifyListeners();
    }
  }

  Future getDaerah(String idNegeri) async {
    try {
      final response = await _daerahRepo.getDaerah(idNegeri);

      if (response != null) {
        _daerahList = response;
      }
    } catch (e) {
      _daerahList = null;
    } finally {
      notifyListeners();
    }
  }

  Future getCurrentDaerah(String currentID) async {
    try {
      final response = await _daerahRepo.getCurrentDaerah(currentID);

      if (response != null) {
        _currentDaerah = response;
      }
    } catch (e) {
      _currentDaerah = null;
    } finally {
      notifyListeners();
    }
  }

  Future getOrders() async {
    try {
      _isLoading = true;
      final response = await _ordersRepo.getOrders();

      if (response != null) {
        _order = response;

        if (order![0].negeri != '') {
          await getCurrentNegeri(order![0].negeri!);
          idNegeri = order![0].negeri!;
          await getDaerah(idNegeri);
          if (order![0].daerah != '') {
            await getCurrentDaerah(order![0].daerah!);
            idDaerah = order![0].daerah!;
          }
        }
      }
    } catch (e) {
      _order = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future postUpdateAddress(BuildContext context) async {
    try {
      final response = await _profileRepo.updateAddress(
          address, address2, address3, postcode, bandar, idNegeri, idDaerah);
      if (response != null) {
        _message = response['msg'];
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: Colors.transparent,
              child: AppAlertDialog(
                alertDialogType: AlertDialogType.success,
                title: "Success",
                subtitle: '',
                description: message,
                actionButtons: [
                  ActionButton(
                    label: 'Back',
                    color: secondaryColor,
                    onTap: () {
                      AppRoute.pop(context);
                      AppRoute.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    } catch (error) {
      if (error is APIException) {
        _message = error.errorMessage();
        showDialog(
          context: context,
          builder: (_) {
            return AppAlertDialog(
              alertDialogType: AlertDialogType.warning,
              title: "Fail",
              subtitle: '',
              description: message,
              actionButtons: [
                ActionButton(
                  label: 'Back',
                  color: secondaryColor,
                  onTap: () {
                    AppRoute.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    } finally {
      notifyListeners();
    }
  }

  Future updateOrderAddress(BuildContext context) async {
    try {
      final response = await _profileRepo.updateOrderAddress(
          address, address2, address3, postcode, bandar, idNegeri, idDaerah);
      if (response != null) {
        _message = response['msg'];
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: Colors.transparent,
              child: AppAlertDialog(
                alertDialogType: AlertDialogType.success,
                title: "Success",
                subtitle: '',
                description: message,
                actionButtons: [
                  ActionButton(
                    label: 'Back',
                    color: secondaryColor,
                    onTap: () {
                      AppRoute.pop(context);
                      AppRoute.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    } catch (error) {
      if (error is APIException) {
        _message = error.errorMessage();
        showDialog(
          context: context,
          builder: (_) {
            return AppAlertDialog(
              alertDialogType: AlertDialogType.warning,
              title: "Fail",
              subtitle: '',
              description: message,
              actionButtons: [
                ActionButton(
                  label: 'Back',
                  color: secondaryColor,
                  onTap: () {
                    AppRoute.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    } finally {
      notifyListeners();
    }
  }

  validateAll() async {
    validateAddress();
    validatePostcode();
    validateBandar();
    validateNegeri();
    validateDaerah();
  }

  Future getEdit() async {
    await getOrders();
    await getNegeri();
  }

  Future getAll() async {
    try {
      await getProfile();
      getNegeri();
    } finally {
      notifyListeners();
    }
  }
}
