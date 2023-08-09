import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppRadioButton extends StatelessWidget {
  final String? label;
  final dynamic groupValue;
  final Function(dynamic)? onChange;
  final List<RadioListItem> radioList;
  final bool enable;
  final String? errorText;
  final bool selected;
  final bool toggleable;

  const AppRadioButton({
    Key? key,
    this.label,
    this.onChange,
    required this.radioList,
    required this.groupValue,
    this.enable = true,
    this.errorText,
    this.selected = false,
    this.toggleable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (!label.isNullOrWhiteSpace)
          Text(
            label!,
            style: const TextStyle(
              color: labelTextColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        const SizedBox(height: 8.0),
        ...List.generate(
          radioList.length,
          (index) {
            return Column(
              children: [
                RadioListTile<dynamic>(
                  selected: selected,
                  toggleable: toggleable,
                  tileColor: selected ? primaryColor : lightColor,
                  shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  activeColor: primaryColor,
                  title: Text(
                    radioList[index].title,
                    style: const TextStyle(
                      color: labelTextColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  selectedTileColor: primaryColor,
                  value: radioList[index].value,
                  groupValue: groupValue,
                  onChanged: enable ? onChange : null,
                ),
                const SizedBox(height: 8.0),
              ],
            );
          },
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
        const SizedBox(height: 16.0),
      ],
    );
  }
}

class RadioListItem {
  dynamic value;
  String title;

  RadioListItem(this.value, this.title);
}
