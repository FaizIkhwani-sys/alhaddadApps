import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';

String? fbToken = '';
String? bearerToken = '';

late FocusNode _kitchenNode;
late FocusNode _counterNode;
late FocusNode _kitchenPortNode;
late FocusNode _counterPortNode;
late FocusNode _ipOfflineServerNode;

class TryPage extends StatefulWidget {
  const TryPage({Key? key}) : super(key: key);

  @override
  State<TryPage> createState() => _TryPageState();
}

class _TryPageState extends State<TryPage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      print('k ip ${_prefs.getString('kitchenIP')}');
      print('c ip ${_prefs.getString('counterIP')}');
      print('k p ${_prefs.getString('kitchenPort')}');
      print('c p ${_prefs.getString('counterPort')}');
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TryState(),
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

    final state = context.read<TryState>();
    state.function();


    fbToken = state.firebaseToken!;
    // bearerToken = state.bearerToken!;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TryState>(
      builder: (_, state, __) {
        return AppWebViewPage(
          // bearerToken: bearerToken,
          appBarTitle: 'P.O.S System',
          //url: "https://alhaddad-pos.myrichappsproject.tk?firebase_token=$fbToken",
          url: "http://127.0.0.1:8080/pos/index.html?firebase_token=$fbToken",
          hasBackButton: true,
          hasAction: true,
          action: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    // abang boleh on nak pakai yang function yang mana satu

                    // 1. data yang dia nak pass tu saya tak sure nak letak apa
                    // state.testReceipt(printer);

                    // 2. yang ni function kedua yang abang nak saya letak tadi
                    state.counterPrinter2();
                    //

                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return _BodySlider();
                        });

                    // AppRoute.push(context, PrintPage());
                  },
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () async{
                    // abang boleh on nak pakai yang function yang mana satu

                    // 1. data yang dia nak pass tu saya tak sure nak letak apa
                    // state.testReceipt(printer);

                    // 2. yang ni function kedua yang abang nak saya letak tadi

                    state.getReceiptDetails();
                    // state.printer2();
                    //

                    // AppRoute.push(context, PrintPage());
                  },
                  child: Icon(
                    Icons.print,
                    color: Colors.white,
                  )),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 20, 8, 0),
            //   child: InkWell(
            //     onTap: () {
            //       // abang boleh on nak pakai yang function yang mana satu
            //
            //       // 1. data yang dia nak pass tu saya tak sure nak letak apa
            //       // state.testReceipt(printer);
            //
            //       // 2. yang ni function kedua yang abang nak saya letak tadi
            //       state.printer2();
            //       //
            //
            //       // AppRoute.push(context, PrintPage());
            //     },
            //     child: TextManrope(
            //       text: 'TEXT',
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}

class _BodySlider extends StatelessWidget {
  const _BodySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TryState(),
      child: _SlidingPanel(),
    );
  }
}

class _SlidingPanel extends StatefulWidget {
  const _SlidingPanel({Key? key}) : super(key: key);

  @override
  State<_SlidingPanel> createState() => _SlidingPanelState();
}

class _SlidingPanelState extends State<_SlidingPanel> {
  @override
  void initState() {
    super.initState();

    final state = context.read<TryState>();

    // state.getProfile();

    _kitchenNode = FocusNode();
    _counterNode = FocusNode();
    _counterPortNode = FocusNode();
    _kitchenPortNode = FocusNode();
    _ipOfflineServerNode = FocusNode();
  }

