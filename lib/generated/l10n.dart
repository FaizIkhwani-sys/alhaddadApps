// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hi you guys, I am Mohamad Faiz Ikhwani Hakimi.`
  String get helloWorld {
    return Intl.message(
      'Hi you guys, I am Mohamad Faiz Ikhwani Hakimi.',
      name: 'helloWorld',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get selamatKembali {
    return Intl.message(
      'Welcome',
      name: 'selamatKembali',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get selamatDatang {
    return Intl.message(
      'Welcome',
      name: 'selamatDatang',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get logMasuk {
    return Intl.message(
      'LOGIN',
      name: 'logMasuk',
      desc: '',
      args: [],
    );
  }

  /// `Identification Card No.`
  String get hint_kad_pengenalan {
    return Intl.message(
      'Identification Card No.',
      name: 'hint_kad_pengenalan',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get hint_kata_laluan {
    return Intl.message(
      'Password',
      name: 'hint_kata_laluan',
      desc: '',
      args: [],
    );
  }

  /// ` Forget Password?`
  String get lupa_kata_laluan {
    return Intl.message(
      ' Forget Password?',
      name: 'lupa_kata_laluan',
      desc: '',
      args: [],
    );
  }

  /// `Not Registered?`
  String get belum_daftar {
    return Intl.message(
      'Not Registered?',
      name: 'belum_daftar',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get daftar {
    return Intl.message(
      'Sign Up',
      name: 'daftar',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation`
  String get tahniah {
    return Intl.message(
      'Congratulation',
      name: 'tahniah',
      desc: '',
      args: [],
    );
  }

  /// `Verification code will be send to your e-mail.`
  String get lupa_kata_laluan_des {
    return Intl.message(
      'Verification code will be send to your e-mail.',
      name: 'lupa_kata_laluan_des',
      desc: '',
      args: [],
    );
  }

  /// `submit`
  String get hantar {
    return Intl.message(
      'submit',
      name: 'hantar',
      desc: '',
      args: [],
    );
  }

  /// `Successful, please check your email.`
  String get berjaya_tukar_password {
    return Intl.message(
      'Successful, please check your email.',
      name: 'berjaya_tukar_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get pendaftaran {
    return Intl.message(
      'Sign Up',
      name: 'pendaftaran',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get nama_penuh {
    return Intl.message(
      'Full Name',
      name: 'nama_penuh',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get no_tel {
    return Intl.message(
      'Phone Number',
      name: 'no_tel',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail`
  String get email {
    return Intl.message(
      'E-Mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `E-mail Address`
  String get alamat_email {
    return Intl.message(
      'E-mail Address',
      name: 'alamat_email',
      desc: '',
      args: [],
    );
  }

  /// `Please Choose`
  String get sila_pilih {
    return Intl.message(
      'Please Choose',
      name: 'sila_pilih',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get ya {
    return Intl.message(
      'Yes',
      name: 'ya',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get tidak {
    return Intl.message(
      'No',
      name: 'tidak',
      desc: '',
      args: [],
    );
  }

  /// `Course`
  String get kursus {
    return Intl.message(
      'Course',
      name: 'kursus',
      desc: '',
      args: [],
    );
  }

  /// `I agree to accept`
  String get agreement {
    return Intl.message(
      'I agree to accept',
      name: 'agreement',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terma_syarat {
    return Intl.message(
      'Terms & Conditions',
      name: 'terma_syarat',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get add_to_cart {
    return Intl.message(
      'Add To Cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `People Also Ordered`
  String get people_order {
    return Intl.message(
      'People Also Ordered',
      name: 'people_order',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get transaction {
    return Intl.message(
      'Transaction',
      name: 'transaction',
      desc: '',
      args: [],
    );
  }

  /// `Scan & Pay`
  String get scan_Pay {
    return Intl.message(
      'Scan & Pay',
      name: 'scan_Pay',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messages {
    return Intl.message(
      'Messages',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get my_Account {
    return Intl.message(
      'My Account',
      name: 'my_Account',
      desc: '',
      args: [],
    );
  }

  /// `No Notification.`
  String get no_Notification {
    return Intl.message(
      'No Notification.',
      name: 'no_Notification',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get lihat_semua {
    return Intl.message(
      'See All',
      name: 'lihat_semua',
      desc: '',
      args: [],
    );
  }

  /// `User ID`
  String get id_pengguna {
    return Intl.message(
      'User ID',
      name: 'id_pengguna',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ms'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
