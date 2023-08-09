import 'package:apps_al_haddad/widgets/input/app_upload_field.dart';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

late FocusNode _titleNode;
late FocusNode _descNode;

class SendNotificationPage extends StatelessWidget {
  const SendNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NotificationState(),
      child: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    final state = context.read<NotificationState>();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                _Title(),
                _Description(),
                _ImageUpload(),
                _SendToRadio(),
                _SubmitButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Title extends StatefulWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  State<_Title> createState() => _TitleState();
}

class _TitleState extends State<_Title> {
  @override
  void initState() {
    super.initState();
    _titleNode = FocusNode();
  }

  @override
  void dispose() {
    _titleNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return Column(
          children: [
            AppTextField(
              label: 'Title',
              focusNode: _titleNode,
              hint: "Title",
              keyboardType: TextInputType.text,
              errorText: state.titleHasError ? state.titleError : null,
              onChange: (v) => state.title = v,
              onSubmitted: (v) => state.title = v,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}

class _Description extends StatefulWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  State<_Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<_Description> {
  @override
  void initState() {
    super.initState();
    _descNode = FocusNode();
  }

  @override
  void dispose() {
    _descNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return Column(
          children: [
            AppTextField(
              label: 'Description',
              focusNode: _descNode,
              hint: "Description",
              keyboardType: TextInputType.text,
              errorText: state.descHasError ? state.descError : null,
              onChange: (v) => state.desc = v,
              onSubmitted: (v) => state.desc = v,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}

class _ImageUpload extends StatelessWidget {
  const _ImageUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return Column(
          children: [
            AppUploadField(
              label: 'Upload Image',
              title: state.imageFile == null
                  ? 'Upload Image'
                  : 'Image Upload Successfully',
              errorText: state.imageFileError,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                          ),
                        ),
                        padding: EdgeInsets.all(24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            buttonUploadPhoto('Take Photo', Icons.camera_alt,
                                Colors.blueAccent, () {
                              state.imageFromCameraGallery(
                                ImageSource.camera,
                                context,
                              );
                            }),
                            buttonUploadPhoto(
                                'Gallery', Icons.photo_library, Colors.teal,
                                () {
                              state.imageFromCameraGallery(
                                ImageSource.gallery,
                                context,
                              );
                            }),
                          ],
                        ),
                      );
                    });
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}

class _SendToRadio extends StatelessWidget {
  const _SendToRadio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationState>(
      builder: (_, state, __) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: AppRadioButtonListTile(
                label: 'Send To : ',
                onChange: (v) => state.pilihanJenisNotifikasi = v,
                groupValue: state.pilihanJenisNotifikasi,
                radioList: [
                  RadioListItem1('449', 'Staffs'),
                  RadioListItem1('453', 'Retailer'),
                  RadioListItem1('454', 'Membership'),
                  RadioListItem1('455', 'All'),
                ],
                errorText: state.pilihanJenisNotifikasiError,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSubmitButton(
        onTap: () {
          _onSubmitted(context);
        },
        title: 'SUBMIT');
  }

  Future<void> _onSubmitted(BuildContext context) async {
    final state = context.read<NotificationState>();

    state.validateAll();

    if (state.titleHasError) {
      _titleNode.requestFocus();
      return;
    }
    if (state.descHasError) {
      _descNode.requestFocus();
      return;
    }

    state.postSendNotification(context);
  }
}
