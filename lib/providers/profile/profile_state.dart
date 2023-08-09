import 'dart:io';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:image_picker/image_picker.dart';

class ProfileState extends ChangeNotifier {
  final picker = ImagePicker();
  final _profileRepo = ProfileRepository();
  final _usersRepo = UsersRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  File? _imageFile;
  File? get imageFile => _imageFile;

  String? _imageFileError = '';
  String? get imageFileError => _imageFileError;

  List<Profile>? _profileList;
  List<Profile>? get profileList => _profileList;

  List<Users>? _usersList;
  List<Users>? get usersList => _usersList;

  String? _idJenisStokis;
  String? get idJenisStokis => _idJenisStokis;
  set idJenisStokis(String? value) {
    _idJenisStokis = value;
    notifyListeners();
  }

  Future getProfile(String profileId) async {
    try {
      _isLoading = true;
      final response = await _profileRepo.getProfile(profileId);

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

  Future getUsers() async {
    try {
      _isLoading = true;
      final response = await _usersRepo.getUsers(profileList![0].usersId!);

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

  imageFromCameraGallery(ImageSource imageSource, BuildContext context) async {
    try {
      final pickedFile =
          await picker.getImage(source: imageSource, imageQuality: 30);
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        _imageUrl = _imageFile?.path;
      }
    } finally {
      notifyListeners();
    }
  }

  getAll(String profileId) async {
    await getProfile(profileId);
    await getUsers();
  }
}
