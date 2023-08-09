import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class AppRadioButtonListTile extends StatelessWidget {
  final String? label;
  final dynamic groupValue;
  final void Function(dynamic) onChange;
  final List<RadioListItem1> radioList;
  final bool? enable;
  final String? errorText;

  const AppRadioButtonListTile({
    Key? key,
    this.label,
    required this.onChange,
    required this.radioList,
    required this.groupValue,
    this.enable = true,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null)
          Text(
            label ?? '',
            style: TextStyle(
              color: labelTextColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ...List.generate(
          radioList.length,
              (index) {
            return RadioListTile<dynamic>(
              title: Text(
                radioList[index].title,
                style: TextStyle(
                    color: labelTextColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Muli'
                ),
              ),
              value: radioList[index].value,
              groupValue: groupValue,
              onChanged:  onChange  ,
            );
          },
        ),
        if (!errorText.isNullOrWhiteSpace)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              errorText!,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12.0,
              ),
            ),
          ),
      ],
    );
  }
}

class RadioListItem1 {
  dynamic value;
  String title;

  RadioListItem1(this.value, this.title);
}