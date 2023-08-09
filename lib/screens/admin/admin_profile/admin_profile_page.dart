import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AdminProfileState(),
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
    context.read<AdminProfileState>().getAdminProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProfileState>(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _ProfilePicture(),
        SizedBox(height: 8.0),
        _UserInformation(),
      ],
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProfileState>(
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
    return Consumer<AdminProfileState>(
      builder: (_, state, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppSize.widthScreen(context),
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
    return Consumer<AdminProfileState>(
      builder: (_, state, __) {
        return Column(
          children: [
            AppMenuTileCard(
              title: 'Payment Request',
              icon: Icons.monetization_on_outlined,
              onTap: () {
                AppRoute.push(context, RequestPaymentPage());
              },
            ),
            AppMenuTileCard(
              title: 'Products',
              icon: Icons.store,
              onTap: () {
                AppRoute.push(context, ProductsPage());
              },
            ),
            AppMenuTileCard(
              title: 'Sales',
              icon: Icons.auto_graph_sharp,
              onTap: () {
                AppRoute.push(context, SalesPage());
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
