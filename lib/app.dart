import 'dart:io';
import 'package:apps_al_haddad/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_assets_server/local_assets_server.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
AndroidNotificationChannel? channel;

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final FirebaseMessaging _messaging;

  bool isListening = false;
  String? address;
  int? port;

  void initState() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
      );
    });
    super.initState();
    registerNotification();
    _initServer();
    getVersion();
  }

  getVersion() async {
    String appName;
    String packageName;
    String? version;
    String buildNumber;

    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (Platform.isAndroid) {
      await PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
        setState(() {
          appName = packageInfo.appName;
          packageName = packageInfo.packageName;
          version = packageInfo.version;
          buildNumber = packageInfo.buildNumber;

          _prefs.setString('androidVersion', version!);

          print('android version ${_prefs.getString('androidVersion')}');
        });
      });
    } else if (Platform.isIOS) {
      await PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
        setState(() {
          appName = packageInfo.appName;
          packageName = packageInfo.packageName;
          version = packageInfo.version;
          buildNumber = packageInfo.buildNumber;

          _prefs.setString('iOSVersion', version!);

          print('iOS version ${_prefs.getString('iOSVersion')}');
        });
      });
    }
  }

  _initServer() async {
    final server = new LocalAssetsServer(
      address: InternetAddress.loopbackIPv4,
      assetsBasePath: 'assets',
      port: 8080,
      logger: DebugLogger(),
    );

    final address = await server.serve();

    setState(() {
      this.address = address.address;
      port = server.boundPort!;
      isListening = true;
    });
    print('LOCAL URL: http://' + address.address + ':$port');
  }

  void registerNotification() async {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();

    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // FirebaseMessaging.onMessage.listen((RemoteMessage) { });
    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      // For handling the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? androidNotification =
            message.notification?.android;

        if (notification != null && androidNotification != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                "${channel?.id}",
                "${channel?.name}",
                icon: '@mipmap/ic_launcher',
              ),
            ),
          );

          Fluttertoast.showToast(
              msg: "${notification.title}\n${notification.body}",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 30,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 12.0);
        }
        print(notification?.title);
        // Parse the message received
        PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AdminProvider()),
        ChangeNotifierProvider(create: (_) => HomePageState()),
        ChangeNotifierProvider(create: (_) => SettingState()),
        ChangeNotifierProvider(create: (_) => LogInPageState()),
        ChangeNotifierProvider(create: (_) => RetailerMembershipUtamaListState()),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.all,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: SplashPage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

class PushNotification {
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}
