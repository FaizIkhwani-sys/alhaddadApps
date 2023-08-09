import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

late FocusNode _userNameNode;

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgotPasswordPageState(),
      child: const AppSecondaryBar(
        body: _Body(),
        appBarColor: lightColor,
        backButtonColor: darkColor,
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
      label: S.of(context).lupa_kata_laluan,
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSize.spaceX16),
      child: Column(
        children: const [
          _Title(),
          SizedBox(height: 24.0),
          _Form(),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).lupa_kata_laluan_des,
      style: TextStyle(
        color: darkColor,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
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
    return Consumer<ForgotPasswordPageState>(
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
      title: S.of(context).hantar,
      onTap: () => _onSubmitted(context),
    );
  }
}

Future<void> _onSubmitted(BuildContext context) async {
  final state = context.read<ForgotPasswordPageState>();

  _userNameNode.unfocus();

  state.validateAll();

  if (state.userNameHasError) {
    _userNameNode.requestFocus();
    return;
  }

  await state.forgotPassword();
  AppSnackBar.showSnackBar(context, S.of(context).berjaya_tukar_password);
}
