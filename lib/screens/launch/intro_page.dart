import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: _Body());
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
          _Header(),
          _Button(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// <<<<<<< HEAD
    return SizedBox(
        height: 500.0,
        width: AppSize.widthScreen(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 80.0),
            _IntroLogo(),
            SizedBox(height: 8.0),
            _Title(),
            _Subtitle(),
          ],
        ));
// =======
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(height: 30.0),
        _IntroLogo(),
        SizedBox(height: 16.0),
        _Title(),
        _Subtitle(),
        SizedBox(height: 30.0),
      ],
    );
// >>>>>>> 0497a9fda4663dbcc656dd4875be22d36634bace
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Adakah Anda',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Alumni Politeknik dan Kolej Komuniti Seluruh Malaysia',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        color: grayColor,
      ),
    );
  }
}

class _IntroLogo extends StatelessWidget {
  const _IntroLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          'assets/images/intro.png',
          width: 210.0,
        ),
        Positioned(
          top: -60.0,
          left: -70.0,
          child: Image.asset(
            'assets/logo/mapcc.png',
            width: 150.0,
          ),
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _CheckMembershipButton(),
        _RegisterButton(),
      ],
    );
  }
}

class _CheckMembershipButton extends StatelessWidget {
  const _CheckMembershipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSubmitButton(
      title: 'SEMAK KEAHLIAN',
      onTap: () => AppRoute.push(context, const CheckMembershipPage()),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRoute.push(context, const LogInPage()),
      child: const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Anda telah mendaftar?',
              style: TextStyle(
                color: darkColor,
              ),
            ),
            TextSpan(
              text: ' Log Masuk',
              style: TextStyle(color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
