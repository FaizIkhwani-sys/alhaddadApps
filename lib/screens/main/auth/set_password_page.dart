import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

late FocusNode _emailNode;
late FocusNode _passwordNode;

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SetPasswordPageState(),
      child: const AppSecondaryBar(
        appBarColor: Colors.transparent,
        backButtonColor: Colors.black,
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
      label: 'Hi, ${S.of(context).selamatDatang}',
      subtitle: 'ke MyAlumni PolyCC',
      headerStyle: HeaderStyle.style2,
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SetPasswordPageState>(
      builder: (_, state, __) {
        return const SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: _Form(),
        );
      },
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
    _emailNode = FocusNode();
    _passwordNode = FocusNode();
  }

  @override
  void dispose() {
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 32.0),
        _EmailField(),
        _PasswordField(),
        SizedBox(height: 16.0),
        _UpdateButton(),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SetPasswordPageState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _emailNode,
          label: 'E-Mail',
          hint: 'Masukkan Email',
          keyboardType: TextInputType.emailAddress,
          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
          errorText: state.emailHasError ? state.emailError : null,
          onChange: (v) => state.email = v,
          onSubmitted: (v) => state.email = v,
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SetPasswordPageState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _passwordNode,
          label: 'Kata Laluan',
          hint: 'Masukkan Kata Laluan',
          isPassword: true,
          errorText: state.passwordHasError ? state.passwordError : null,
          onChange: (v) => state.password = v,
          onSubmitted: (v) => state.password = v,
        );
      },
    );
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSubmitButton(
      title: 'KEMASKINI',
      onTap: () => _onSubmitted(context),
    );
  }
}

Future<void> _onSubmitted(BuildContext context) async {
  final state = context.read<SetPasswordPageState>();

  FocusScope.of(context).unfocus();

  state.validateAll();

  if (state.emailHasError) {
    _emailNode.requestFocus();
    return;
  }
  if (state.passwordHasError) {
    _passwordNode.requestFocus();
    return;
  }
}
