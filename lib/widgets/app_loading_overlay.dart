import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';


class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.heightScreen(context),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

