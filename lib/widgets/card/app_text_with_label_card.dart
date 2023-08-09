import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppTextWithLabelCard extends StatelessWidget {
  final Widget child;

  const AppTextWithLabelCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Card(child: child);
  }
}

class _Card extends StatelessWidget {
  final Widget child;

  const _Card({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.spaceX16),
      width: AppSize.widthScreen(context),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}

class AppTextWithLabel extends StatelessWidget {
  final String label;
  final String title;
  final bool isStatus;

  const AppTextWithLabel({
    Key? key,
    required this.label,
    required this.title,
    this.isStatus = false,
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
            fontSize: 11.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4.0),
        !isStatus
            ? Text(
                title,
                style: const TextStyle(
                  color: darkColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              )
            : const AppBadge(
                status: 'SELESAI BAYAR',
              ),
        SizedBox(height: AppSize.spaceX16),
      ],
    );
  }
}
