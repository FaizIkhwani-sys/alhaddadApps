import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

const _radius = Radius.circular(12.0);

class AppMembershipCard extends StatelessWidget {
  const AppMembershipCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _CardInfoSection(),
            _UserInfoSection(),
          ],
        ),
      ),
    );
  }
}

class _CardInfoSection extends StatelessWidget {
  const _CardInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Color(0xfff7f8f8),
        borderRadius: BorderRadius.only(
          topLeft: _radius,
          topRight: _radius,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Flexible(
                child: Text(
                  'Alumni Politeknik Seberang Perai',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AppProfilePicture(radius: 25.0)
            ],
          ),
          const SizedBox(height: 16.0),
          const Text(
            '2820 **** **** 2098',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 20.0,
              letterSpacing: 3.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _UserInfoSection extends StatelessWidget {
  const _UserInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: _radius,
          bottomRight: _radius,
        ),
      ),
      child: Row(
        children: const [
          _InfoLabel(
            label: 'PEMEGANG KAD',
            value: 'Faiz Karim',
          ),
          SizedBox(width: 16.0),
          _InfoLabel(
            label: 'SEJAK',
            value: '12/05',
          ),
        ],
      ),
    );
  }
}

class _InfoLabel extends StatelessWidget {
  final String label;
  final String? value;

  const _InfoLabel({
    required this.label,
    this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: grayColor,
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
