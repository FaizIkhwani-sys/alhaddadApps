import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

late FocusNode _userNameNode;
late FocusNode _passwordNode;

class LoginInAdminPage extends StatelessWidget {
  const LoginInAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LogInAdminState(),
      child: AppSecondaryBar(
        hasBackButton: false,
        appBarColor: lightColor,
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
      children: [
        _Header(),
        _Content(),
        Container(),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      label: "${S.of(context).selamatKembali} Al Haddad Admin",
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LogInAdminState>(
      builder: (_, state, __) {
        return Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppSize.spaceX16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                _Title(),
                SizedBox(height: 16.0),
                // _TabBar(),
                _FormAdmin(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).logMasuk,
      style: TextStyle(
        color: darkColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          Container(
            color: primaryColor,
            child: TabBar(
              tabs: [
                Tab(text: 'Stokis/Agent'),
                Tab(text: 'Admin'),
              ],
            ),
          ),
          SizedBox(height: 32.0),
          Container(
            height: 400.0,
            child: TabBarView(
              children: [
                _FormStokis(),
                _FormAdmin(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FormAdmin extends StatefulWidget {
  const _FormAdmin({Key? key}) : super(key: key);

  @override
  _FormAdminState createState() => _FormAdminState();
}

class _FormAdminState extends State<_FormAdmin> {
  @override
  void initState() {
    super.initState();
    _userNameNode = FocusNode();
    _passwordNode = FocusNode();
  }

  @override
  void dispose() {
    _userNameNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _UserNameField(),
        _PasswordField(),
        SizedBox(height: 16.0),
        _Buttons(),
      ],
    );
  }
}

class _FormStokis extends StatefulWidget {
  const _FormStokis({Key? key}) : super(key: key);

  @override
  __FormStokisState createState() => __FormStokisState();
}

class __FormStokisState extends State<_FormStokis> {
  @override
  void initState() {
    super.initState();
    _userNameNode = FocusNode();
    _passwordNode = FocusNode();
  }

  // @override
  // void dispose() {
  //   _userNameNode.dispose();
  //   _passwordNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _UserNameField(),
        _PasswordField(),
        SizedBox(height: 16.0),
        _Buttons(),
        SizedBox(height: 8.0),
      ],
    );
  }
}

class _UserNameField extends StatelessWidget {
  const _UserNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LogInAdminState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _userNameNode,
          hint: "Username",
          // maxLength: 12,
          keyboardType: TextInputType.text,
          errorText: state.userNameHasError ? state.userNameError : null,
          onChange: (v) => state.userName = v,
          onSubmitted: (v) => state.userName = v,
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LogInAdminState>(
      builder: (_, state, __) {
        return AppTextField(
          focusNode: _passwordNode,
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

class _Buttons extends StatelessWidget {
  const _Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [_LoginButton(), _RegisterButton()],
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSubmitButton(
      title: S.of(context).logMasuk,
      onTap: () => _onSubmitted(context),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRoute.push(context, RegisterAgentStokisPage()),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Belum Mendaftar Sebagai Stokis? ',
              style: TextStyle(
                color: darkColor,
              ),
            ),
            TextSpan(
              text: S.of(context).daftar,
              style: TextStyle(
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _onSubmitted(BuildContext context) async {
  final state = context.read<LogInAdminState>();

  FocusScope.of(context).unfocus();

  state.validateAll();

  if (state.userNameHasError) {
    _userNameNode.requestFocus();
    return;
  }
  if (state.passwordHasError) {
    _passwordNode.requestFocus();
    return;
  }
  final Future<Map<String, dynamic>?> response = state.login(context);
  response.then((response) {
    print('response admin $response');
    if (response!['status']) {
      AdminLogin user = response['user'];

      context.read<AdminProvider>().setUser(user);

      print('login ${state.userName} mmm');

      AppRoute.pushAndRemoveUntil(
          context,
          AdminHomePage(
            userId: state.userName,
          ));
    } else {
      print("TAK JALAN");
    }
  });
  // AppRoute.pushAndRemoveUntil(context, AdminHomePage());

  //
}
