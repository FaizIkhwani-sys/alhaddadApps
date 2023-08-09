import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:apps_al_haddad/al_haddad.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitiliaze.initiliazeLibrary();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
