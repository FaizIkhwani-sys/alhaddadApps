import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scan/scan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class ProfileScannerPage extends StatelessWidget {
  const ProfileScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileState(),
      child: AppSecondaryBar(
        title: 'Profile Scanner',
        body: SingleChildScrollView(child: _Body()),
        backgroundColor: backgroundColor,
        bottomNavigationBar: _Button(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Scan(),
      ],
    );
  }
}

class _Scan extends StatelessWidget {
  final MobileScannerController cameraController = MobileScannerController();

  _Scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileState>(
      builder: (_, state, __) {
        return Column(
          children: [
            SizedBox(
              height: AppSize.heightScreen(context) * 0.6,
              width: AppSize.widthScreen(context),
              child: MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: (barcode, args) async {
                  if (barcode.rawValue == null) {
                    print('Failed');
                  } else {
                    print(barcode.rawValue);
                    final String code = barcode.rawValue!;

                    await state.getProfile(code);
                    await state.getUsers();

                    if (state.profileList != null && state.usersList != null) {
                      AppRoute.pop(context);

                      await showDialog(
                          useSafeArea: true,
                          context: context,
                          builder: (_) => _Dialog(
                                profileId: code,
                              ));
                    }

                    // state.updateRefId(context, code);
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

class _Dialog extends StatelessWidget {
  final String? profileId;

  const _Dialog({this.profileId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ProfileState(),
        child: _DialogBody(
          profileId: profileId,
        ));
  }
}

class _DialogBody extends StatefulWidget {
  final String? profileId;

  const _DialogBody({this.profileId, Key? key}) : super(key: key);

  @override
  State<_DialogBody> createState() => _DialogBodyState();
}

class _DialogBodyState extends State<_DialogBody> {
  @override
  void initState() {
    super.initState();

    final state = context.read<ProfileState>();

    state.getAll(widget.profileId!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    height: AppSize.heightScreen(context) * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: AppSize.mainSpaceBetween,
                        children: [
                          Column(
                            children: [
                              Center(
                                child: CircleAvatar(
                                  backgroundColor: grayColor,
                                  radius: 100,
                                  backgroundImage: NetworkImage(
                                      imageURl + state.profileList![0].image!),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: AppSize.crossStart,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextManrope(
                                    text:
                                        "NAME: ${state.profileList![0].namaPenuh!}",
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextManrope(
                                    text:
                                        "I/C NUMBER: ${state.profileList![0].noPengenalan!}",
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextManrope(
                                    text:
                                        "BIRTH OF DATE: ${state.profileList![0].tarikhLahir!}",
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AppSubmitButton(
                              onTap: () {
                                AppRoute.push(
                                    context,
                                    RegisterDownLineWebViewPage(
                                      url:
                                          "https://alhaddad-admin.myrichappsproject.tk/register?noHeader=1&app=1&ref=${state.usersList![0].username}",
                                    ));
                              },
                              title: 'Register Membership')
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}

class _Button extends StatefulWidget {
  const _Button({Key? key}) : super(key: key);

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  String qrcode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileState>(
      builder: (_, state, __) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: AppSubmitButton(
            onTap: () async {
              await state.imageFromCameraGallery(ImageSource.gallery, context);

              final imageFile = state.imageFile;
              if (imageFile != null) {
                String? str = await Scan.parse(imageFile.path);
                if (str != null) {
                  setState(() {
                    qrcode = str;
                  });
                  showDialog(
                    context: context,
                    builder: (_) {
                      return Material(
                        color: Colors.transparent,
                        child: AppAlertDialog(
                          alertDialogType: AlertDialogType.success,
                          title: qrcode,
                          subtitle: '',
                          description: "",
                          actionButtons: [
                            ActionButton(
                              label: 'Kembali',
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
              }
            },
            title: 'GALLERY',
          ),
        );
      },
    );
  }
}
