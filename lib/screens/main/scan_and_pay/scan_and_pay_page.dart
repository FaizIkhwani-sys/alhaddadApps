import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScanAndPayPage extends StatelessWidget {
  const ScanAndPayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ScanAndPayState(),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _BarCodeScanner(),
    );
  }
}

class _BarCodeScanner extends StatefulWidget {
  const _BarCodeScanner({Key? key}) : super(key: key);

  @override
  State<_BarCodeScanner> createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<_BarCodeScanner> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      final state = context.read<ScanAndPayState>();

      showDialog(
        context: context,
        builder: (_) {
          return AppAlertDialog(
            alertDialogType: AlertDialogType.info,
            title: "Start Scanning...",
            subtitle: '',
            description: "",
            actionButtons: [
              ActionButton(
                label: 'OK',
                color: secondaryColor,
                onTap: () {
                  state.scanBarcodeNormal(context);
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScanAndPayState>(
      builder: (_, state, __) {
        return Container(
          // child: (state.scanBarCode != 'Unknown')
          //     ? Center(child: Text(state.scanBarCode))
          //     : Container(),
        );
      },
    );
  }
}
