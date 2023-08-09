import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppMainBar extends StatelessWidget {
  final Color backgroundColor;
  final Color appBarColor;
  final String title;
  final Widget body;
  final bool centerTitle;
  final bool showLoading;
  final double? elevation;
  final Color? colorLoading;
  final Widget? bottomNavigationBar;
  final bool hasDrawer;
  final bool leading;
  final List<Widget>? actions;
  final bool? hasBackButton;

  const AppMainBar({
    this.backgroundColor = Colors.white,
    this.appBarColor = primaryColor,
    required this.title,
    required this.body,
    this.showLoading = false,
    this.centerTitle = true,
    this.elevation = 0.0,
    this.colorLoading,
    this.bottomNavigationBar,
    this.hasDrawer = false,
    this.leading = false,
    this.actions,
    this.hasBackButton = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomePageState(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        drawer: hasDrawer
            ? Drawer(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        _DrawerHeader(),
                        _DrawerMenuList(),
                      ],
                    ),
                  ),
                ),
              )
            : null,
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: appBarColor == Colors.transparent ? 0.0 : elevation,
          centerTitle: centerTitle,
          backgroundColor: appBarColor,
          // leading: hasBackButton!
          //     ? BackButton(
          //   onPressed: () => AppRoute.pop(context),
          //   color: Colors.black,
          // )
          //     : Container(),
          actions: actions,
        ),
        bottomNavigationBar: bottomNavigationBar,
        body: body,
      ),
    );
  }
}

class _DrawerHeader extends StatefulWidget {
  const _DrawerHeader({Key? key}) : super(key: key);

  @override
  State<_DrawerHeader> createState() => _DrawerHeaderState();
}

class _DrawerHeaderState extends State<_DrawerHeader> {
  @override
  void initState() {
    context.read<HomePageState>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            AssetImage("assets/images/membership_try10.jpg")),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: AppSize.widthScreen(context) * 0.8,
                          child: RichText(
                            text: TextSpan(
                              text: 'Hello, ',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Manrope",
                                color: primaryColor,
                              ),
                              children: [
                                TextSpan(
                                  text: state.profileList![0].namaPenuh ?? '',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Manrope",
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    // letterSpacing: 0.96,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              );
      },
    );
  }
}

class _DrawerMenuList extends StatelessWidget {
  const _DrawerMenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DrawerMenu(
              title: 'View Profile',
              onTap: () => {AppRoute.push(context, ProfileAdminPage())},
            ),
            _DrawerMenu(
              title: 'Favourite Address',
              onTap: () => {},
            ),
            _DrawerMenu(
              title: 'Payment Method',
              onTap: () => {},
            ),
            _DrawerMenu(
              title: 'Help Center',
              onTap: () => {},
            ),
            _DrawerMenu(
              title: 'Tell a Friend',
              onTap: () => {},
            ),
            _DrawerMenu(
              title: 'Stay Connected',
              onTap: () => {},
            ),
            _DrawerMenu(
              title: 'Terms & Conditions',
              onTap: () => {},
            ),
            _DrawerMenu(
              title: 'Privacy Policy',
              onTap: () => {},
            ),
            _DrawerMenu(
              title: 'Log Out',
              onTap: () async {
                SharedPreferences _prefs =
                    await SharedPreferences.getInstance();

                _prefs.remove('BearerToken');
                _prefs.remove('userName');
                _prefs.remove('jenisUser');
                _prefs.remove('userId');
                _prefs.remove('profileId');
                _prefs.remove('token');
                _prefs.remove('firebaseToken');
                _prefs.remove('idJenisStokis');
                _prefs.remove('userEmail');

                AppRoute.pushAndRemoveUntil(context, const SplashPage());
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _DrawerMenu extends StatelessWidget {
  final String title;
  final Function() onTap;

  const _DrawerMenu({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
