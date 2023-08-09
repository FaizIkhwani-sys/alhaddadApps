import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppCheckBox extends StatelessWidget {
  final bool value;
  final bool selected;
  final ValueChanged<bool?> onChange;
  final String title;
  final Widget? subtitle;
  final String? errorText;

  const AppCheckBox({
    required this.value,
    this.selected = false,
    required this.onChange,
    required this.title,
    this.subtitle,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          value: value,
          selected: selected,
          activeColor: primaryColor,
          checkColor: Colors.white,
          contentPadding: const EdgeInsets.all(0),
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          onChanged: onChange,
          title: Text(
            title,
          ),
          subtitle: subtitle,
        ),
        if (!errorText.isNullOrWhiteSpace)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12.0,
              ),
            ),
          ),
      ],
    );
  }
}
