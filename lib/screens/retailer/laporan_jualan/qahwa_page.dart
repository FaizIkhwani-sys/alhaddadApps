import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class QahwaPage extends StatelessWidget {
  const QahwaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LaporanJualanState(),
      child: AppSecondaryBar(
        title: 'Qahwa',
        body: SingleChildScrollView(child: _Body()),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