  @override
  void dispose() {
    _kitchenNode.dispose();
    _counterNode.dispose();
    _kitchenPortNode.dispose();
    _counterPortNode.dispose();
    _ipOfflineServerNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TryState>(
      builder: (_, state, __) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: AppSize.heightScreen(context),
              child: Column(
                children: [
                  _KitchenIPForm(),
                  _KitchenPortForm(),
                  _CounterIPForm(),
                  _CounterPortForm(),
                  _IPOfflineServerForm(),
                  AppSubmitButton(
                      onTap: () async {
                        SharedPreferences _prefs =
                            await SharedPreferences.getInstance();

                        state.validateAll();

                        if (state.kitchenIPHasError) {
                          _kitchenNode.requestFocus();
                          return;
                        }
                        if (state.kitchenPortHasError) {
                          _kitchenPortNode.requestFocus();
                          return;
                        }
                        if (state.counterIPHasError) {
                          _counterNode.requestFocus();
                          return;
                        }
                        if (state.counterPortHasError) {
                          _counterPortNode.requestFocus();
                          return;
                        }

                        _prefs.setString("kitchenIP", state.kitchenIP!);
                        _prefs.setString("counterIP", state.counterIP!);
                        _prefs.setString("kitchenPort", state.kitchenPort!);
                        _prefs.setString("counterPort", state.counterPort!);
                        _prefs.setString("IPServerOffline", state.IPServerOffline!);

                        showDialog(
                          context: context,
                          builder: (_) {
                            return Material(
                              color: Colors.transparent,
                              child: AppAlertDialog(
                                alertDialogType: AlertDialogType.success,
                                title: "SAVED",
                                subtitle: '',
                                description: "Information saved",
                                actionButtons: [
                                  ActionButton(
                                    label: 'Back',
                                    color: secondaryColor,
                                    onTap: () {
                                      state.printer();
                                      AppRoute.pop(context);
                                      AppRoute.pop(context);
                                      print("${_prefs.getString("kitchenIP")}");
                                      print("${_prefs.getString("counterIP")}");
                                      print("${_prefs.getString("kitchenPort")}");
                                      print("${_prefs.getString("counterPort")}");
                                      print("${_prefs.getString("IPServerOffline")}");
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      title: 'SAVE')
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _KitchenIPForm extends StatefulWidget {
  const _KitchenIPForm({Key? key}) : super(key: key);

  @override
  State<_KitchenIPForm> createState() => _KitchenIPFormState();
}

class _KitchenIPFormState extends State<_KitchenIPForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<TryState>();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _controller.text = _prefs.getString('kitchenIP')!;
      state.kitchenIP = _prefs.getString('kitchenIP')!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TryState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.kitchenIP!;
        }
        return Container(
            child: AppTextField(
          focusNode: _kitchenNode,
          controller: _controller,
          label: 'Kitchen IP Address',
          hint: '192.168.0.49',
          keyboardType: TextInputType.text,
          errorText: state.kitchenIPHasError ? state.kitchenIPError : null,
          onChange: (v) => state.kitchenIP = v,
          onSubmitted: (v) => state.kitchenIP = v,
        ));
      },
    );
  }
}

class _CounterIPForm extends StatefulWidget {
  const _CounterIPForm({Key? key}) : super(key: key);

  @override
  State<_CounterIPForm> createState() => _CounterIPFormState();
}

class _CounterIPFormState extends State<_CounterIPForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<TryState>();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _controller.text = _prefs.getString('counterIP')!;
      state.counterIP = _prefs.getString('counterIP')!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TryState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.counterIP!;
        }
        return Container(
            child: AppTextField(
          focusNode: _counterNode,
          controller: _controller,
          label: 'Counter IP Address',
          hint: '192.168.0.49',
          keyboardType: TextInputType.text,
          errorText: state.counterIPHasError ? state.counterIPError : null,
          onChange: (v) => state.counterIP = v,
          onSubmitted: (v) => state.counterIP = v,
        ));
      },
    );
  }
}

class _KitchenPortForm extends StatefulWidget {
  const _KitchenPortForm({Key? key}) : super(key: key);

  @override
  State<_KitchenPortForm> createState() => _KitchenPortFormState();
}

class _KitchenPortFormState extends State<_KitchenPortForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<TryState>();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _controller.text = _prefs.getString('kitchenPort')!;
      state.kitchenPort = _prefs.getString('kitchenPort')!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TryState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.kitchenPort!;
        }
        return Container(
            child: AppTextField(
          focusNode: _kitchenPortNode,
          controller: _controller,
          label: 'Kitchen Port',
          hint: '9100',
          keyboardType: TextInputType.text,
          errorText: state.kitchenPortHasError ? state.kitchenPortError : null,
          onChange: (v) => state.kitchenPort = v,
          onSubmitted: (v) => state.kitchenPort = v,
        ));
      },
    );
  }
}

class _CounterPortForm extends StatefulWidget {
  const _CounterPortForm({Key? key}) : super(key: key);

  @override
  State<_CounterPortForm> createState() => _CounterPortFormState();
}

class _CounterPortFormState extends State<_CounterPortForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<TryState>();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _controller.text = _prefs.getString('counterPort')!;
      state.counterPort = _prefs.getString('counterPort')!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TryState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.counterPort!;
        }
        return Container(
            child: AppTextField(
          focusNode: _counterPortNode,
          controller: _controller,
          label: 'Counter Port',
          hint: '9100',
          keyboardType: TextInputType.text,
          errorText: state.counterPortHasError ? state.counterPortError : null,
          onChange: (v) => state.counterPort = v,
          onSubmitted: (v) => state.counterPort = v,
        ));
      },
    );
  }
}

class _IPOfflineServerForm extends StatefulWidget {
  const _IPOfflineServerForm({Key? key}) : super(key: key);

  @override
  State<_IPOfflineServerForm> createState() => _IPOfflineServerFormState();
}

class _IPOfflineServerFormState extends State<_IPOfflineServerForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<TryState>();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _controller.text = _prefs.getString('IPServerOffline')!;
      state.IPServerOffline = _prefs.getString('IPServerOffline')!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TryState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.IPServerOffline!;
        }
        return Container(
            child: AppTextField(
          focusNode: _ipOfflineServerNode,
          controller: _controller,
          label: 'IP/Hostname Offline Server',
          hint: '192.168.0.49',
          keyboardType: TextInputType.text,
          onChange: (v) => state.IPServerOffline = v,
          onSubmitted: (v) => state.IPServerOffline = v,
        ));
      },
    );
  }
}
