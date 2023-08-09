import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

late FocusNode _userNameNode;

class CheckMembershipPage extends StatelessWidget {
  const CheckMembershipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CheckMembershipPageState(),
      child: const AppSecondaryBar(
        appBarColor: lightColor,
        backButtonColor: darkColor,
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _Header(),
        _Content(),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppHeader(
      label: S.of(context).selamatKembali,
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            _Title(),
            SizedBox(height: 16.0),
            _Form(),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Semak Keahlian Alumni',
      style: TextStyle(
        color: darkColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  void initState() {
    super.initState();
    _userNameNode = FocusNode();
  }

  @override
  void dispose() {
    _userNameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _UserNameField(),
        _SubmitButton(),
      ],
    );
  }
}

class _UserNameField extends StatelessWidget {
  const _UserNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckMembershipPageState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _userNameNode,
          hint: S.of(context).hint_kad_pengenalan,
          maxLength: 12,
          keyboardType: TextInputType.number,
          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
          errorText: state.userNameHasError ? state.userNameError : null,
          onChange: (v) => state.userName = v,
          onSubmitted: (v) => state.userName = v,
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
      title: 'SEMAK KEAHLIAN',
      onTap: () => _onSubmitted(context),
    );
  }
}

Future<void> _onSubmitted(BuildContext context) async {
  final state = context.read<CheckMembershipPageState>();

  FocusScope.of(context).unfocus();

  state.validateAll();

  if (state.userNameHasError) {
    _userNameNode.requestFocus();
    return;
  }

  await _showAlertDialog(context);
}

Future _showAlertDialog(BuildContext context) async {
  await showDialog(
    useSafeArea: true,
    context: context,
    builder: (_) => AppAlertDialog(
      alertDialogType: AlertDialogType.success,
      title: 'Tahniah',
      subtitle: 'Anda merupakan Alumni Politeknik Seberang Perai.',
      description: 'Sila kemaskini maklumat anda.',
      actionButtons: [
        ActionButton(
          label: 'Log Masuk',
          onTap: () => AppRoute.pop(context),
          color: successColor,
        ),
      ],
    ),
  );
}
