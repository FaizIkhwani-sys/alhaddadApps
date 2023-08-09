import 'package:apps_al_haddad/screens/main/profile/sub_menu_profile/bank_setting/bank_setting_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileState(),
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
    context.read<HomePageState>().getProfilePage();
    context.read<SettingState>().getPrivacyURL();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      final state = context.read<ProfileState>();
      state.idJenisStokis = _prefs.getString('idJenisStokis');
      print(state.idJenisStokis);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    _Header(),
                    SizedBox(height: 24.0),
                    _MenuList(),
                  ],
                ),
              );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Profile(),
      ],
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return Row(
          mainAxisAlignment: AppSize.mainSpaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _ProfilePicture(),
                SizedBox(height: 8.0),
                _UserInformation(),
              ],
            ),
            QrImage(
              data:
                  'https://alhaddad-admin.myrichappsproject.tk/register?noHeader=1&app=1&reff=${state.usersList![0].username}',
              size: AppSize.heightScreen(context) * 0.15,
              version: QrVersions.auto,
            )
          ],
        );
      },
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return _AppProfilePicture(
          image: state.profileList![0].image,
        );
      },
    );
  }
}

class _UserInformation extends StatelessWidget {
  const _UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              // width: AppSize.widthScreen(context),
              child: Text(
                state.profileList![0].namaPenuh!,
                maxLines: 3,
                style: TextStyle(
                  color: darkColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              'Al Haddad Team',
              style: TextStyle(
                color: grayColor,
                fontSize: 12.0,
              ),
            ),
            SizedBox(height: 2.0),
            state.upLine == null
                ? Container()
                : Text(
                    'Upline: ${state.upLine![0].namaPenuh}',
                    style: TextStyle(
                      color: grayColor,
                      fontSize: 12.0,
                    ),
                  ),
            SizedBox(height: 4.0),
            Row(
              crossAxisAlignment: AppSize.crossCenter,
              children: [
                Container(
                  width: AppSize.widthScreen(context) * 0.5,
                  height: AppSize.heightScreen(context) * 0.04,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.4),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.all(5.5),
                    child: TextManrope(
                      text:
                          'https://alhaddad-admin.myrichappsproject.tk/register?noHeader=1&app=1&reff=${state.usersList![0].username}',
                      textAlign: TextAlign.left,
                      fontSize: 14,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(
                        text:
                            'https://alhaddad-admin.myrichappsproject.tk/register?noHeader=1&app=1&reff=${state.usersList![0].username}'));

                    Fluttertoast.showToast(msg: 'Text copied to clipboard');
                  },
                  child: Container(
                    height: AppSize.heightScreen(context) * 0.04,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.4),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.copy,
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

class _MembershipCardSection extends StatelessWidget {
  const _MembershipCardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _MembershipCardButton(),
        SizedBox(height: 8.0),
        _QrCode(),
      ],
    );
  }
}

class _MembershipCardButton extends StatelessWidget {
  const _MembershipCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => _showMembershipCard(context),
      color: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: const Text(
        'Kad Keahlian',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

void _showMembershipCard(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (_) {
      return const _MembershipCard();
    },
  );
}

class _MembershipCard extends StatelessWidget {
  const _MembershipCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppMembershipCard();
  }
}

class _QrCode extends StatelessWidget {
  const _QrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/dummy/qr_code.png',
      width: 60.0,
    );
  }
}

class _MenuList extends StatelessWidget {
  const _MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingState>(
      builder: (_, settingState, __) {
        return Consumer<ProfileState>(
          builder: (_, state, __) {
            return Column(
              children: [
                AppMenuTileCard(
                  title: 'Profile Setting',
                  icon: EvaIcons.personOutline,
                  onTap: () {
                    AppRoute.push(context, ProfileSettingPage());
                  },
                ),
                AppMenuTileCard(
                  title: 'Address Setting',
                  icon: Icons.home_work_outlined,
                  onTap: () {
                    AppRoute.push(context, AddressSettingPage());
                  },
                ),
                AppMenuTileCard(
                  title: 'Bank Setting',
                  icon: Icons.monetization_on_outlined,
                  onTap: () {
                    AppRoute.push(context, BankSettingPage());
                  },
                ),
                AppMenuTileCard(
                  title: 'Hibah',
                  icon: Icons.star_outline,
                  onTap: () {
                    AppRoute.push(context, PointsPage());
                  },
                ),
                if (state.idJenisStokis == '448')
                  AppMenuTileCard(
                    title: 'Membership List',
                    icon: Icons.people_outline,
                    onTap: () async {
                      SharedPreferences _prefs =
                          await SharedPreferences.getInstance();

                      String? bearer = _prefs.getString('BearerToken');

                      AppRoute.push(
                          context,
                          MembershipListPage(
                            bearer: bearer,
                          ));
                    },
                  ),
                AppMenuTileCard(
                  title: 'Terms & Condition',
                  icon: EvaIcons.infoOutline,
                  onTap: () {
                    AppRoute.push(
                        context,
                        TermsAndConditionPage(
                          url: settingState.privacyURL![0].value!,
                        ));
                  },
                ),
                AppMenuTileCard(
                  title: 'Delete Account',
                  icon: EvaIcons.infoOutline,
                  onTap: () {
                    AppRoute.push(context, const DeleteAccount());
                  },
                ),
                AppMenuTileCard(
                    title: 'Log Keluar',
                    textColor: dangerColor,
                    iconColor: dangerColor,
                    icon: EvaIcons.logOutOutline,
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
                      _prefs.remove('orderId');
                      _prefs.remove('orderIdList');

                      AppRoute.pushAndRemoveUntil(context, const SplashPage());
                    }),
              ],
            );
          },
        );
      },
    );
  }
}

class _AppProfilePicture extends StatelessWidget {
  final double radius;
  final String? image;

  const _AppProfilePicture({
    this.radius = 50.0,
    this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: grayColor,
        radius: radius,
        backgroundImage: NetworkImage(imageURl + image!),
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PointsState(),
      child: AppSecondaryBar(
        title: 'Setting',
        body: _BodySetting(),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class _BodySetting extends StatelessWidget {
  const _BodySetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
