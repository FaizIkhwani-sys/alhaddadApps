import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class ProfileRetailerPage extends StatelessWidget {
  const ProfileRetailerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSecondaryBar(
      hasBackButton: true,
      title: "Pofile",
        body: _Body());
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          _Profile(),
          SizedBox(height: 24.0),
          _MenuList(),
        ],
      ),
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _ProfilePicture(),
            SizedBox(height: 8.0),
            _UserInformation(),
          ],
        ),
        // _MembershipCardSection(),
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
    return const AppProfilePicture();
  }
}

class _UserInformation extends StatelessWidget {
  const _UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Sarimah Ibrahim',
          style: TextStyle(
            color: darkColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 2.0),
        Text(
          'Al Haddad Members',
          style: TextStyle(
            color: grayColor,
            fontSize: 12.0,
          ),
        ),
      ],
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
    return Column(
      children: [
        AppMenuTileCard(
          title: 'Mengurus Profil',
          icon: EvaIcons.personOutline,
          onTap: () => {},
        ),
        // AppMenuTileCard(
        //   title: 'Alumni',
        //   icon: EvaIcons.peopleOutline,
        //   onTap: () => AppRoute.push(context, const AlumniPage()),
        // ),
        AppMenuTileCard(
          title: 'Aduan & Cadangan',
          icon: EvaIcons.alertTriangleOutline,
          onTap: () => {}
        ),
        AppMenuTileCard(
          title: 'Terma & Syarat',
          icon: EvaIcons.infoOutline,
          onTap: () {},
        ),
        AppMenuTileCard(
          title: 'Log Keluar',
          textColor: dangerColor,
          iconColor: dangerColor,
          icon: EvaIcons.logOutOutline,
          onTap: () => AppRoute.pushAndRemoveUntil(context, const SplashPage()),
        ),
      ],
    );
  }
}
