import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

late FocusNode _nameNode;
late FocusNode _userNameNode;
late FocusNode _phoneNode;
late FocusNode _emailNode;
late FocusNode _passwordNode;

class RegisterAgentStokisPage extends StatelessWidget {
  const RegisterAgentStokisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RegisterAgentStokisState(),
      child:
          AppSecondaryBar(
              title: "Pendaftaran Agent",
              body: _Body()),
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
      label: S.of(context).selamatDatang,
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.spaceX16),
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
    return  Text(
      S.of(context).pendaftaran,
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
    _nameNode = FocusNode();
    _userNameNode = FocusNode();
    _phoneNode = FocusNode();
    _emailNode = FocusNode();
    _passwordNode = FocusNode();
  }

  @override
  void dispose() {
    _nameNode.dispose();
    _userNameNode.dispose();
    _phoneNode.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterAgentStokisState>(
      builder: (_, state, __) {
        //final studentType = state.studentType;
        return Column(
          children: [
            const _NameField(),
            const _PhoneField(),
            const _EmailField(),
            const _UserNameField(),
            const _PasswordField(),
            const _TermsAndCondition(),
            const SizedBox(height: 16.0),
            const _RegisterButton(),
          ],
        );
      },
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterAgentStokisState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _nameNode,
          label: S.of(context).nama_penuh,
          hint: S.of(context).nama_penuh,
          errorText: state.nameHasError ? state.nameError : null,
          onChange: (v) => state.name = v,
          onSubmitted: (v) => state.name = v,
        );
      },
    );
  }
}

class _UserNameField extends StatelessWidget {
  const _UserNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterAgentStokisState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _userNameNode,
          label: S.of(context).id_pengguna,
          hint: S.of(context).id_pengguna,
          keyboardType: TextInputType.text,
          errorText: state.userNameHasError ? state.userNameError : null,
          onChange: (v) => state.userName = v,
          onSubmitted: (v) => state.userName = v,
        );
      },
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterAgentStokisState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _phoneNode,
          label: S.of(context).no_tel,
          hint: S.of(context).no_tel,
          keyboardType: TextInputType.number,
          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
          errorText: state.phoneHasError ? state.phoneError : null,
          onChange: (v) => state.phone = v,
          onSubmitted: (v) => state.phone = v,
        );
      },
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterAgentStokisState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _emailNode,
          label: S.of(context).email,
          hint: S.of(context).alamat_email,
          keyboardType: TextInputType.emailAddress,
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
    return Consumer<RegisterAgentStokisState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _passwordNode,
          label: S.of(context).hint_kata_laluan,
          hint: S.of(context).hint_kata_laluan,
          isPassword: true,
          errorText: state.passwordHasError ? state.passwordError : null,
          onChange: (v) => state.password = v,
          onSubmitted: (v) => state.password = v,
        );
      },
    );
  }
}

class _TermsAndCondition extends StatelessWidget {
  const _TermsAndCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterAgentStokisState>(
      builder: (_, state, __) {
        return AppCheckBox(
          value: state.termsAndCondition,
          onChange: (v) => state.termsAndCondition = v!,
          title: S.of(context).agreement,
          subtitle: GestureDetector(
            onTap: () {},
            child:  Text(
              S.of(context).terma_syarat,
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSubmitButton(
      title: 'DAFTAR AKAUN',
      onTap: () => _onSubmitted(context),
    );
  }
}

Future<void> _onSubmitted(BuildContext context) async {
  final state = context.read<RegisterAgentStokisState>();

  FocusScope.of(context).unfocus();

  state.validateAll();

  if (state.nameHasError) {
    _nameNode.requestFocus();
    return;
  }
  if (state.userNameHasError) {
    _userNameNode.requestFocus();
    return;
  }
  if (state.phoneHasError) {
    _phoneNode.requestFocus();
    return;
  }
  if (state.emailHasError) {
    _emailNode.requestFocus();
    return;
  }
  if (state.passwordHasError) {
    _passwordNode.requestFocus();
    return;
  }

  // await state.register();

  return;
}
