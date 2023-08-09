import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

late FocusNode _userNameNode;
late FocusNode _passwordNode;

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  void initState() {
    super.initState();

    context.read<SettingState>().getLoginAdminButton();
    context.read<SettingState>().getSignUpButton();
    context.read<SettingState>().getSignUpURL();
    context.read<SettingState>().getAndroidVersion();
    context.read<SettingState>().getIOSVersion();
    context.read<LogInPageState>().version();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LogInPageState(),
      child: Consumer<SettingState>(
        builder: (_, settingState, __) {
          return Consumer<LogInPageState>(
            builder: (_, state, __) {
              return settingState.isLoading
                  ? AppLoadingOverlay()
                  : AppSecondaryBar(
                      hasBackButton: false,
                      appBarColor: lightColor,
                      backButtonColor: darkColor,
                      body: _Body(),
                      bottomNavigationBar: _BottomNavigationBar(),
                      actions: [
                        Platform.isAndroid
                            ? settingState.androidVersion![0].value ==
                                    state.androidVersion
                                ? settingState.loginAdminButton![0].value2! ==
                                        '0'
                                    ? Container()
                                    : settingState
                                                .loginAdminButton![0].value! ==
                                            '0'
                                        ? Container()
                                        : InkWell(
                                            onTap: () => AppRoute.push(
                                                context, LoginInAdminPage()),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.admin_panel_settings,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Text("Log-In Admin"),
                                                ),
                                              ],
                                            ),
                                          )
                                : InkWell(
                                    onTap: () => AppRoute.push(
                                        context, LoginInAdminPage()),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.admin_panel_settings,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Text("Log-In Admin"),
                                        ),
                                      ],
                                    ),
                                  )
                            : settingState.iosVersion![0].value ==
                                    state.iOSVersion
                                ? settingState.loginAdminButton![0].value3! ==
                                        '0'
                                    ? Container()
                                    : settingState
                                                .loginAdminButton![0].value! ==
                                            '0'
                                        ? Container()
                                        : InkWell(
                                            onTap: () => AppRoute.push(
                                                context, LoginInAdminPage()),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.admin_panel_settings,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Text("Log-In Admin"),
                                                ),
                                              ],
                                            ),
                                          )
                                : InkWell(
                                    onTap: () => AppRoute.push(
                                        context, LoginInAdminPage()),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.admin_panel_settings,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Text("Log-In Admin"),
                                        ),
                                      ],
                                    ),
                                  )

                        // InkWell(
                        //   onTap: () => AppRoute.push(context, LoginInAdminPage()),
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //         Icons.admin_panel_settings,
                        //       ),
                        //       Padding(
                        //         padding: EdgeInsets.only(right: 8.0),
                        //         child: Text("Log-In Admin"),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    );
            },
          );
        },
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
  // @override
  // void initState() {
  //   super.initState();
  //
  //   context.read<SettingState>().getLoginAdminButton();
  //   context.read<SettingState>().getSignUpButton();
  //   context.read<SettingState>().getSignUpURL();
  //   context.read<SettingState>().getAndroidVersion();
  //   context.read<SettingState>().getIOSVersion();
  // }

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
    return AppHeader(
      label: "${S.of(context).selamatKembali}",
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LogInPageState>(
      builder: (_, state, __) {
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
      ],
    );
  }
}

class _UserNameField extends StatelessWidget {
  const _UserNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LogInPageState>(
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
    return Consumer<LogInPageState>(
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
    return Consumer<SettingState>(
      builder: (_, settingState, __) {
        return Consumer<LogInPageState>(
          builder: (_, state, __) {
            return Column(
              children: [
                _LoginButton(),
                _PostSystemButton(),
                _ForgotPasswordButton(),
                SizedBox(height: 32.0),
                Platform.isAndroid
                    ? settingState.androidVersion![0].value ==
                            state.androidVersion
                        ? settingState.signUpButton![0].value2! == '0'
                            ? _RegisterButton(
                                url: settingState.signUpURL![0].value2,
                              )
                            : settingState.signUpButton![0].value! == '0'
                                ? _RegisterButton(
                                    url: settingState.signUpURL![0].value,
                                  )
                                : _RegisterButton(
                                    url:
                                        "https://alhaddad-admin.myrichappsproject.tk/register?noHeader=1&app=1",
                                  )
                        : _RegisterButton(
                            url:
                                "https://alhaddad-admin.myrichappsproject.tk/register?noHeader=1&app=1",
                          )
                    : settingState.iosVersion![0].value == state.iOSVersion
                        ? settingState.signUpButton![0].value3! == '0'
                            ? _RegisterButton(
                                url: settingState.signUpURL![0].value3,
                              )
                            : settingState.signUpButton![0].value! == '0'
                                ? _RegisterButton(
                                    url: settingState.signUpURL![0].value,
                                  )
                                : _RegisterButton(
                                    url:
                                        "https://alhaddad-admin.myrichappsproject.tk/register?noHeader=1&app=1",
                                  )
                        : _RegisterButton(
                            url:
                                "https://alhaddad-admin.myrichappsproject.tk/register?noHeader=1&app=1",
                          )
              ],
            );
          },
        );
      },
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

  Future<void> _onSubmitted(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    final state = context.read<LogInPageState>();

    state.validateAll();

    if (state.userNameHasError) {
      _userNameNode.requestFocus();
      return;
    }
    if (state.passwordHasError) {
      _passwordNode.requestFocus();
      return;
    }

    await _prefs.remove('orderId');

    final Future<Map<String, dynamic>?> response = state.login(context);
    response.then((response) {
      print('response user $response');
      if (response!['status']) {
        UserLogin user = response['user'];

        context.read<UserProvider>().setUser(user);

        AppRoute.pushAndRemoveUntil(
            context,
            HomePage(
              bearerToken: state.bearerToken,
            ));
      } else {}
    });
  }
}

class _PostSystemButton extends StatelessWidget {
  const _PostSystemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSubmitButton(
      title: 'POS SYSTEM',
      onTap: () => _onSubmitted(context),
    );
  }

  Future<void> _onSubmitted(BuildContext context) async {
    AppRoute.push(context, TryPage());
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRoute.push(context, const ForgotPasswordPage()),
      child: Text(
        S.of(context).lupa_kata_laluan,
        style: TextStyle(
          color: darkColor,
        ),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  final String? url;

  const _RegisterButton({this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRoute.push(
          context,
          RegisterWebViewPage(
            url: url,
          )),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: S.of(context).belum_daftar,
              style: TextStyle(
                color: darkColor,
              ),
            ),
            TextSpan(
              text: ' ${S.of(context).daftar}',
              style: TextStyle(color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Container(
        height: AppSize.heightScreen(context) * 0.1,
        child: Row(
          mainAxisAlignment: AppSize.mainEnd,
          children: [
            InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                await prefs.remove('BearerToken');

                AppRoute.pushAndRemoveUntil(
                    context, HomePage(bearerToken: null));
              },
              child: Card(
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: TextManrope(
                    text: 'SKIP',
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
