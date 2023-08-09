import 'package:apps_al_haddad/al_haddad.dart';

class AppInitiliaze {
  static Future<void> initiliazeLibrary() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //Get Storage Initialization
    await GetStorage.init();
  }
}
