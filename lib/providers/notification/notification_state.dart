import 'dart:convert';
import 'dart:io';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NotificationState extends ChangeNotifier {
  final _notiRepo = NotificationRepository();
  final _picker = ImagePicker();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _message = '';
  String get message => _message;

  List<Notifications>? _notificationList;
  List<Notifications>? get notificationList => _notificationList;

  List<Notifications>? _notification;
  List<Notifications>? get notification => _notification;

  File? _imageFile;
  File? get imageFile => _imageFile;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  String _base64 = '';
  String get base64 => _base64;
  set base64(String value) {
    _base64 = value;
    notifyListeners();
  }

  String? _title;
  String? get title => _title;
  set title(String? value) {
    _title = value;
    notifyListeners();
  }

  String? _desc;
  String? get desc => _desc;
  set desc(String? value) {
    _desc = value;
    notifyListeners();
  }

  String? _pilihanJenisNotifikasiError;
  String? get pilihanJenisNotifikasiError => _pilihanJenisNotifikasiError;
  bool get pilihanJenisNotifikasiHasError =>
      !_pilihanJenisNotifikasiError.isNullOrWhiteSpace;

  String? _pilihanJenisNotifikasi;
  String? get pilihanJenisNotifikasi => _pilihanJenisNotifikasi;
  set pilihanJenisNotifikasi(String? value) {
    _pilihanJenisNotifikasi = value;
    print(pilihanJenisNotifikasi);
    notifyListeners();
  }

  String _titleError = '';
  String get titleError => _titleError;
  bool get titleHasError => !_titleError.isNullOrWhiteSpace;

  String _descError = '';
  String get descError => _descError;
  bool get descHasError => !_descError.isNullOrWhiteSpace;

  String? _imageFileError = '';
  String? get imageFileError => _imageFileError;

  validateTitle() {
    try {
      _titleError = '';
      if (title.isNullOrWhiteSpace) {
        _titleError = '*required';
      }
    } finally {
      notifyListeners();
    }
  }

  validateDesc() {
    try {
      _descError = '';
      if (desc.isNullOrWhiteSpace) {
        _descError = '*required';
      }
    } finally {
      notifyListeners();
    }
  }

  validatePilihanJenisNotifikasi() {
    try {
      _pilihanJenisNotifikasiError = '';
      if (pilihanJenisNotifikasiError.isNullOrWhiteSpace) {
        _pilihanJenisNotifikasiError = '*required';
      }
    } finally {
      notifyListeners();
    }
  }

  Future getNotification() async {
    try {
      _isLoading = true;

      final response = await _notiRepo.getNotification();

      if (response != null) {
        _notificationList = response;
      }
    } catch (e) {
      _notificationList = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getNotificationbyId(String idNotification) async {
    try {
      _isLoading = true;

      final response = await _notiRepo.getNotificationbyId(idNotification);

      if (response != null) {
        _notification = response;
      }
    } catch (e) {
      _notification = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future deleteNotification(String idNotification) async {
    try {
      _isLoading = true;
      final response = _notiRepo.deleteNotification(idNotification);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  deleteOrderPOS(BuildContext context, String orderId) async {
    try {
      _isLoading = true;
      final response = await _notiRepo.deleteOrderPOS(orderId);
      if (response != null) {
        _message = response['msg'];
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: Colors.transparent,
              child: AppAlertDialog(
                alertDialogType: AlertDialogType.success,
                title: "Congratulation",
                subtitle: '',
                description: _message,
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
    } catch (e) {
      print('deleteOrderPOS $e');
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }

  imageFromCameraGallery(ImageSource imageSource, BuildContext context) async {
    try {
      final pickedFile = await _picker.pickImage(source: imageSource);
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        _imageUrl = _imageFile?.path;
        var imageBytes = _imageFile!.readAsBytesSync();
        _base64 = base64Encode(imageBytes);
        AppRoute.pop(context);
      }
    } finally {
      notifyListeners();
    }
  }

  postSendNotification(BuildContext context) async {
    try {
      _isLoading = true;

      final response = await _notiRepo.postNotification(
          title!, desc!, base64, pilihanJenisNotifikasi!);

      if (response != null) {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: Colors.transparent,
              child: AppAlertDialog(
                alertDialogType: AlertDialogType.success,
                title: "Congratulation",
                subtitle: '',
                description: "Notification sent successfully",
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
      print(base64);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future updateReadAt(String idNotiSend, String readAt) async {
    try {
      _isLoading = true;
      final response = await _notiRepo.updateReadAt(idNotiSend, readAt);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  validateAll() {
    validateTitle();
    validateDesc();
    validatePilihanJenisNotifikasi();
  }
}
