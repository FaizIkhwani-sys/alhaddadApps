import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceScanPage extends StatelessWidget {
  const AttendanceScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => QRScanState(),
      child: AppSecondaryBar(
        title: 'Kehadiran',
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _Body(),
        )),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _QRScan();
  }
}

class _QRScan extends StatelessWidget {
  final MobileScannerController cameraController = MobileScannerController();

  _QRScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QRScanState>(
      builder: (_, state, __) {
        return Column(
          children: [
            Container(
              height: AppSize.heightScreen(context) * 0.6,
              width: AppSize.widthScreen(context),
              child: MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: (barcode, args) async {
                  if (barcode.rawValue == null) {
                    print('Failed');
                  } else {
                    final String code = barcode.rawValue!;

                    SharedPreferences _prefs =
                        await SharedPreferences.getInstance();

                    String? lat = _prefs.getString('lat');
                    String? long = _prefs.getString('long');

                    AppRoute.pushReplacement(
                        context,
                        AttendanceWebView(
                          baseURL: code,
                          lat: lat!,
                          long: long!,
                        ));

                    //
                    //
                    //
                    //
                  }
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: AppSize.mainSpaceEvenly,
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () => cameraController.toggleTorch(),
                  icon: ValueListenableBuilder(
                    valueListenable: cameraController.torchState,
                    builder: (context, state, child) {
                      switch (state as TorchState) {
                        case TorchState.off:
                          return const Icon(Icons.flash_off,
                              color: Colors.grey);
                        case TorchState.on:
                          return const Icon(Icons.flash_on,
                              color: Colors.yellow);
                      }
                    },
                  ),
                ),
                IconButton(
                  color: Colors.black,
                  icon: ValueListenableBuilder(
                    valueListenable: cameraController.cameraFacingState,
                    builder: (context, state, child) {
                      switch (state as CameraFacing) {
                        case CameraFacing.front:
                          return const Icon(Icons.camera_front);
                        case CameraFacing.back:
                          return const Icon(Icons.camera_rear);
                      }
                    },
                  ),
                  iconSize: 32.0,
                  onPressed: () => cameraController.switchCamera(),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        );
      },
    );
  }
}
