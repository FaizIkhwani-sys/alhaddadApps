import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class HomePage extends StatelessWidget {
  final String? bearerToken;

  const HomePage({this.bearerToken, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageState(),
      child: _Body(
        bearerToken: bearerToken,
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final String? bearerToken;

  const _Body({this.bearerToken, Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    final state = context.read<HomePageState>();
    final settingState = context.read<SettingState>();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      state.bearerToken = _prefs.getString("BearerToken");
      print('home bearer ${state.bearerToken}');
      print('home bearer bukan state ${widget.bearerToken}');
    });

    // state.getBearerToken();
    state.getAll();
    settingState.getUtamaAll();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingState>(
      builder: (_, settingState, __) {
        return Consumer<HomePageState>(
          builder: (_, state, __) {
            return state.isLoading ||
                    settingState.isLoading ||
                    settingState.cartButton == null ||
                    settingState.androidVersion == null ||
                    settingState.iosVersion == null
                ? AppLoadingOverlay()
                : state.idJenisStokis == '448'
                    ? AppMainBar(
                        // hasDrawer: true,
                        title: page[state.selectedIndex]['title'],
                        bottomNavigationBar: _BottomNavigationBar(
                          bearerToken: widget.bearerToken,
                        ),
                        body: const _Content(),
                        actions: [
                          Platform.isAndroid
                              ? settingState.androidVersion![0].value ==
                                      state.androidVersion
                                  ? settingState.cartButton![0].value2! == '0'
                                      ? Container()
                                      : settingState.cartButton![0].value! ==
                                              '0'
                                          ? Container()
                                          : InkWell(
                                              onTap: () {
                                                AppRoute.push(
                                                    context, CartPage());
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
                                                child: Icon(
                                                  Icons.shopping_cart,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                  : InkWell(
                                      onTap: () {
                                        AppRoute.push(context, CartPage());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                              : settingState.iosVersion![0].value ==
                                      state.iOSVersion
                                  ? settingState.cartButton![0].value3! == '0'
                                      ? Container()
                                      : settingState.cartButton![0].value! ==
                                              '0'
                                          ? Container()
                                          : InkWell(
                                              onTap: () {
                                                AppRoute.push(
                                                    context, CartPage());
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
                                                child: Icon(
                                                  Icons.shopping_cart,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                  : InkWell(
                                      onTap: () {
                                        AppRoute.push(context, CartPage());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                        ],
                      )
                    : state.idJenisStokis == null || state.idJenisStokis == ''
                        ? AppMainBar(
                            // hasDrawer: true,
                            title: page[state.selectedIndex]['title'],
                            bottomNavigationBar: _BottomNavigationBar(
                              bearerToken: widget.bearerToken,
                            ),
                            body: const _Content(),
                            actions: [
                              Platform.isAndroid
                                  ? settingState.androidVersion![0].value ==
                                          state.androidVersion
                                      ? settingState.cartButton![0].value2! ==
                                              '0'
                                          ? Container()
                                          : settingState
                                                      .cartButton![0].value! ==
                                                  '0'
                                              ? Container()
                                              : InkWell(
                                                  onTap: () {
                                                    AppRoute.push(
                                                        context, CartPage());
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 10, 0),
                                                    child: Icon(
                                                      Icons.shopping_cart,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )
                                      : InkWell(
                                          onTap: () {
                                            AppRoute.push(context, CartPage());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            child: Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                  : settingState.iosVersion![0].value ==
                                          state.iOSVersion
                                      ? settingState.cartButton![0].value3! ==
                                              '0'
                                          ? Container()
                                          : settingState
                                                      .cartButton![0].value! ==
                                                  '0'
                                              ? Container()
                                              : InkWell(
                                                  onTap: () {
                                                    AppRoute.push(
                                                        context, CartPage());
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 10, 0),
                                                    child: Icon(
                                                      Icons.shopping_cart,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )
                                      : InkWell(
                                          onTap: () {
                                            AppRoute.push(context, CartPage());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            child: Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                            ],
                          )
                        : AppMainBar(
                            backgroundColor: backgroundColor,
                            title: pageRetailer[state.selectedIndex]['title'],
                            bottomNavigationBar: _BottomNavigationBarRetailer(),
                            body: _ContentRetailer());
          },
        );
      },
    );
  }
}

class _BottomNavigationBarRetailer extends StatelessWidget {
  const _BottomNavigationBarRetailer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.homeOutline),
              label: "Utama",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.people),
              label: "Membership",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          currentIndex: state.selectedIndex,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedFontSize: 12.0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: grayColor,
          selectedItemColor: primaryColor,
          onTap: (index) async {
            state.selectedIndex = index;
          },
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final String? bearerToken;

  const _BottomNavigationBar({this.bearerToken, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return Consumer<SettingState>(
          builder: (_, settingState, __) {
            return state.isLoading || settingState.isLoading
                ? AppLoadingOverlay()
                : Platform.isAndroid
                    ? settingState.androidVersion![0].value ==
                            state.androidVersion
                        ? settingState.transactionButton![0].value2! == '0'
                            ? BottomNavigationBar(
                                items: <BottomNavigationBarItem>[
                                  BottomNavigationBarItem(
                                    icon: Icon(EvaIcons.homeOutline),
                                    label: S.of(context).home,
                                  ),
                                  BottomNavigationBarItem(
                                    icon: Icon(Icons.qr_code_scanner),
                                    label: S.of(context).scan_Pay,
                                  ),
                                  BottomNavigationBarItem(
                                    icon: InkWell(
                                      onTap: () {
                                        if (bearerToken == null) {
                                          showDialog(
                                            useSafeArea: true,
                                            context: context,
                                            builder: (_) => AppAlertDialog(
                                              alertDialogType:
                                                  AlertDialogType.info,
                                              title:
                                                  'You are not an \nAl Haddad Team',
                                              subtitle:
                                                  'Please register to become Al Haddad Team',
                                              // description: 'Sila kemaskini maklumat anda.',
                                              actionButtons: [
                                                ActionButton(
                                                  label: 'Register',
                                                  onTap: () async {
                                                    SharedPreferences _prefs =
                                                        await SharedPreferences
                                                            .getInstance();

                                                    _prefs.remove('guestName');
                                                    _prefs.remove('guestEmail');
                                                    _prefs
                                                        .remove('guestNoPhone');
                                                    _prefs
                                                        .remove('guestAddress');
                                                    _prefs.remove(
                                                        'guestPostcode');
                                                    _prefs
                                                        .remove('guestBandar');
                                                    _prefs.remove(
                                                        'idNegeriGuest');
                                                    _prefs.remove(
                                                        'idDaerahGuest');

                                                    AppRoute.pushAndRemoveUntil(
                                                        context, SplashPage());
                                                  },
                                                  color: successColor,
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          state.selectedIndex = 3;
                                        }
                                      },
                                      child: Stack(
                                        children: [
                                          Icon(EvaIcons.messageSquareOutline),
                                          Positioned(
                                              right: 0,
                                              top: 0,
                                              child: CircleAvatar(
                                                radius: 6,
                                                backgroundColor: Colors.red,
                                                child: state.newNotiList ==
                                                            null ||
                                                        state.newNotiList == []
                                                    ? Container()
                                                    : TextManrope(
                                                        text:
                                                            '${state.newNotiList!.length}',
                                                      ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    label: S.of(context).messages,
                                  ),
                                  BottomNavigationBarItem(
                                    icon: InkWell(
                                        onTap: () {
                                          if (bearerToken == null) {
                                            showDialog(
                                              useSafeArea: true,
                                              context: context,
                                              builder: (_) => AppAlertDialog(
                                                alertDialogType:
                                                    AlertDialogType.info,
                                                title:
                                                    'You are not an \nAl Haddad Team',
                                                subtitle:
                                                    'Please register to become Al Haddad Team',
                                                // description: 'Sila kemaskini maklumat anda.',
                                                actionButtons: [
                                                  ActionButton(
                                                    label: 'Register',
                                                    onTap: () async {
                                                      SharedPreferences _prefs =
                                                          await SharedPreferences
                                                              .getInstance();

                                                      _prefs
                                                          .remove('guestName');
                                                      _prefs
                                                          .remove('guestEmail');
                                                      _prefs.remove(
                                                          'guestNoPhone');
                                                      _prefs.remove(
                                                          'guestAddress');
                                                      _prefs.remove(
                                                          'guestPostcode');
                                                      _prefs.remove(
                                                          'guestBandar');
                                                      _prefs.remove(
                                                          'idNegeriGuest');
                                                      _prefs.remove(
                                                          'idDaerahGuest');

                                                      AppRoute
                                                          .pushAndRemoveUntil(
                                                              context,
                                                              SplashPage());
                                                    },
                                                    color: successColor,
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            state.selectedIndex = 4;
                                          }
                                        },
                                        child: Icon(EvaIcons.personOutline)),
                                    label: S.of(context).my_Account,
                                  ),
                                ],
                                currentIndex: state.selectedIndex,
                                type: BottomNavigationBarType.fixed,
                                showUnselectedLabels: true,
                                selectedFontSize: 12.0,
                                selectedLabelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                unselectedItemColor: grayColor,
                                selectedItemColor: primaryColor,
                                onTap: (index) => state.selectedIndex = index,
                              )
                            : settingState.transactionButton![0].value! == '0'
                                ? BottomNavigationBar(
                                    items: <BottomNavigationBarItem>[
                                      BottomNavigationBarItem(
                                        icon: Icon(EvaIcons.homeOutline),
                                        label: S.of(context).home,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: Icon(Icons.qr_code_scanner),
                                        label: S.of(context).scan_Pay,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: InkWell(
                                          onTap: () {
                                            if (bearerToken == null) {
                                              showDialog(
                                                useSafeArea: true,
                                                context: context,
                                                builder: (_) => AppAlertDialog(
                                                  alertDialogType:
                                                      AlertDialogType.info,
                                                  title:
                                                      'You are not an \nAl Haddad Team',
                                                  subtitle:
                                                      'Please register to become Al Haddad Team',
                                                  // description: 'Sila kemaskini maklumat anda.',
                                                  actionButtons: [
                                                    ActionButton(
                                                      label: 'Register',
                                                      onTap: () async {
                                                        SharedPreferences
                                                            _prefs =
                                                            await SharedPreferences
                                                                .getInstance();

                                                        _prefs.remove(
                                                            'guestName');
                                                        _prefs.remove(
                                                            'guestEmail');
                                                        _prefs.remove(
                                                            'guestNoPhone');
                                                        _prefs.remove(
                                                            'guestAddress');
                                                        _prefs.remove(
                                                            'guestPostcode');
                                                        _prefs.remove(
                                                            'guestBandar');
                                                        _prefs.remove(
                                                            'idNegeriGuest');
                                                        _prefs.remove(
                                                            'idDaerahGuest');

                                                        AppRoute
                                                            .pushAndRemoveUntil(
                                                                context,
                                                                SplashPage());
                                                      },
                                                      color: successColor,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              state.selectedIndex = 3;
                                            }
                                          },
                                          child: Stack(
                                            children: [
                                              Icon(EvaIcons
                                                  .messageSquareOutline),
                                              Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: CircleAvatar(
                                                    radius: 6,
                                                    backgroundColor: Colors.red,
                                                    child: state.newNotiList ==
                                                                null ||
                                                            state.newNotiList ==
                                                                []
                                                        ? Container()
                                                        : TextManrope(
                                                            text:
                                                                '${state.newNotiList!.length}',
                                                          ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        label: S.of(context).messages,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: InkWell(
                                            onTap: () {
                                              if (bearerToken == null) {
                                                showDialog(
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (_) =>
                                                      AppAlertDialog(
                                                    alertDialogType:
                                                        AlertDialogType.info,
                                                    title:
                                                        'You are not an \nAl Haddad Team',
                                                    subtitle:
                                                        'Please register to become Al Haddad Team',
                                                    // description: 'Sila kemaskini maklumat anda.',
                                                    actionButtons: [
                                                      ActionButton(
                                                        label: 'Register',
                                                        onTap: () async {
                                                          SharedPreferences
                                                              _prefs =
                                                              await SharedPreferences
                                                                  .getInstance();

                                                          _prefs.remove(
                                                              'guestName');
                                                          _prefs.remove(
                                                              'guestEmail');
                                                          _prefs.remove(
                                                              'guestNoPhone');
                                                          _prefs.remove(
                                                              'guestAddress');
                                                          _prefs.remove(
                                                              'guestPostcode');
                                                          _prefs.remove(
                                                              'guestBandar');
                                                          _prefs.remove(
                                                              'idNegeriGuest');
                                                          _prefs.remove(
                                                              'idDaerahGuest');

                                                          AppRoute
                                                              .pushAndRemoveUntil(
                                                                  context,
                                                                  SplashPage());
                                                        },
                                                        color: successColor,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                state.selectedIndex = 4;
                                              }
                                            },
                                            child:
                                                Icon(EvaIcons.personOutline)),
                                        label: S.of(context).my_Account,
                                      ),
                                    ],
                                    currentIndex: state.selectedIndex,
                                    type: BottomNavigationBarType.fixed,
                                    showUnselectedLabels: true,
                                    selectedFontSize: 12.0,
                                    selectedLabelStyle: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    unselectedItemColor: grayColor,
                                    selectedItemColor: primaryColor,
                                    onTap: (index) =>
                                        state.selectedIndex = index,
                                  )
                                : BottomNavigationBar(
                                    items: <BottomNavigationBarItem>[
                                      BottomNavigationBarItem(
                                        icon: Icon(EvaIcons.homeOutline),
                                        label: S.of(context).home,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: InkWell(
                                            onTap: () {
                                              if (bearerToken == null) {
                                                showDialog(
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (_) =>
                                                      AppAlertDialog(
                                                    alertDialogType:
                                                        AlertDialogType.info,
                                                    title:
                                                        'You are not an \nAl Haddad Team',
                                                    subtitle:
                                                        'Please register to become Al Haddad Team',
                                                    // description: 'Sila kemaskini maklumat anda.',
                                                    actionButtons: [
                                                      ActionButton(
                                                        label: 'Register',
                                                        onTap: () async {
                                                          SharedPreferences
                                                              _prefs =
                                                              await SharedPreferences
                                                                  .getInstance();

                                                          _prefs.remove(
                                                              'guestName');
                                                          _prefs.remove(
                                                              'guestEmail');
                                                          _prefs.remove(
                                                              'guestNoPhone');
                                                          _prefs.remove(
                                                              'guestAddress');
                                                          _prefs.remove(
                                                              'guestPostcode');
                                                          _prefs.remove(
                                                              'guestBandar');
                                                          _prefs.remove(
                                                              'idNegeriGuest');
                                                          _prefs.remove(
                                                              'idDaerahGuest');

                                                          AppRoute
                                                              .pushAndRemoveUntil(
                                                                  context,
                                                                  SplashPage());
                                                        },
                                                        color: successColor,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                state.selectedIndex = 1;
                                              }
                                            },
                                            child: Icon(
                                                EvaIcons.briefcaseOutline)),
                                        label: S.of(context).transaction,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: Icon(Icons.qr_code_scanner),
                                        label: S.of(context).scan_Pay,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: InkWell(
                                          onTap: () {
                                            if (bearerToken == null) {
                                              showDialog(
                                                useSafeArea: true,
                                                context: context,
                                                builder: (_) => AppAlertDialog(
                                                  alertDialogType:
                                                      AlertDialogType.info,
                                                  title:
                                                      'You are not an \nAl Haddad Team',
                                                  subtitle:
                                                      'Please register to become Al Haddad Team',
                                                  // description: 'Sila kemaskini maklumat anda.',
                                                  actionButtons: [
                                                    ActionButton(
                                                      label: 'Register',
                                                      onTap: () async {
                                                        SharedPreferences
                                                            _prefs =
                                                            await SharedPreferences
                                                                .getInstance();

                                                        _prefs.remove(
                                                            'guestName');
                                                        _prefs.remove(
                                                            'guestEmail');
                                                        _prefs.remove(
                                                            'guestNoPhone');
                                                        _prefs.remove(
                                                            'guestAddress');
                                                        _prefs.remove(
                                                            'guestPostcode');
                                                        _prefs.remove(
                                                            'guestBandar');
                                                        _prefs.remove(
                                                            'idNegeriGuest');
                                                        _prefs.remove(
                                                            'idDaerahGuest');

                                                        AppRoute
                                                            .pushAndRemoveUntil(
                                                                context,
                                                                SplashPage());
                                                      },
                                                      color: successColor,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              state.selectedIndex = 3;
                                            }
                                          },
                                          child: Stack(
                                            children: [
                                              Icon(EvaIcons
                                                  .messageSquareOutline),
                                              Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: CircleAvatar(
                                                    radius: 6,
                                                    backgroundColor: Colors.red,
                                                    child: state.newNotiList ==
                                                                null ||
                                                            state.newNotiList ==
                                                                []
                                                        ? Container()
                                                        : TextManrope(
                                                            text:
                                                                '${state.newNotiList!.length}',
                                                          ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        label: S.of(context).messages,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: InkWell(
                                            onTap: () {
                                              if (bearerToken == null) {
                                                showDialog(
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (_) =>
                                                      AppAlertDialog(
                                                    alertDialogType:
                                                        AlertDialogType.info,
                                                    title:
                                                        'You are not an \nAl Haddad Team',
                                                    subtitle:
                                                        'Please register to become Al Haddad Team',
                                                    // description: 'Sila kemaskini maklumat anda.',
                                                    actionButtons: [
                                                      ActionButton(
                                                        label: 'Register',
                                                        onTap: () async {
                                                          SharedPreferences
                                                              _prefs =
                                                              await SharedPreferences
                                                                  .getInstance();

                                                          _prefs.remove(
                                                              'guestName');
                                                          _prefs.remove(
                                                              'guestEmail');
                                                          _prefs.remove(
                                                              'guestNoPhone');
                                                          _prefs.remove(
                                                              'guestAddress');
                                                          _prefs.remove(
                                                              'guestPostcode');
                                                          _prefs.remove(
                                                              'guestBandar');
                                                          _prefs.remove(
                                                              'idNegeriGuest');
                                                          _prefs.remove(
                                                              'idDaerahGuest');

                                                          AppRoute
                                                              .pushAndRemoveUntil(
                                                                  context,
                                                                  SplashPage());
                                                        },
                                                        color: successColor,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                state.selectedIndex = 4;
                                              }
                                            },
                                            child:
                                                Icon(EvaIcons.personOutline)),
                                        label: S.of(context).my_Account,
                                      ),
                                    ],
                                    currentIndex: state.selectedIndex,
                                    type: BottomNavigationBarType.fixed,
                                    showUnselectedLabels: true,
                                    selectedFontSize: 12.0,
                                    selectedLabelStyle: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    unselectedItemColor: grayColor,
                                    selectedItemColor: primaryColor,
                                    onTap: (index) =>
                                        state.selectedIndex = index,
                                  )
                        : BottomNavigationBar(
                            items: <BottomNavigationBarItem>[
                              BottomNavigationBarItem(
                                icon: Icon(EvaIcons.homeOutline),
                                label: S.of(context).home,
                              ),
                              BottomNavigationBarItem(
                                icon: InkWell(
                                    onTap: () {
                                      if (bearerToken == null) {
                                        showDialog(
                                          useSafeArea: true,
                                          context: context,
                                          builder: (_) => AppAlertDialog(
                                            alertDialogType:
                                                AlertDialogType.info,
                                            title:
                                                'You are not an \nAl Haddad Team',
                                            subtitle:
                                                'Please register to become Al Haddad Team',
                                            // description: 'Sila kemaskini maklumat anda.',
                                            actionButtons: [
                                              ActionButton(
                                                label: 'Register',
                                                onTap: () async {
                                                  SharedPreferences _prefs =
                                                      await SharedPreferences
                                                          .getInstance();

                                                  _prefs.remove('guestName');
                                                  _prefs.remove('guestEmail');
                                                  _prefs.remove('guestNoPhone');
                                                  _prefs.remove('guestAddress');
                                                  _prefs
                                                      .remove('guestPostcode');
                                                  _prefs.remove('guestBandar');
                                                  _prefs
                                                      .remove('idNegeriGuest');
                                                  _prefs
                                                      .remove('idDaerahGuest');

                                                  AppRoute.pushAndRemoveUntil(
                                                      context, SplashPage());
                                                },
                                                color: successColor,
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        state.selectedIndex = 1;
                                      }
                                    },
                                    child: Icon(EvaIcons.briefcaseOutline)),
                                label: S.of(context).transaction,
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.qr_code_scanner),
                                label: S.of(context).scan_Pay,
                              ),
                              BottomNavigationBarItem(
                                icon: InkWell(
                                  onTap: () {
                                    if (bearerToken == null) {
                                      showDialog(
                                        useSafeArea: true,
                                        context: context,
                                        builder: (_) => AppAlertDialog(
                                          alertDialogType: AlertDialogType.info,
                                          title:
                                              'You are not an \nAl Haddad Team',
                                          subtitle:
                                              'Please register to become Al Haddad Team',
                                          // description: 'Sila kemaskini maklumat anda.',
                                          actionButtons: [
                                            ActionButton(
                                              label: 'Register',
                                              onTap: () async {
                                                SharedPreferences _prefs =
                                                    await SharedPreferences
                                                        .getInstance();

                                                _prefs.remove('guestName');
                                                _prefs.remove('guestEmail');
                                                _prefs.remove('guestNoPhone');
                                                _prefs.remove('guestAddress');
                                                _prefs.remove('guestPostcode');
                                                _prefs.remove('guestBandar');
                                                _prefs.remove('idNegeriGuest');
                                                _prefs.remove('idDaerahGuest');

                                                AppRoute.pushAndRemoveUntil(
                                                    context, SplashPage());
                                              },
                                              color: successColor,
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      state.selectedIndex = 3;
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Icon(EvaIcons.messageSquareOutline),
                                      Positioned(
                                          right: 0,
                                          top: 0,
                                          child: state.newNotiList == null
                                              ? Container()
                                              : CircleAvatar(
                                                  radius: 6,
                                                  backgroundColor: Colors.red,
                                                  child: TextManrope(
                                                    text:
                                                        '${state.newNotiList!.length}',
                                                  ),
                                                ))
                                    ],
                                  ),
                                ),
                                label: S.of(context).messages,
                              ),
                              BottomNavigationBarItem(
                                icon: InkWell(
                                    onTap: () {
                                      if (bearerToken == null) {
                                        showDialog(
                                          useSafeArea: true,
                                          context: context,
                                          builder: (_) => AppAlertDialog(
                                            alertDialogType:
                                                AlertDialogType.info,
                                            title:
                                                'You are not an \nAl Haddad Team',
                                            subtitle:
                                                'Please register to become Al Haddad Team',
                                            // description: 'Sila kemaskini maklumat anda.',
                                            actionButtons: [
                                              ActionButton(
                                                label: 'Register',
                                                onTap: () async {
                                                  SharedPreferences _prefs =
                                                      await SharedPreferences
                                                          .getInstance();

                                                  _prefs.remove('guestName');
                                                  _prefs.remove('guestEmail');
                                                  _prefs.remove('guestNoPhone');
                                                  _prefs.remove('guestAddress');
                                                  _prefs
                                                      .remove('guestPostcode');
                                                  _prefs.remove('guestBandar');
                                                  _prefs
                                                      .remove('idNegeriGuest');
                                                  _prefs
                                                      .remove('idDaerahGuest');

                                                  AppRoute.pushAndRemoveUntil(
                                                      context, SplashPage());
                                                },
                                                color: successColor,
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        state.selectedIndex = 4;
                                      }
                                    },
                                    child: Icon(EvaIcons.personOutline)),
                                label: S.of(context).my_Account,
                              ),
                            ],
                            currentIndex: state.selectedIndex,
                            type: BottomNavigationBarType.fixed,
                            showUnselectedLabels: true,
                            selectedFontSize: 12.0,
                            selectedLabelStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            unselectedItemColor: grayColor,
                            selectedItemColor: primaryColor,
                            onTap: (index) {
                              state.selectedIndex = index;

                              if (state.selectedIndex == 2) {
                                state.getPreScan(context);
                              }
                            },
                          )
                    : settingState.iosVersion![0].value == state.iOSVersion
                        ? settingState.transactionButton![0].value3! == '0'
                            ? BottomNavigationBar(
                                items: <BottomNavigationBarItem>[
                                  BottomNavigationBarItem(
                                    icon: Icon(EvaIcons.homeOutline),
                                    label: S.of(context).home,
                                  ),
                                  BottomNavigationBarItem(
                                    icon: Icon(Icons.qr_code_scanner),
                                    label: S.of(context).scan_Pay,
                                  ),
                                  BottomNavigationBarItem(
                                    icon: InkWell(
                                      onTap: () {
                                        if (bearerToken == null) {
                                          showDialog(
                                            useSafeArea: true,
                                            context: context,
                                            builder: (_) => AppAlertDialog(
                                              alertDialogType:
                                                  AlertDialogType.info,
                                              title:
                                                  'You are not an \nAl Haddad Team',
                                              subtitle:
                                                  'Please register to become Al Haddad Team',
                                              // description: 'Sila kemaskini maklumat anda.',
                                              actionButtons: [
                                                ActionButton(
                                                  label: 'Register',
                                                  onTap: () async {
                                                    SharedPreferences _prefs =
                                                        await SharedPreferences
                                                            .getInstance();

                                                    _prefs.remove('guestName');
                                                    _prefs.remove('guestEmail');
                                                    _prefs
                                                        .remove('guestNoPhone');
                                                    _prefs
                                                        .remove('guestAddress');
                                                    _prefs.remove(
                                                        'guestPostcode');
                                                    _prefs
                                                        .remove('guestBandar');
                                                    _prefs.remove(
                                                        'idNegeriGuest');
                                                    _prefs.remove(
                                                        'idDaerahGuest');

                                                    AppRoute.pushAndRemoveUntil(
                                                        context, SplashPage());
                                                  },
                                                  color: successColor,
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          state.selectedIndex = 3;
                                        }
                                      },
                                      child: Stack(
                                        children: [
                                          Icon(EvaIcons.messageSquareOutline),
                                          Positioned(
                                              right: 0,
                                              top: 0,
                                              child: CircleAvatar(
                                                radius: 6,
                                                backgroundColor: Colors.red,
                                                child: state.newNotiList ==
                                                            null ||
                                                        state.newNotiList == []
                                                    ? Container()
                                                    : TextManrope(
                                                        text:
                                                            '${state.newNotiList!.length}',
                                                      ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    label: S.of(context).messages,
                                  ),
                                  BottomNavigationBarItem(
                                    icon: InkWell(
                                        onTap: () {
                                          if (bearerToken == null) {
                                            showDialog(
                                              useSafeArea: true,
                                              context: context,
                                              builder: (_) => AppAlertDialog(
                                                alertDialogType:
                                                    AlertDialogType.info,
                                                title:
                                                    'You are not an \nAl Haddad Team',
                                                subtitle:
                                                    'Please register to become Al Haddad Team',
                                                // description: 'Sila kemaskini maklumat anda.',
                                                actionButtons: [
                                                  ActionButton(
                                                    label: 'Register',
                                                    onTap: () async {
                                                      SharedPreferences _prefs =
                                                          await SharedPreferences
                                                              .getInstance();

                                                      _prefs
                                                          .remove('guestName');
                                                      _prefs
                                                          .remove('guestEmail');
                                                      _prefs.remove(
                                                          'guestNoPhone');
                                                      _prefs.remove(
                                                          'guestAddress');
                                                      _prefs.remove(
                                                          'guestPostcode');
                                                      _prefs.remove(
                                                          'guestBandar');
                                                      _prefs.remove(
                                                          'idNegeriGuest');
                                                      _prefs.remove(
                                                          'idDaerahGuest');

                                                      AppRoute
                                                          .pushAndRemoveUntil(
                                                              context,
                                                              SplashPage());
                                                    },
                                                    color: successColor,
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            state.selectedIndex = 4;
                                          }
                                        },
                                        child: Icon(EvaIcons.personOutline)),
                                    label: S.of(context).my_Account,
                                  ),
                                ],
                                currentIndex: state.selectedIndex,
                                type: BottomNavigationBarType.fixed,
                                showUnselectedLabels: true,
                                selectedFontSize: 12.0,
                                selectedLabelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                unselectedItemColor: grayColor,
                                selectedItemColor: primaryColor,
                                onTap: (index) => state.selectedIndex = index,
                              )
                            : settingState.transactionButton![0].value! == '0'
                                ? BottomNavigationBar(
                                    items: <BottomNavigationBarItem>[
                                      BottomNavigationBarItem(
                                        icon: Icon(EvaIcons.homeOutline),
                                        label: S.of(context).home,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: Icon(Icons.qr_code_scanner),
                                        label: S.of(context).scan_Pay,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: InkWell(
                                          onTap: () {
                                            if (bearerToken == null) {
                                              showDialog(
                                                useSafeArea: true,
                                                context: context,
                                                builder: (_) => AppAlertDialog(
                                                  alertDialogType:
                                                      AlertDialogType.info,
                                                  title:
                                                      'You are not an \nAl Haddad Team',
                                                  subtitle:
                                                      'Please register to become Al Haddad Team',
                                                  // description: 'Sila kemaskini maklumat anda.',
                                                  actionButtons: [
                                                    ActionButton(
                                                      label: 'Register',
                                                      onTap: () async {
                                                        SharedPreferences
                                                            _prefs =
                                                            await SharedPreferences
                                                                .getInstance();

                                                        _prefs.remove(
                                                            'guestName');
                                                        _prefs.remove(
                                                            'guestEmail');
                                                        _prefs.remove(
                                                            'guestNoPhone');
                                                        _prefs.remove(
                                                            'guestAddress');
                                                        _prefs.remove(
                                                            'guestPostcode');
                                                        _prefs.remove(
                                                            'guestBandar');
                                                        _prefs.remove(
                                                            'idNegeriGuest');
                                                        _prefs.remove(
                                                            'idDaerahGuest');

                                                        AppRoute
                                                            .pushAndRemoveUntil(
                                                                context,
                                                                SplashPage());
                                                      },
                                                      color: successColor,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              state.selectedIndex = 3;
                                            }
                                          },
                                          child: Stack(
                                            children: [
                                              Icon(EvaIcons
                                                  .messageSquareOutline),
                                              Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: CircleAvatar(
                                                    radius: 6,
                                                    backgroundColor: Colors.red,
                                                    child: state.newNotiList ==
                                                                null ||
                                                            state.newNotiList ==
                                                                []
                                                        ? Container()
                                                        : TextManrope(
                                                            text:
                                                                '${state.newNotiList!.length}',
                                                          ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        label: S.of(context).messages,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: InkWell(
                                            onTap: () {
                                              if (bearerToken == null) {
                                                showDialog(
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (_) =>
                                                      AppAlertDialog(
                                                    alertDialogType:
                                                        AlertDialogType.info,
                                                    title:
                                                        'You are not an \nAl Haddad Team',
                                                    subtitle:
                                                        'Please register to become Al Haddad Team',
                                                    // description: 'Sila kemaskini maklumat anda.',
                                                    actionButtons: [
                                                      ActionButton(
                                                        label: 'Register',
                                                        onTap: () async {
                                                          SharedPreferences
                                                              _prefs =
                                                              await SharedPreferences
                                                                  .getInstance();

                                                          _prefs.remove(
                                                              'guestName');
                                                          _prefs.remove(
                                                              'guestEmail');
                                                          _prefs.remove(
                                                              'guestNoPhone');
                                                          _prefs.remove(
                                                              'guestAddress');
                                                          _prefs.remove(
                                                              'guestPostcode');
                                                          _prefs.remove(
                                                              'guestBandar');
                                                          _prefs.remove(
                                                              'idNegeriGuest');
                                                          _prefs.remove(
                                                              'idDaerahGuest');

                                                          AppRoute
                                                              .pushAndRemoveUntil(
                                                                  context,
                                                                  SplashPage());
                                                        },
                                                        color: successColor,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                state.selectedIndex = 4;
                                              }
                                            },
                                            child:
                                                Icon(EvaIcons.personOutline)),
                                        label: S.of(context).my_Account,
                                      ),
                                    ],
                                    currentIndex: state.selectedIndex,
                                    type: BottomNavigationBarType.fixed,
                                    showUnselectedLabels: true,
                                    selectedFontSize: 12.0,
                                    selectedLabelStyle: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    unselectedItemColor: grayColor,
                                    selectedItemColor: primaryColor,
                                    onTap: (index) =>
                                        state.selectedIndex = index,
                                  )
                                : BottomNavigationBar(
                                    items: <BottomNavigationBarItem>[
                                      BottomNavigationBarItem(
                                        icon: Icon(EvaIcons.homeOutline),
                                        label: S.of(context).home,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: InkWell(
                                            onTap: () {
                                              if (bearerToken == null) {
                                                showDialog(
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (_) =>
                                                      AppAlertDialog(
                                                    alertDialogType:
                                                        AlertDialogType.info,
                                                    title:
                                                        'You are not an \nAl Haddad Team',
                                                    subtitle:
                                                        'Please register to become Al Haddad Team',
                                                    // description: 'Sila kemaskini maklumat anda.',
                                                    actionButtons: [
                                                      ActionButton(
                                                        label: 'Register',
                                                        onTap: () async {
                                                          SharedPreferences
                                                              _prefs =
                                                              await SharedPreferences
                                                                  .getInstance();

                                                          _prefs.remove(
                                                              'guestName');
                                                          _prefs.remove(
                                                              'guestEmail');
                                                          _prefs.remove(
                                                              'guestNoPhone');
                                                          _prefs.remove(
                                                              'guestAddress');
                                                          _prefs.remove(
                                                              'guestPostcode');
                                                          _prefs.remove(
                                                              'guestBandar');
                                                          _prefs.remove(
                                                              'idNegeriGuest');
                                                          _prefs.remove(
                                                              'idDaerahGuest');

                                                          AppRoute
                                                              .pushAndRemoveUntil(
                                                                  context,
                                                                  SplashPage());
                                                        },
                                                        color: successColor,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                state.selectedIndex = 1;
                                              }
                                            },
                                            child: Icon(
                                                EvaIcons.briefcaseOutline)),
                                        label: S.of(context).transaction,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: Icon(Icons.qr_code_scanner),
                                        label: S.of(context).scan_Pay,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: InkWell(
                                          onTap: () {
                                            if (bearerToken == null) {
                                              showDialog(
                                                useSafeArea: true,
                                                context: context,
                                                builder: (_) => AppAlertDialog(
                                                  alertDialogType:
                                                      AlertDialogType.info,
                                                  title:
                                                      'You are not an \nAl Haddad Team',
                                                  subtitle:
                                                      'Please register to become Al Haddad Team',
                                                  // description: 'Sila kemaskini maklumat anda.',
                                                  actionButtons: [
                                                    ActionButton(
                                                      label: 'Register',
                                                      onTap: () async {
                                                        SharedPreferences
                                                            _prefs =
                                                            await SharedPreferences
                                                                .getInstance();

                                                        _prefs.remove(
                                                            'guestName');
                                                        _prefs.remove(
                                                            'guestEmail');
                                                        _prefs.remove(
                                                            'guestNoPhone');
                                                        _prefs.remove(
                                                            'guestAddress');
                                                        _prefs.remove(
                                                            'guestPostcode');
                                                        _prefs.remove(
                                                            'guestBandar');
                                                        _prefs.remove(
                                                            'idNegeriGuest');
                                                        _prefs.remove(
                                                            'idDaerahGuest');

                                                        AppRoute
                                                            .pushAndRemoveUntil(
                                                                context,
                                                                SplashPage());
                                                      },
                                                      color: successColor,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              state.selectedIndex = 3;
                                            }
                                          },
                                          child: Stack(
                                            children: [
                                              Icon(EvaIcons
                                                  .messageSquareOutline),
                                              Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: CircleAvatar(
                                                    radius: 6,
                                                    backgroundColor: Colors.red,
                                                    child: state.newNotiList ==
                                                                null ||
                                                            state.newNotiList ==
                                                                []
                                                        ? Container()
                                                        : TextManrope(
                                                            text:
                                                                '${state.newNotiList!.length}',
                                                          ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        label: S.of(context).messages,
                                      ),
                                      BottomNavigationBarItem(
                                        icon: InkWell(
                                            onTap: () {
                                              if (bearerToken == null) {
                                                showDialog(
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (_) =>
                                                      AppAlertDialog(
                                                    alertDialogType:
                                                        AlertDialogType.info,
                                                    title:
                                                        'You are not an \nAl Haddad Team',
                                                    subtitle:
                                                        'Please register to become Al Haddad Team',
                                                    // description: 'Sila kemaskini maklumat anda.',
                                                    actionButtons: [
                                                      ActionButton(
                                                        label: 'Register',
                                                        onTap: () async {
                                                          SharedPreferences
                                                              _prefs =
                                                              await SharedPreferences
                                                                  .getInstance();

                                                          _prefs.remove(
                                                              'guestName');
                                                          _prefs.remove(
                                                              'guestEmail');
                                                          _prefs.remove(
                                                              'guestNoPhone');
                                                          _prefs.remove(
                                                              'guestAddress');
                                                          _prefs.remove(
                                                              'guestPostcode');
                                                          _prefs.remove(
                                                              'guestBandar');
                                                          _prefs.remove(
                                                              'idNegeriGuest');
                                                          _prefs.remove(
                                                              'idDaerahGuest');

                                                          AppRoute
                                                              .pushAndRemoveUntil(
                                                                  context,
                                                                  SplashPage());
                                                        },
                                                        color: successColor,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                state.selectedIndex = 4;
                                              }
                                            },
                                            child:
                                                Icon(EvaIcons.personOutline)),
                                        label: S.of(context).my_Account,
                                      ),
                                    ],
                                    currentIndex: state.selectedIndex,
                                    type: BottomNavigationBarType.fixed,
                                    showUnselectedLabels: true,
                                    selectedFontSize: 12.0,
                                    selectedLabelStyle: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    unselectedItemColor: grayColor,
                                    selectedItemColor: primaryColor,
                                    onTap: (index) =>
                                        state.selectedIndex = index,
                                  )
                        : BottomNavigationBar(
                            items: <BottomNavigationBarItem>[
                              BottomNavigationBarItem(
                                icon: Icon(EvaIcons.homeOutline),
                                label: S.of(context).home,
                              ),
                              BottomNavigationBarItem(
                                icon: InkWell(
                                    onTap: () {
                                      if (bearerToken == null) {
                                        showDialog(
                                          useSafeArea: true,
                                          context: context,
                                          builder: (_) => AppAlertDialog(
                                            alertDialogType:
                                                AlertDialogType.info,
                                            title:
                                                'You are not an \nAl Haddad Team',
                                            subtitle:
                                                'Please register to become Al Haddad Team',
                                            // description: 'Sila kemaskini maklumat anda.',
                                            actionButtons: [
                                              ActionButton(
                                                label: 'Register',
                                                onTap: () async {
                                                  SharedPreferences _prefs =
                                                      await SharedPreferences
                                                          .getInstance();

                                                  _prefs.remove('guestName');
                                                  _prefs.remove('guestEmail');
                                                  _prefs.remove('guestNoPhone');
                                                  _prefs.remove('guestAddress');
                                                  _prefs
                                                      .remove('guestPostcode');
                                                  _prefs.remove('guestBandar');
                                                  _prefs
                                                      .remove('idNegeriGuest');
                                                  _prefs
                                                      .remove('idDaerahGuest');

                                                  AppRoute.pushAndRemoveUntil(
                                                      context, SplashPage());
                                                },
                                                color: successColor,
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        state.selectedIndex = 1;
                                      }
                                    },
                                    child: Icon(EvaIcons.briefcaseOutline)),
                                label: S.of(context).transaction,
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.qr_code_scanner),
                                label: S.of(context).scan_Pay,
                              ),
                              BottomNavigationBarItem(
                                icon: InkWell(
                                  onTap: () {
                                    if (bearerToken == null) {
                                      showDialog(
                                        useSafeArea: true,
                                        context: context,
                                        builder: (_) => AppAlertDialog(
                                          alertDialogType: AlertDialogType.info,
                                          title:
                                              'You are not an \nAl Haddad Team',
                                          subtitle:
                                              'Please register to become Al Haddad Team',
                                          // description: 'Sila kemaskini maklumat anda.',
                                          actionButtons: [
                                            ActionButton(
                                              label: 'Register',
                                              onTap: () async {
                                                SharedPreferences _prefs =
                                                    await SharedPreferences
                                                        .getInstance();

                                                _prefs.remove('guestName');
                                                _prefs.remove('guestEmail');
                                                _prefs.remove('guestNoPhone');
                                                _prefs.remove('guestAddress');
                                                _prefs.remove('guestPostcode');
                                                _prefs.remove('guestBandar');
                                                _prefs.remove('idNegeriGuest');
                                                _prefs.remove('idDaerahGuest');

                                                AppRoute.pushAndRemoveUntil(
                                                    context, SplashPage());
                                              },
                                              color: successColor,
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      state.selectedIndex = 3;
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Icon(EvaIcons.messageSquareOutline),
                                      Positioned(
                                          right: 0,
                                          top: 0,
                                          child: CircleAvatar(
                                            radius: 6,
                                            backgroundColor: Colors.red,
                                            child: state.newNotiList == null ||
                                                    state.newNotiList == []
                                                ? Container()
                                                : TextManrope(
                                                    text:
                                                        '${state.newNotiList!.length}',
                                                  ),
                                          ))
                                    ],
                                  ),
                                ),
                                label: S.of(context).messages,
                              ),
                              BottomNavigationBarItem(
                                icon: InkWell(
                                    onTap: () {
                                      if (bearerToken == null) {
                                        showDialog(
                                          useSafeArea: true,
                                          context: context,
                                          builder: (_) => AppAlertDialog(
                                            alertDialogType:
                                                AlertDialogType.info,
                                            title:
                                                'You are not an \nAl Haddad Team',
                                            subtitle:
                                                'Please register to become Al Haddad Team',
                                            // description: 'Sila kemaskini maklumat anda.',
                                            actionButtons: [
                                              ActionButton(
                                                label: 'Register',
                                                onTap: () async {
                                                  SharedPreferences _prefs =
                                                      await SharedPreferences
                                                          .getInstance();

                                                  _prefs.remove('guestName');
                                                  _prefs.remove('guestEmail');
                                                  _prefs.remove('guestNoPhone');
                                                  _prefs.remove('guestAddress');
                                                  _prefs
                                                      .remove('guestPostcode');
                                                  _prefs.remove('guestBandar');
                                                  _prefs
                                                      .remove('idNegeriGuest');
                                                  _prefs
                                                      .remove('idDaerahGuest');

                                                  AppRoute.pushAndRemoveUntil(
                                                      context, SplashPage());
                                                },
                                                color: successColor,
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        state.selectedIndex = 4;
                                      }
                                    },
                                    child: Icon(EvaIcons.personOutline)),
                                label: S.of(context).my_Account,
                              ),
                            ],
                            currentIndex: state.selectedIndex,
                            type: BottomNavigationBarType.fixed,
                            showUnselectedLabels: true,
                            selectedFontSize: 12.0,
                            selectedLabelStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            unselectedItemColor: grayColor,
                            selectedItemColor: primaryColor,
                            onTap: (index) {
                              state.selectedIndex = index;
                            },
                          );
          },
        );
      },
    );
  }
}

class _ContentRetailer extends StatelessWidget {
  const _ContentRetailer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return pageRetailer[state.selectedIndex]['page'];
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingState>(
      builder: (_, settingState, __) {
        return Consumer<HomePageState>(
          builder: (_, state, __) {
            return state.isLoading && settingState.isLoading
                ? AppLoadingOverlay()
                : Platform.isAndroid
                    ? settingState.androidVersion![0].value ==
                            state.androidVersion
                        ? settingState.transactionButton![0].value2! == '0'
                            ? pageHide[state.selectedIndex]['page']
                            : settingState.transactionButton![0].value! == '0'
                                ? pageHide[state.selectedIndex]['page']
                                : page[state.selectedIndex]['page']
                        : page[state.selectedIndex]['page']
                    : settingState.iosVersion![0].value == state.iOSVersion
                        ? settingState.transactionButton![0].value3! == '0'
                            ? pageHide[state.selectedIndex]['page']
                            : settingState.transactionButton![0].value! == '0'
                                ? pageHide[state.selectedIndex]['page']
                                : page[state.selectedIndex]['page']
                        : page[state.selectedIndex]['page'];
          },
        );
      },
    );
  }
}
