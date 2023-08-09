import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:intl/intl.dart';

class ProfileSettingState extends ChangeNotifier
    with
        PasswordMixin,
        EmailMixin,
        NameMixin,
        TextControllerMixin,
        PhoneMixin,
        UserNameMixin {
  final _genderRepo = GenderRepository();
  final _profileRepo = ProfileRepository();
  final _usersRepo = UsersRepository();
  final _bankRepo = BankRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Pilihan>? _genderList;
  List<Pilihan>? get genderList => _genderList;

  List<Pilihan>? _currentBank;
  List<Pilihan>? get currentBank => _currentBank;

  List<Profile>? _profileList;
  List<Profile>? get profileList => _profileList;

  List<Users>? _usersList;
  List<Users>? get usersList => _usersList;

  List<Bank>? _bankList;
  List<Bank>? get bankList => _bankList;

  String _bankAccount = '';
  String get bankAccount => _bankAccount;
  set bankAccount(String value) {
    _bankAccount = value;
    notifyListeners();
  }

  Bank _bank = Bank();
  Bank get bank => _bank;
  set bank(Bank value) {
    _bank = value;
    bankId = bank.id!.toString();
    validateBank();
    notifyListeners();
  }

  String _bankId = '';
  String get bankId => _bankId;
  set bankId(String value) {
    _bankId = value;
    notifyListeners();
  }

  Pilihan? _gender;
  Pilihan? get gender => _gender;
  set gender(Pilihan? value) {
    _gender = value;
    notifyListeners();
  }

  String _birthDate = '';
  String get birthDate => _birthDate;
  set birthDate(String value) {
    _birthDate = value;
    notifyListeners();
  }

  String _bankAccountError = '';
  String get bankAccountError => _bankAccountError;
  bool get bankAccountHasError => !_bankAccountError.isNullOrWhiteSpace;

  String _birthDateError = '';
  String get birthDateError => _birthDateError;
  bool get birthDateHasError => !_birthDateError.isNullOrWhiteSpace;

  String _genderError = '';
  String get genderError => _genderError;
  bool get genderHasError => !_genderError.isNullOrWhiteSpace;

  String _bankError = '';
  String get bankError => _bankError;
  bool get bankHasError => !_bankError.isNullOrWhiteSpace;

  validateBirthDate() {
    try {
      _birthDateError = '';
      if (birthDate == null) {
        _birthDateError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateGender() {
    try {
      _genderError = '';
      if (gender == null) {
        _genderError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateBankAccount() {
    try {
      _bankAccountError = '';
      if (bankAccount.isNullOrWhiteSpace) {
        _bankAccountError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  validateBank() {
    try {
      _bankError = '';
      if (bankId.isNullOrWhiteSpace) {
        _bankError = '*required';
        return;
      }
    } finally {
      notifyListeners();
    }
  }

  pickDOB(BuildContext context) async {
    DateTime? date = DateTime(1900);
    FocusScope.of(context).requestFocus(FocusNode());

    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
              primary: Color(0xFFDCD0FF),
              onPrimary: darkColor,
            )),
            child: child!,
          );
        });
    String dateFormat = DateFormat("yyyy-MM-dd").format(date!);

    _birthDate = dateFormat.toString();
  }

  Future getGender() async {
    try {
      _isLoading = true;
      final response = await _genderRepo.getGender();

      if (response != null) {
        _genderList = response;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getBank() async {
    try {
      _isLoading = true;
      final response = await _bankRepo.getBank();

      if (response != null) {
        _bankList = response;
      }
    } catch (e) {
      _bankList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getProfile() async {
    try {
      _isLoading = true;
      final response = await _profileRepo.getProfile('');

      if (response != null) {
        _profileList = response;
      }
    } catch (e) {
      _profileList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getProfileBank() async {
    try {
      _isLoading = true;
      final response = await _profileRepo.getProfile('');

      if (response != null) {
        _profileList = response;

        if (profileList![0].namaBank != '') {
          await getCurrentBank(profileList![0].namaBank!);
          bankId = profileList![0].namaBank!;
        }
      }
    } catch (e) {
      _profileList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getUsers() async {
    try {
      _isLoading = true;
      final response = await _usersRepo.getUsers('');

      if (response != null) {
        _usersList = response;
      }
    } catch (e) {
      _usersList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getCurrentBank(String currentId) async {
    try {
      _isLoading = true;
      final response = await _bankRepo.getCurrentBank(currentId);

      if (response != null) {
        _currentBank = response;
      }
    } catch (e) {
      _currentBank = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future updateProfile(BuildContext context) async {
    try {
      print('name $name');
      final responseProfile =
          await _profileRepo.updateProfile(name, birthDate, phone);

      final responseUsers = await _profileRepo.updateUsers(userName!, email);

      if (responseProfile != null && responseUsers != null) {
        showDialog(
          context: context,
          builder: (_) {
            return AppAlertDialog(
              alertDialogType: AlertDialogType.success,
              title: "Announcement",
              subtitle: 'Information successfully updated',
              description: "",
              actionButtons: [
                ActionButton(
                  label: 'OK',
                  color: secondaryColor,
                  onTap: () {
                    AppRoute.pop(context);
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

  Future updateBankDetails(BuildContext context) async {
    try {
      _isLoading = true;

      final response =
          await _profileRepo.updateBankDetails(bankId, bankAccount);

      if (response != null) {
        showDialog(
          context: context,
          builder: (_) {
            return AppAlertDialog(
              alertDialogType: AlertDialogType.success,
              title: "Announcement",
              subtitle: 'Information successfully updated',
              description: "",
              actionButtons: [
                ActionButton(
                  label: 'OK',
                  color: secondaryColor,
                  onTap: () {
                    AppRoute.pop(context);
                    AppRoute.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  validateAll() {
    validateName();
    validateUserName();
    validateBirthDate();
    validatePhone();
    validateEmail();
  }

  Future getAll() async {
    await getGender();
    await getProfile();
    await getUsers();
  }

  Future getAllBankSettingPage() async {
    await getProfileBank();
    await getBank();
  }

  validateBankAll() {
    validateBank();
    validateBankAccount();
  }
}
