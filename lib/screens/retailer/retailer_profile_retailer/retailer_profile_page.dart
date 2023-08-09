import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetailerProfilePage extends StatelessWidget {
  const RetailerProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RetailerProfileState(),
      child: SingleChildScrollView(
        child: _Body(),
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
    context.read<RetailerProfileState>().getProfilePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerProfileState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    _Profile(),
                    SizedBox(height: 24.0),
                    _MenuList(),
                  ],
                ),
              );
      },
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerProfileState>(
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
              size: AppSize.heightScreen(context) * 0.12,
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
    return Consumer<RetailerProfileState>(
      builder: (_, state, __) {
        return _AppProfilePicture(
          image: state.adminProfile![0].image,
        );
      },
    );
  }
}

class _UserInformation extends StatelessWidget {
  const _UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerProfileState>(
      builder: (_, state, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppSize.widthScreen(context) * 0.65,
              child: Text(
                state.adminProfile![0].namaPenuh!,
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
              state.adminProfile![0].tahapAkses!,
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
                          'https://alhaddad-admin.myrichappsproject.tk/register?noHeader=1&app=1&ref=${state.usersList![0].username}',
                      textAlign: TextAlign.left,
                      fontSize: 14,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(
                        text:
                            'https://alhaddad-admin.myrichappsproject.tk/register?noHeader=1&app=1&ref=${state.usersList![0].username}'));

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
    return Consumer<RetailerProfileState>(
      builder: (_, state, __) {
        return Column(
          children: [
            AppMenuTileCard(
              title: 'Request Hibah',
              icon: Icons.monetization_on_outlined,
              onTap: () {
                AppRoute.push(context, RetailerRequestPaymentPage());
              },
            ),
            AppMenuTileCard(
              title: 'Products',
              icon: Icons.store,
              onTap: () {
                AppRoute.push(context, RetailerStockPage());
              },
            ),
            AppMenuTileCard(
              title: 'Sales',
              icon: Icons.auto_graph_sharp,
              onTap: () {
                AppRoute.push(context, RetailerSalesPage());
              },
            ),
            AppMenuTileCard(
              title: 'Add Membership',
              icon: Icons.auto_graph_sharp,
              onTap: () async {
                SharedPreferences _prefs =
                    await SharedPreferences.getInstance();

                AppRoute.push(
                    context,
                    AddMembershipPage(
                        bearerToken: '${_prefs.getString('BearerToken')}'));
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

                  AppRoute.pushAndRemoveUntil(context, const SplashPage());
                }),
          ],
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
