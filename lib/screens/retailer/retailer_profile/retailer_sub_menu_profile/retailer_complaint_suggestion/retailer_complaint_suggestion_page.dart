import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class RetailerComplaintAndSuggestionAdminPage extends StatelessWidget {
  const RetailerComplaintAndSuggestionAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppSecondaryBar(
      title: 'Aduan & Cadangan',
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _SupportPersonImage(),
          SizedBox(height: 48.0),
          _Title(),
          SizedBox(height: 16.0),
          _ContactDetails(),
        ],
      ),
    );
  }
}

class _SupportPersonImage extends StatelessWidget {
  const _SupportPersonImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/admin_support.png',
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Sebarang aduan dan cadangan boleh '
      'disampaikan melalui maklumat dibawah.',
      style: TextStyle(
        color: grayColor,
        fontSize: 16.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _ContactDetails extends StatelessWidget {
  const _ContactDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 16.0),
            children: [
              TextSpan(text: 'Telefon Kami - '),
              TextSpan(
                text: '+60 17XXXXXX',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 16.0),
            children: [
              TextSpan(text: 'E-Mel - '),
              TextSpan(
                text: 'alumnipolycc@psp.edu.my',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
