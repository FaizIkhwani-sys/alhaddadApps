import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

late FocusNode _emailNode;
late FocusNode _confirmPasswordNode;
late FocusNode _passwordNode;
late FocusNode _reasonNode;

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DeleteAccountState(),
      child: const AppSecondaryBar(
        title: "Delete Account",
        body: Padding(
          padding: EdgeInsets.all(18.0),
          child: _Body(),
        ),
      ),
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

    final state = context.read<DeleteAccountState>();

    state.getAll();

    _emailNode = FocusNode();
    _confirmPasswordNode = FocusNode();
    _passwordNode = FocusNode();
    _reasonNode = FocusNode();
  }

  @override
  void dispose() {
    _emailNode.dispose();
    _confirmPasswordNode.dispose();
    _passwordNode.dispose();
    _reasonNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          _BodyText(),
          SizedBox(
            height: 15,
          ),
          _EmailForm(),
          _Password(),
          _PasswordConfirm(),
          _ReasonDelete(),
          _SendButton(),
        ],
      ),
    );
  }
}

class _EmailForm extends StatefulWidget {
  const _EmailForm({Key? key}) : super(key: key);

  @override
  State<_EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<_EmailForm> {
  @override
  void initState() {
    super.initState();
    _emailNode = FocusNode();
  }

  @override
  void dispose() {
    _emailNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DeleteAccountState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _emailNode,
          hint: 'Email',
          errorText: state.emailHasError ? state.emailError : null,
          onChange: (v) => state.email = v,
          onSubmitted: (v) => state.email = v,
        );
      },
    );
  }
}

class _Password extends StatelessWidget {
  const _Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DeleteAccountState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _passwordNode,
          hint: 'Password',
          isPassword: true,
          errorText: state.passwordHasError ? state.passwordError : null,
          onChange: (v) => state.password = v,
          onSubmitted: (v) => state.password = v,
        );
      },
    );
  }
}

class _PasswordConfirm extends StatelessWidget {
  const _PasswordConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DeleteAccountState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _confirmPasswordNode,
          hint: 'Confirm Password',
          isPassword: true,
          errorText:
              state.confirmPasswordHasError ? state.confirmPasswordError : null,
          onChange: (v) => state.confirmPassword = v,
          onSubmitted: (v) => state.confirmPassword = v,
        );
      },
    );
  }
}

class _ReasonDelete extends StatelessWidget {
  const _ReasonDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DeleteAccountState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _reasonNode,
          hint: 'Reason',
          maxLine: 5,
          errorText: state.reasonHasError ? state.reasonError : null,
          onChange: (v) => state.reason = v,
          onSubmitted: (v) => state.reason = v,
        );
      },
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DeleteAccountState>(
      builder: (context, state, child) {
        return Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: AppSubmitButton(
                  onTap: () {
                    state.validateAll();

                    if (state.emailHasError) {
                      _emailNode.requestFocus();
                      return;
                    }
                    if (state.passwordHasError) {
                      _passwordNode.requestFocus();
                      return;
                    }
                    if (state.confirmPasswordHasError) {
                      _confirmPasswordNode.requestFocus();
                      return;
                    }
                    if (state.reasonHasError) {
                      _reasonNode.requestFocus();
                      return;
                    }

                    state.postDeleteAccount(context);
                  },
                  btnColor: dangerColor,
                  title: 'DELETE'),
            ),
          ],
        );
      },
    );
  }
}

class _BodyText extends StatelessWidget {
  const _BodyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Maklumat anda yang disimpan menerusi "
            "aplikasi ini telah dilindungi oleh Akta "
            "709 (Akta Perlindungan Data Peribadi 2010) "
            "serta dijamin selamat."),
        SizedBox(
          height: 10,
        ),
        Text("Kami telah mengambil langkah-langkah "
            "berkaitan untuk membenarkan anda mengemaskini "
            "atau menambah maklumat peribadi anda."),
        SizedBox(
          height: 10,
        ),
        Text("Sekiranya anda berhasrat untuk memadam"
            " keahlian serta data anda daripada sistem, "
            "sila isi ruang di bawah."),
      ],
    );
  }
}
