import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppAlumniCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String subtitle2;
  final String? status;
  final VoidCallback? onTap;

  const AppAlumniCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.subtitle2,
    this.status,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSize.spaceX16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TitleText(title: title),
            SizedBox(height: AppSize.spaceX8),
            _SubtitleText(subtitle: subtitle),
            SizedBox(height: AppSize.spaceX6),
            _SubtitleText2(
              subtitle2: subtitle2,
              status: status!,
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  final String title;

  const _TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: darkColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _SubtitleText extends StatelessWidget {
  final String subtitle;

  const _SubtitleText({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          EvaIcons.person,
          size: 20.0,
          color: darkColor.withOpacity(0.6),
        ),
        const SizedBox(width: 8.0),
        Text(
          subtitle,
          style: TextStyle(
            color: darkColor.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

class _SubtitleText2 extends StatelessWidget {
  final String subtitle2;
  final String status;

  const _SubtitleText2({
    Key? key,
    required this.subtitle2,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          EvaIcons.file,
          size: 20.0,
          color: darkColor.withOpacity(0.6),
        ),
        const SizedBox(width: 8.0),
        Text(
          subtitle2,
          style: TextStyle(
            color: darkColor.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        AppBadge(status: status),
      ],
    );
  }
}
