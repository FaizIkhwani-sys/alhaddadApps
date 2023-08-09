import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

enum HeaderStyle {
  style1,
  style2,
}

class AppHeader extends StatelessWidget {
  final String label;
  final String? subtitle;
  final HeaderStyle headerStyle;

  const AppHeader({
    required this.label,
    this.subtitle,
    this.headerStyle = HeaderStyle.style1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (headerStyle == HeaderStyle.style1) {
      return _HeaderStyle1(label: label);
    }
    if (HeaderStyle.style2 == HeaderStyle.style2) {
      return _HeaderStyle2(
        label: label,
        subtitle: subtitle!,
      );
    }
    return Container();
  }
}

class _HeaderStyle1 extends StatelessWidget {
  final String label;

  const _HeaderStyle1({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperOne(),
      child: Container(
        height: 200.0,
        width: AppSize.widthScreen(context),
        color: lightColor,
        child: Column(
          children: [
            if (!label.isNullOrWhiteSpace)
              Text(
                label,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const _AppLogo(),
          ],
        ),
      ),
    );
  }
}

class _HeaderStyle2 extends StatelessWidget {
  final String label;
  final String subtitle;

  const _HeaderStyle2({
    required this.label,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: AppSize.widthScreen(context),
      child: Column(
        children: [
          const _AppLogo(),
          if (!label.isNullOrWhiteSpace)
            Text(
              label,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _AppLogo extends StatelessWidget {
  const _AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/logo_al_hadddad_PNG.png',
      width: 150.0,
      height: 150,
    );
  }
}
